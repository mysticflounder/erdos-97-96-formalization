/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Placement
import Erdos9796Proof.P97.ATail.CriticalPairFrontier
import Erdos9796Proof.P97.ATail.ExactFifteenApexProfile
import Erdos9796Proof.P97.ATail.BlockerVExactFifteenFourRowCoverage
import Erdos9796Proof.P97.ATail.BlockerVExactSixteenFourRowCoverage
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSourceNormalForm
import Erdos9796Proof.P97.ATail.FiveCenterDeletionBoundary
import Erdos9796Proof.P97.U5GlobalIncidenceQDeletedTetrahedron
import Mathlib.Order.Fin.Basic

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailApexRichClassStructure
open ATailBiApexBlockerMultiplicity
open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailBlockerMultiplicityGeometry
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailCommonDeletionTwoCenter
open ATailCriticalFiberClosingCore
open ATailCriticalFiberRetainedRadiusSelector
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailExactFifteenApexProfile
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

/-- Explicit names for the two rigid row companions in the source-row-heavy
cross-row branch.  The packet also records the exact five-class cover, the
actual source-blocker identity, and the complete source-row interior trace. -/
structure ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) : Type where
  xu : ℝ²
  xv : ℝ²
  xu_ne_u : xu ≠ P.u.1
  xv_ne_v : xv ≠ P.v.1
  source_row_trace :
    ((lateFirstApexSystem R).selectedAt
        P.u.1 P.u.2).toCriticalFourShell.support ∩
      SelectedClass D.A S.oppApex2 P.rho = {P.u.1, xu}
  opposite_row_trace :
    ((lateFirstApexSystem R).selectedAt
        P.v.1 P.v.2).toCriticalFourShell.support ∩
      SelectedClass D.A S.oppApex2 P.rho = {P.v.1, xv}
  physical_class :
    SelectedClass D.A S.oppApex2 P.rho =
      insert P.jointDeletion.deleted.1
        ({P.u.1, xu} ∪ {P.v.1, xv})
  blocker_eq_xv :
    (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv
  source_pair_interior :
    ({P.u.1, xu} : Finset ℝ²) ∩
        S.capInteriorByIndex S.oppIndex2 =
      {P.u.1, xu}

/-- The rigid `2+2+1` data and the heavy-row cardinality equality construct
the explicit source-heavy packet without any additional geometric
assumption. -/
private noncomputable def
    exactFourRigid221_sourceEqU_blockerVRowOther_sourceHeavyPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho)
    (hblockerNeV :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1)
    (hsourceRowHeavy : P.sourceRowInteriorCount = 2) :
    ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P := by
  classical
  let C := SelectedClass D.A S.oppApex2 P.rho
  let Iu :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell.support ∩ C
  let Iv :=
    ((lateFirstApexSystem R).selectedAt
      P.v.1 P.v.2).toCriticalFourShell.support ∩ C
  rcases (show
      Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
        C = insert P.jointDeletion.deleted.1 (Iu ∪ Iv) by
      simpa [C, Iu, Iv] using P.globalDeletion.rigid) with
    ⟨hIuCard, hIvCard, _hdisjoint, hCeq⟩
  have huIu : P.u.1 ∈ Iu := by
    exact Finset.mem_inter.mpr
      ⟨((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.q_mem_support,
        P.huClass⟩
  have hvIv : P.v.1 ∈ Iv := by
    exact Finset.mem_inter.mpr
      ⟨((lateFirstApexSystem R).selectedAt
          P.v.1 P.v.2).toCriticalFourShell.q_mem_support,
        P.hvClass⟩
  have companion_of_card_two
      (J : Finset ℝ²) (q : ℝ²)
      (hJCard : J.card = 2) (hqJ : q ∈ J) :
      ∃ x : ℝ², x ≠ q ∧ J = {q, x} := by
    obtain ⟨a, b, hab, hJ⟩ := Finset.card_eq_two.mp hJCard
    have hqa : q = a ∨ q = b := by
      rw [hJ] at hqJ
      simpa only [Finset.mem_insert, Finset.mem_singleton] using hqJ
    rcases hqa with rfl | rfl
    · exact ⟨b, Ne.symm hab, hJ⟩
    · refine ⟨a, hab, ?_⟩
      rw [hJ]
      ext z
      simp only [Finset.mem_insert, Finset.mem_singleton]
      tauto
  let xuWitness :=
    companion_of_card_two Iu P.u.1 hIuCard huIu
  let xu := Classical.choose xuWitness
  have hxuSpec := Classical.choose_spec xuWitness
  have hxuNe : xu ≠ P.u.1 := hxuSpec.1
  have hIuEq : Iu = {P.u.1, xu} := hxuSpec.2
  let xvWitness :=
    companion_of_card_two Iv P.v.1 hIvCard hvIv
  let xv := Classical.choose xvWitness
  have hxvSpec := Classical.choose_spec xvWitness
  have hxvNe : xv ≠ P.v.1 := hxvSpec.1
  have hIvEq : Iv = {P.v.1, xv} := hxvSpec.2
  have hblockerIv :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈ Iv := by
    simpa [Iv, C] using hblockerVRow
  have hblockerEqXv :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv := by
    rw [hIvEq] at hblockerIv
    simp only [Finset.mem_insert, Finset.mem_singleton] at hblockerIv
    rcases hblockerIv with hblockerEqV | hblockerEqXv
    · exact (hblockerNeV hblockerEqV).elim
    · exact hblockerEqXv
  have hsourceIntersectionCard :
      (Iu ∩ S.capInteriorByIndex S.oppIndex2).card = 2 := by
    simpa [
      ExactFourRigid221PhysicalApexSourceEqUContext.sourceRowInteriorCount,
      Iu, C] using hsourceRowHeavy
  have hpairInterior :
      ({P.u.1, xu} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 =
        {P.u.1, xu} := by
    rw [hIuEq] at hsourceIntersectionCard
    apply Finset.eq_of_subset_of_card_le Finset.inter_subset_left
    rw [hsourceIntersectionCard]
    exact Finset.card_insert_le P.u.1 {xu}
  exact
    { xu := xu
      xv := xv
      xu_ne_u := hxuNe
      xv_ne_v := hxvNe
      source_row_trace := by simpa [Iu, C] using hIuEq
      opposite_row_trace := by simpa [Iv, C] using hIvEq
      physical_class := by simpa [C, hIuEq, hIvEq] using hCeq
      blocker_eq_xv := hblockerEqXv
      source_pair_interior := hpairInterior }

/-- The named opposite-row point `xv` lies in the strict physical second-cap
interior.  It is the blocker center of the heavy source row, hence
equidistant from the interior pair `u`, `xu`, and the two-center cap
localization places any such fresh center in the same strict interior.  No
cap-profile input is consumed. -/
theorem exactFourRigid221_sourceHeavy_xv_mem_secondCapInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P) :
    packet.xv ∈ S.capInteriorByIndex S.oppIndex2 := by
  classical
  let K :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell
  have hblockerU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [P.huSource] using packet.blocker_eq_xv
  have hxuMem :
      packet.xu ∈ K.support ∩ SelectedClass D.A S.oppApex2 P.rho := by
    simpa [K, packet.source_row_trace]
  have hxuSupport : packet.xu ∈ K.support :=
    (Finset.mem_inter.mp hxuMem).1
  have hxuClass :
      packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxuMem).2
  have hxvMem :
      packet.xv ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    simpa [packet.opposite_row_trace]
  have hxvClass :
      packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxvMem).2
  have hxvA : packet.xv ∈ D.A := (mem_selectedClass.mp hxvClass).1
  have hpairSubset :
      ({P.u.1, packet.xu} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.oppIndex2 := by
    intro z hz
    have hzInter :
        z ∈ ({P.u.1, packet.xu} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 := by
      rw [packet.source_pair_interior]
      exact hz
    exact (Finset.mem_inter.mp hzInter).2
  have huInterior : P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 :=
    hpairSubset (by simp)
  have hxuInterior : packet.xu ∈ S.capInteriorByIndex S.oppIndex2 :=
    hpairSubset (by simp)
  have hcenterNe : packet.xv ≠ S.oppApex2 := by
    intro h
    have hxvDist := (mem_selectedClass.mp hxvClass).2
    rw [h] at hxvDist
    simp only [dist_self] at hxvDist
    linarith [P.hrho]
  apply commonPhysicalPair_center_mem_secondCapInterior
    hxvA hcenterNe huInterior hxuInterior packet.xu_ne_u.symm
  · exact
      (by
        simpa [K, hblockerU] using
          (K.support_eq_radius P.u.1 K.q_mem_support).trans
            (K.support_eq_radius packet.xu hxuSupport).symm)
  · exact
      (mem_selectedClass.mp P.huClass).2.trans
        (mem_selectedClass.mp hxuClass).2.symm

/-- With the exact-five physical second cap, the three-point strict interior
is exhausted by `u`, `xu`, `xv`, so the retained contextual peer — an
interior class point avoiding the source row — is forced to be `xv`. -/
theorem exactFourRigid221_sourceHeavy_exactFive_other_eq_xv
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxvInterior : packet.xv ∈ S.capInteriorByIndex S.oppIndex2)
    (hinterior :
      (S.capInteriorByIndex S.oppIndex2).card = 3) :
    P.other.1 = packet.xv := by
  classical
  let K :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell
  have hblockerU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [P.huSource] using packet.blocker_eq_xv
  have huSupport : P.u.1 ∈ K.support := K.q_mem_support
  have hxuMem :
      packet.xu ∈ K.support ∩ SelectedClass D.A S.oppApex2 P.rho := by
    simpa [K, packet.source_row_trace]
  have hxuSupport : packet.xu ∈ K.support :=
    (Finset.mem_inter.mp hxuMem).1
  have hxvNotSupport : packet.xv ∉ K.support := by
    intro hxv
    have hmemEq :
        ((lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈ K.support) =
          (packet.xv ∈ K.support) :=
      congrArg (fun z : ℝ² => z ∈ K.support) hblockerU
    exact K.center_not_mem_support (hmemEq.mpr hxv)
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply hxvNotSupport
    rw [← h]
    exact huSupport
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply hxvNotSupport
    rw [← h]
    exact hxuSupport
  have hpairSubset :
      ({P.u.1, packet.xu} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.oppIndex2 := by
    intro z hz
    have hzInter :
        z ∈ ({P.u.1, packet.xu} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 := by
      rw [packet.source_pair_interior]
      exact hz
    exact (Finset.mem_inter.mp hzInter).2
  have htripleSubset :
      ({P.u.1, packet.xu, packet.xv} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.oppIndex2 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact hpairSubset (by simp)
    · exact hpairSubset (by simp)
    · exact hxvInterior
  have htripleCard :
      ({P.u.1, packet.xu, packet.xv} : Finset ℝ²).card = 3 := by
    simp [packet.xu_ne_u.symm, huNeXv, hxuNeXv]
  have hinteriorEq :
      S.capInteriorByIndex S.oppIndex2 =
        {P.u.1, packet.xu, packet.xv} := by
    apply Eq.symm
    apply Finset.eq_of_subset_of_card_le htripleSubset
    rw [hinterior, htripleCard]
  have hotherJ := P.context.other_mem_interior
  rw [hinteriorEq] at hotherJ
  simp only [Finset.mem_insert, Finset.mem_singleton] at hotherJ
  have hsourceRowEq :
      ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support =
        ((lateFirstApexSystem R).selectedAt
          P.source.1 P.source.2).toCriticalFourShell.support :=
    congrArg
      (fun z : CarrierVertex D.A =>
        ((lateFirstApexSystem R).selectedAt
          z.1 z.2).toCriticalFourShell.support)
      P.huSource
  rcases hotherJ with hu | hxu | hxv
  · exfalso
    apply P.context.other_not_mem_source_row
    rw [hu, ← hsourceRowEq]
    exact huSupport
  · exfalso
    apply P.context.other_not_mem_source_row
    rw [hxu, ← hsourceRowEq]
    exact hxuSupport
  · exact hxv

private theorem capByIndex_oppIndex2_eq_oppCap2_sourceHeavy
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- Exhaustive physical-second-cap profile below the source-heavy
`other = xv` placement.  The exact-five constructors retain the full
carrier-cardinality budget belonging to their robust-growth arm. -/
inductive ExactFourRigid221SourceHeavyOtherXvCapProfile
    {D : CounterexampleData} (S : SurplusCapPacket D.A) : Prop
  | secondOppositeLarge
      (secondOppCap_card_ge_six : 6 ≤ S.oppCap2.card)
      (secondInterior_card_ge_four :
        4 ≤ (S.capInteriorByIndex S.oppIndex2).card)
      (robust_growth : ExactFourRobustCapGrowth S)
  | secondOppositeExactFiveSurplusGrowth
      (secondOppCap_card_eq_five : S.oppCap2.card = 5)
      (secondInterior_card_eq_three :
        (S.capInteriorByIndex S.oppIndex2).card = 3)
      (surplusCap_card_ge_six : 6 ≤ S.surplusCap.card)
      (surplus_first_card_add_two_eq_carrier :
        S.surplusCap.card + S.oppCap1.card + 2 = D.A.card)
      (surplus_first_card_ge_ten :
        10 ≤ S.surplusCap.card + S.oppCap1.card)
  | secondOppositeExactFiveFirstGrowth
      (secondOppCap_card_eq_five : S.oppCap2.card = 5)
      (secondInterior_card_eq_three :
        (S.capInteriorByIndex S.oppIndex2).card = 3)
      (profile : ExactFourFirstOppositeCapGrowth S)
      (firstOppCap_card_add_seven_eq_carrier :
        S.oppCap1.card + 7 = D.A.card)

/-- The robust-cap-growth trichotomy, specialized to the physical second cap,
is an arithmetic consequence of the complete production context. -/
theorem exactFourRigid221_sourceHeavyOtherXv_capProfile
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) :
    ExactFourRigid221SourceHeavyOtherXvCapProfile S := by
  have hinteriorCard :=
    ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
      S S.oppIndex2
  rw [capByIndex_oppIndex2_eq_oppCap2_sourceHeavy S] at hinteriorCard
  by_cases hsecond : 6 ≤ S.oppCap2.card
  · exact .secondOppositeLarge hsecond (by omega) P.surface.capGrowth
  have hsecondEq : S.oppCap2.card = 5 := by
    have hfive := P.surface.secondOppCap_card_ge_five
    omega
  have hinteriorEq :
      (S.capInteriorByIndex S.oppIndex2).card = 3 := by
    omega
  rcases P.surface.capGrowth with hsurplus | hfirst | hsecondGrowth
  · have hbudget :
        S.surplusCap.card + S.oppCap1.card + 2 = D.A.card := by
      have hsum := S.capSum
      omega
    exact .secondOppositeExactFiveSurplusGrowth
      hsecondEq hinteriorEq hsurplus hbudget (by
        have hcard := P.hcard
        omega)
  · have hcarrier :
        S.oppCap1.card + 7 = D.A.card := by
      have hsum := hfirst.oppositeCaps_card_add_two_eq_carrier
      omega
    exact .secondOppositeExactFiveFirstGrowth
      hsecondEq hinteriorEq hfirst hcarrier
  · exact (hsecond hsecondGrowth.secondOppCap_card_ge_six).elim

/-- The complete point placement forced by the exact-five physical-second-cap
arms.  The three named interior points exhaust the physical second-cap
interior, while `v` and the rigid deleted point occupy opposite adjacent
caps.  This packet is derived from the live source-heavy hypotheses alone and
is independent of the robust-cap-growth profile, so both the first-growth and
surplus-growth exact-five arms produce it. -/
structure ExactFourRigid221SourceHeavyOtherXvExactFivePlacementPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P) :
    Prop where
  secondOppCap_card_eq_five : S.oppCap2.card = 5
  secondInterior_eq_named :
    S.capInteriorByIndex S.oppIndex2 =
      {P.u.1, packet.xu, packet.xv}
  v_not_mem_secondInterior :
    P.v.1 ∉ S.capInteriorByIndex S.oppIndex2
  deleted_not_mem_secondInterior :
    P.jointDeletion.deleted.1 ∉
      S.capInteriorByIndex S.oppIndex2
  other_point_eq_xv : P.other.1 = packet.xv
  source_blocker_eq_other_point :
    (lateFirstApexSystem R).centerAt P.source.1 P.source.2 =
      P.other.1
  outside_adjacent_orientation :
    (P.v.1 ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∧
        P.jointDeletion.deleted.1 ∈
          S.rightAdjacentCapByIndex S.oppIndex2) ∨
      (P.jointDeletion.deleted.1 ∈
          S.leftAdjacentCapByIndex S.oppIndex2 ∧
        P.v.1 ∈ S.rightAdjacentCapByIndex S.oppIndex2)

/-- Construct the exact-five placement packet directly from the source-heavy
row traces and cap arithmetic.  No growth-profile input is consumed. -/
theorem exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_packet
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hother : P.other.1 = packet.xv)
    (hsecond : S.oppCap2.card = 5)
    (hinterior :
      (S.capInteriorByIndex S.oppIndex2).card = 3) :
    ExactFourRigid221SourceHeavyOtherXvExactFivePlacementPacket P packet := by
  classical
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell
  let Kv :=
    ((lateFirstApexSystem R).selectedAt
      P.v.1 P.v.2).toCriticalFourShell
  have huUSupport : P.u.1 ∈ Ku.support := by
    have hmem :
        P.u.1 ∈ Ku.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
      rw [show Ku.support ∩
          SelectedClass D.A S.oppApex2 P.rho =
            {P.u.1, packet.xu} by
        simpa [Ku] using packet.source_row_trace]
      simp
    exact (Finset.mem_inter.mp hmem).1
  have hxuUSupport : packet.xu ∈ Ku.support := by
    have hmem :
        packet.xu ∈ Ku.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
      simpa [Ku, packet.source_row_trace]
    exact (Finset.mem_inter.mp hmem).1
  have hxvVSupport : packet.xv ∈ Kv.support := by
    have hmem :
        packet.xv ∈ Kv.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
      simpa [Kv, packet.opposite_row_trace]
    exact (Finset.mem_inter.mp hmem).1
  have hxvNotUSupport : packet.xv ∉ Ku.support := by
    intro hxv
    have hcenter :
        (lateFirstApexSystem R).centerAt P.u.1 P.u.2 =
          packet.xv := by
      simpa [P.huSource] using packet.blocker_eq_xv
    have hmemEq :
        ((lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈
            Ku.support) =
          (packet.xv ∈ Ku.support) :=
      congrArg (fun z : ℝ² => z ∈ Ku.support) hcenter
    exact Ku.center_not_mem_support (hmemEq.mpr hxv)
  have hpairSubset :
      ({P.u.1, packet.xu} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.oppIndex2 := by
    intro z hz
    have hzInter :
        z ∈ ({P.u.1, packet.xu} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 := by
      rw [packet.source_pair_interior]
      exact hz
    exact (Finset.mem_inter.mp hzInter).2
  have hxvInterior :
      packet.xv ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [← hother]
    exact P.context.other_mem_interior
  have htripleSubset :
      ({P.u.1, packet.xu, packet.xv} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.oppIndex2 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact hpairSubset (by simp)
    · exact hpairSubset (by simp)
    · exact hxvInterior
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply hxvNotUSupport
    rw [← h]
    exact huUSupport
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply hxvNotUSupport
    rw [← h]
    exact hxuUSupport
  have htripleCard :
      ({P.u.1, packet.xu, packet.xv} : Finset ℝ²).card = 3 := by
    simp [packet.xu_ne_u.symm, huNeXv, hxuNeXv]
  have hinteriorEq :
      S.capInteriorByIndex S.oppIndex2 =
        {P.u.1, packet.xu, packet.xv} := by
    apply Eq.symm
    apply Finset.eq_of_subset_of_card_le htripleSubset
    rw [hinterior, htripleCard]
  have hvNotInterior :
      P.v.1 ∉ S.capInteriorByIndex S.oppIndex2 := by
    intro hvInterior
    rw [hinteriorEq] at hvInterior
    simp only [Finset.mem_insert, Finset.mem_singleton] at hvInterior
    rcases hvInterior with hvu | hvxu | hvxv
    · apply P.huNeV
      apply Subtype.ext
      exact hvu.symm
    · apply P.hvOmitted
      rw [hvxu]
      exact hxuUSupport
    · exact packet.xv_ne_v hvxv.symm
  have hdeletedNotInterior :
      P.jointDeletion.deleted.1 ∉
        S.capInteriorByIndex S.oppIndex2 := by
    intro hdeletedInterior
    rw [hinteriorEq] at hdeletedInterior
    simp only [Finset.mem_insert, Finset.mem_singleton] at hdeletedInterior
    rcases hdeletedInterior with hdu | hdxu | hdxv
    · apply P.jointDeletion.deleted_ne_u
      apply Subtype.ext
      exact hdu
    · apply P.jointDeletion.deleted_not_mem_uRow
      rw [hdxu]
      exact hxuUSupport
    · apply P.jointDeletion.deleted_not_mem_vRow
      rw [hdxv]
      exact hxvVSupport
  have houtsideAdjacentOrientation :
      (P.v.1 ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∧
          P.jointDeletion.deleted.1 ∈
            S.rightAdjacentCapByIndex S.oppIndex2) ∨
        (P.jointDeletion.deleted.1 ∈
            S.leftAdjacentCapByIndex S.oppIndex2 ∧
          P.v.1 ∈
            S.rightAdjacentCapByIndex S.oppIndex2) := by
    let T :=
      SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex2) P.rho
    have hleftOne :
        (T ∩ S.leftAdjacentCapByIndex S.oppIndex2).card ≤ 1 := by
      simpa [T] using
        S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
          D.convex S.oppIndex2 P.rho
    have hrightOne :
        (T ∩ S.rightAdjacentCapByIndex S.oppIndex2).card ≤ 1 := by
      simpa [T] using
        S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
          D.convex S.oppIndex2 P.rho
    have hcover :
        T \ S.capInteriorByIndex S.oppIndex2 ⊆
          (T ∩ S.leftAdjacentCapByIndex S.oppIndex2) ∪
            (T ∩ S.rightAdjacentCapByIndex S.oppIndex2) := by
      simpa [T] using
        S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps
          S.oppIndex2 P.hrho
    have hvT : P.v.1 ∈ T := by
      simpa [T] using P.hvClass
    have hdeletedT : P.jointDeletion.deleted.1 ∈ T := by
      simpa [T] using P.jointDeletion.deleted_mem_class
    have hvOutside :
        P.v.1 ∈ T \ S.capInteriorByIndex S.oppIndex2 :=
      Finset.mem_sdiff.mpr ⟨hvT, hvNotInterior⟩
    have hdeletedOutside :
        P.jointDeletion.deleted.1 ∈
          T \ S.capInteriorByIndex S.oppIndex2 :=
      Finset.mem_sdiff.mpr ⟨hdeletedT, hdeletedNotInterior⟩
    have hvLocation :
        P.v.1 ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∨
          P.v.1 ∈ S.rightAdjacentCapByIndex S.oppIndex2 := by
      rcases Finset.mem_union.mp (hcover hvOutside) with
          hleft | hright
      · exact Or.inl (Finset.mem_inter.mp hleft).2
      · exact Or.inr (Finset.mem_inter.mp hright).2
    have hdeletedLocation :
        P.jointDeletion.deleted.1 ∈
            S.leftAdjacentCapByIndex S.oppIndex2 ∨
          P.jointDeletion.deleted.1 ∈
            S.rightAdjacentCapByIndex S.oppIndex2 := by
      rcases Finset.mem_union.mp (hcover hdeletedOutside) with
          hleft | hright
      · exact Or.inl (Finset.mem_inter.mp hleft).2
      · exact Or.inr (Finset.mem_inter.mp hright).2
    have hvNeDeleted :
        P.v.1 ≠ P.jointDeletion.deleted.1 := by
      intro h
      apply P.jointDeletion.deleted_ne_v
      apply Subtype.ext
      exact h.symm
    have hnotBothLeft :
        ¬ (P.v.1 ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∧
          P.jointDeletion.deleted.1 ∈
            S.leftAdjacentCapByIndex S.oppIndex2) := by
      rintro ⟨hvLeft, hdeletedLeft⟩
      have hpairSubset :
          ({P.v.1, P.jointDeletion.deleted.1} : Finset ℝ²) ⊆
            T ∩ S.leftAdjacentCapByIndex S.oppIndex2 := by
        intro z hz
        simp only [Finset.mem_insert, Finset.mem_singleton] at hz
        rcases hz with rfl | rfl
        · exact Finset.mem_inter.mpr ⟨hvT, hvLeft⟩
        · exact Finset.mem_inter.mpr ⟨hdeletedT, hdeletedLeft⟩
      have hpairLe := Finset.card_le_card hpairSubset
      have hpairCard :
          ({P.v.1, P.jointDeletion.deleted.1} :
            Finset ℝ²).card = 2 := by
        simp [hvNeDeleted]
      omega
    have hnotBothRight :
        ¬ (P.v.1 ∈
            S.rightAdjacentCapByIndex S.oppIndex2 ∧
          P.jointDeletion.deleted.1 ∈
            S.rightAdjacentCapByIndex S.oppIndex2) := by
      rintro ⟨hvRight, hdeletedRight⟩
      have hpairSubset :
          ({P.v.1, P.jointDeletion.deleted.1} : Finset ℝ²) ⊆
            T ∩ S.rightAdjacentCapByIndex S.oppIndex2 := by
        intro z hz
        simp only [Finset.mem_insert, Finset.mem_singleton] at hz
        rcases hz with rfl | rfl
        · exact Finset.mem_inter.mpr ⟨hvT, hvRight⟩
        · exact Finset.mem_inter.mpr ⟨hdeletedT, hdeletedRight⟩
      have hpairLe := Finset.card_le_card hpairSubset
      have hpairCard :
          ({P.v.1, P.jointDeletion.deleted.1} :
            Finset ℝ²).card = 2 := by
        simp [hvNeDeleted]
      omega
    rcases hvLocation with hvLeft | hvRight <;>
      rcases hdeletedLocation with hdeletedLeft | hdeletedRight
    · exact (hnotBothLeft ⟨hvLeft, hdeletedLeft⟩).elim
    · exact Or.inl ⟨hvLeft, hdeletedRight⟩
    · exact Or.inr ⟨hdeletedLeft, hvRight⟩
    · exact (hnotBothRight ⟨hvRight, hdeletedRight⟩).elim
  exact
    { secondOppCap_card_eq_five := hsecond
      secondInterior_eq_named := hinteriorEq
      v_not_mem_secondInterior := hvNotInterior
      deleted_not_mem_secondInterior := hdeletedNotInterior
      other_point_eq_xv := hother
      source_blocker_eq_other_point := by
        calc
          (lateFirstApexSystem R).centerAt
              P.source.1 P.source.2 =
            packet.xv := packet.blocker_eq_xv
          _ = P.other.1 := hother.symm
      outside_adjacent_orientation :=
        houtsideAdjacentOrientation }

/-- Two distinct points of the physical second class whose late rows contain
each other have equal blocker centers: the second apex and both centers are
equidistant from the pair, and the convex-position perpendicular-bisector
bound admits at most two such carrier points besides the apex. -/
theorem
    blocker_centers_eq_of_physicalSecondRadius_mutual_cross_membership
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    {x y : ℝ²}
    (hxA : x ∈ D.A) (hyA : y ∈ D.A) (hxy : x ≠ y)
    (hxRadius : x ∈ SelectedClass D.A S.oppApex2 P.rho)
    (hyRadius : y ∈ SelectedClass D.A S.oppApex2 P.rho)
    (hyx :
      y ∈ ((lateFirstApexSystem R).selectedAt
        x hxA).toCriticalFourShell.support)
    (hxy' :
      x ∈ ((lateFirstApexSystem R).selectedAt
        y hyA).toCriticalFourShell.support) :
    (lateFirstApexSystem R).centerAt x hxA =
      (lateFirstApexSystem R).centerAt y hyA := by
  classical
  let Hlate := lateFirstApexSystem R
  let cx := Hlate.centerAt x hxA
  let cy := Hlate.centerAt y hyA
  let o := S.oppApex2
  have hoA : o ∈ D.A := by
    simpa [o] using P.surface.ingress.packet.center₂_mem_A
  have hcxA : cx ∈ D.A := by
    simpa [cx, Hlate, CriticalShellSystem.blockerVertex] using
      (Hlate.blockerVertex ⟨x, hxA⟩).2
  have hcyA : cy ∈ D.A := by
    simpa [cy, Hlate, CriticalShellSystem.blockerVertex] using
      (Hlate.blockerVertex ⟨y, hyA⟩).2
  have hcxNeO : cx ≠ o := by
    simpa [cx, o, Hlate] using
      P.surface.secondApex_robust.centerAt_ne Hlate x hxA
  have hcyNeO : cy ≠ o := by
    simpa [cy, o, Hlate] using
      P.surface.secondApex_robust.centerAt_ne Hlate y hyA
  by_contra hcxcy
  have hoEq : dist o x = dist o y :=
    (mem_selectedClass.mp hxRadius).2.trans
      (mem_selectedClass.mp hyRadius).2.symm
  have hcxEq : dist cx x = dist cx y := by
    exact
      (Hlate.selectedAt x hxA).toCriticalFourShell.support_eq_radius
        x (Hlate.selectedAt x hxA).toCriticalFourShell.q_mem_support
      |>.trans
        ((Hlate.selectedAt x hxA).toCriticalFourShell.support_eq_radius
          y hyx).symm
  have hcyEq : dist cy x = dist cy y := by
    exact
      (Hlate.selectedAt y hyA).toCriticalFourShell.support_eq_radius
        x hxy'
      |>.trans
        ((Hlate.selectedAt y hyA).toCriticalFourShell.support_eq_radius
          y (Hlate.selectedAt y hyA).toCriticalFourShell.q_mem_support).symm
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex hxA hyA hxy
  have hoFilter :
      o ∈ D.A.filter (fun z => dist z x = dist z y) :=
    Finset.mem_filter.mpr ⟨hoA, hoEq⟩
  have hcxFilter :
      cx ∈ D.A.filter (fun z => dist z x = dist z y) :=
    Finset.mem_filter.mpr ⟨hcxA, hcxEq⟩
  have hcyFilter :
      cy ∈ D.A.filter (fun z => dist z x = dist z y) :=
    Finset.mem_filter.mpr ⟨hcyA, hcyEq⟩
  have hthree :
      2 < (D.A.filter (fun z => dist z x = dist z y)).card := by
    rw [Finset.two_lt_card]
    exact ⟨o, hoFilter, cx, hcxFilter, cy, hcyFilter,
      hcxNeO.symm, hcyNeO.symm, hcxcy⟩
  omega

/-- In the reciprocal incidence arm, the rows at `u` and `xu` coincide.
The exact class traces then leave both `v` and the original rigid deletion
outside the rows at `xu` and `xv`, producing two distinct prescribed
joint-deletion packets for the mutually omitted pair `(xu, xv)`. -/
theorem
    false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_reciprocalArm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxuA : packet.xu ∈ D.A)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (huXuRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let C := SelectedClass D.A S.oppApex2 P.rho
  have hxuInter :
      packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support ∩ C := by
    simpa [Hlate, C] using
      (show packet.xu ∈
          ((lateFirstApexSystem R).selectedAt
              P.u.1 P.u.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.source_row_trace]
        simp)
  have hxvInter :
      packet.xv ∈
        (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩ C := by
    simpa [Hlate, C] using
      (show packet.xv ∈
          ((lateFirstApexSystem R).selectedAt
              P.v.1 P.v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.opposite_row_trace]
        simp)
  have hxuClass : packet.xu ∈ C := (Finset.mem_inter.mp hxuInter).2
  have hxvClass : packet.xv ∈ C := (Finset.mem_inter.mp hxvInter).2
  let xu : CarrierVertex D.A := ⟨packet.xu, hxuA⟩
  let xv : CarrierVertex D.A := ⟨packet.xv, hxvA⟩
  have hxuURow :
      packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support :=
    (Finset.mem_inter.mp hxuInter).1
  have hxvVRow :
      packet.xv ∈
        (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support :=
    (Finset.mem_inter.mp hxvInter).1
  have hcenterU :
      Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa [Hlate, P.huSource] using packet.blocker_eq_xv
  have hxvNotURow :
      packet.xv ∉
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support := by
    intro h
    rw [← hcenterU] at h
    exact
      (Hlate.selectedAt
        P.u.1 P.u.2).toCriticalFourShell.center_not_mem_support h
  have huNeXu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply hxvNotURow
    rw [← h]
    exact
      (Hlate.selectedAt
        P.u.1 P.u.2).toCriticalFourShell.q_mem_support
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply hxvNotURow
    rw [← h]
    exact hxuURow
  have hcenterUXu :
      Hlate.centerAt P.u.1 P.u.2 =
        Hlate.centerAt packet.xu hxuA := by
    exact
      blocker_centers_eq_of_physicalSecondRadius_mutual_cross_membership
        P P.u.2 hxuA huNeXu
          (by simpa [C] using P.huClass)
          (by simpa [C] using hxuClass)
          hxuURow
          (by simpa [Hlate] using huXuRow)
  have hsupportsUXu :
      (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support =
        (Hlate.selectedAt
          packet.xu hxuA).toCriticalFourShell.support :=
    ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
      Hlate P.u.2 hxuA hcenterUXu
  have hxvNotXuRow :
      packet.xv ∉
        (Hlate.selectedAt
          packet.xu hxuA).toCriticalFourShell.support := by
    intro h
    apply hxvNotURow
    rw [hsupportsUXu]
    exact h
  have hcardXv :
      (((Hlate.selectedAt
            packet.xv hxvA).toCriticalFourShell.support ∩ C).card ≤ 2) := by
    simpa [Hlate, C, xv] using
      actualLateRow_secondClass_card_le_two R P.surface xv
  have hxvOwnInter :
      packet.xv ∈
        (Hlate.selectedAt
            packet.xv hxvA).toCriticalFourShell.support ∩ C :=
    Finset.mem_inter.mpr
      ⟨(Hlate.selectedAt
          packet.xv hxvA).toCriticalFourShell.q_mem_support,
        hxvClass⟩
  have huXvInter :
      P.u.1 ∈
        (Hlate.selectedAt
            packet.xv hxvA).toCriticalFourShell.support ∩ C :=
    Finset.mem_inter.mpr
      ⟨by simpa [Hlate] using huXvRow,
        by simpa [C] using P.huClass⟩
  have hxuNotXvInter :
      packet.xu ∉
        (Hlate.selectedAt
            packet.xv hxvA).toCriticalFourShell.support ∩ C :=
    third_not_mem_of_card_le_two
      hcardXv hxvOwnInter huXvInter huNeXv.symm
        hxuNeXv.symm huNeXu
  have hxuNotXvRow :
      packet.xu ∉
        (Hlate.selectedAt
          packet.xv hxvA).toCriticalFourShell.support := by
    intro h
    exact hxuNotXvInter (Finset.mem_inter.mpr ⟨h, hxuClass⟩)
  have hblockersNe :
      Hlate.centerAt packet.xu hxuA ≠
        Hlate.centerAt packet.xv hxvA := by
    intro hcenters
    have hsupports :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        Hlate hxuA hxvA hcenters
    apply hxvNotXuRow
    rw [hsupports]
    exact
      (Hlate.selectedAt
        packet.xv hxvA).toCriticalFourShell.q_mem_support
  have hpairSubset :
      ({packet.xv, P.u.1} : Finset ℝ²) ⊆
        (Hlate.selectedAt
            packet.xv hxvA).toCriticalFourShell.support ∩ C := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact hxvOwnInter
    · exact huXvInter
  have hxvTrace :
      (Hlate.selectedAt
          packet.xv hxvA).toCriticalFourShell.support ∩ C =
        {packet.xv, P.u.1} := by
    symm
    apply Finset.eq_of_subset_of_card_le hpairSubset
    calc
      ((Hlate.selectedAt
          packet.xv hxvA).toCriticalFourShell.support ∩ C).card ≤ 2 :=
        hcardXv
      _ = ({packet.xv, P.u.1} : Finset ℝ²).card := by
        simp [huNeXv.symm]
  have hvNotXuRow :
      P.v.1 ∉
        (Hlate.selectedAt
          packet.xu hxuA).toCriticalFourShell.support := by
    intro h
    apply P.hvOmitted
    rw [hsupportsUXu]
    exact h
  have hdeletedNotXuRow :
      P.jointDeletion.deleted.1 ∉
        (Hlate.selectedAt
          packet.xu hxuA).toCriticalFourShell.support := by
    intro h
    apply P.jointDeletion.deleted_not_mem_uRow
    rw [hsupportsUXu]
    exact h
  have hvNotXvRow :
      P.v.1 ∉
        (Hlate.selectedAt
          packet.xv hxvA).toCriticalFourShell.support := by
    intro h
    have hvPair : P.v.1 ∈ ({packet.xv, P.u.1} : Finset ℝ²) := by
      rw [← hxvTrace]
      exact Finset.mem_inter.mpr
        ⟨h, by simpa [C] using P.hvClass⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hvPair
    rcases hvPair with hvXv | hvU
    · exact packet.xv_ne_v hvXv.symm
    · exact P.huNeV (Subtype.ext hvU.symm)
  have hdeletedNotXvRow :
      P.jointDeletion.deleted.1 ∉
        (Hlate.selectedAt
          packet.xv hxvA).toCriticalFourShell.support := by
    intro h
    have hdeletedPair :
        P.jointDeletion.deleted.1 ∈
          ({packet.xv, P.u.1} : Finset ℝ²) := by
      rw [← hxvTrace]
      exact Finset.mem_inter.mpr
        ⟨h, by simpa [C] using P.jointDeletion.deleted_mem_class⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hdeletedPair
    rcases hdeletedPair with hdeletedXv | hdeletedU
    · apply P.jointDeletion.deleted_not_mem_vRow
      rw [hdeletedXv]
      exact hxvVRow
    · exact P.jointDeletion.deleted_ne_u (Subtype.ext hdeletedU)
  rcases
      exactFourMutualOmissionJointDeletion_of_prescribed
        R P.surface P.rho xu xv P.v
          (by simpa [C] using P.hvClass)
          (by simpa [Hlate, xu] using hvNotXuRow)
          (by simpa [Hlate, xv] using hvNotXvRow)
          (by simpa [Hlate, xu, xv] using hblockersNe) with
    ⟨first, hfirst⟩
  rcases
      exactFourMutualOmissionJointDeletion_of_prescribed
        R P.surface P.rho xu xv P.jointDeletion.deleted
          (by simpa [C] using P.jointDeletion.deleted_mem_class)
          (by simpa [Hlate, xu] using hdeletedNotXuRow)
          (by simpa [Hlate, xv] using hdeletedNotXvRow)
          (by simpa [Hlate, xu, xv] using hblockersNe) with
    ⟨second, hsecond⟩
  have hdeletedNe : first.deleted ≠ second.deleted := by
    intro h
    exact
      P.jointDeletion.deleted_ne_v
        (hsecond.symm.trans (h.symm.trans hfirst))
  exact
    false_of_twoDistinctExactFourMutualOmissionJointDeletions
      R P.hcard P.surface P.rho P.hrho P.hfive xu xv
        (by
          intro h
          exact hxuNeXv (congrArg Subtype.val h))
        (by simpa [C, xu] using hxuClass)
        (by simpa [C, xv] using hxvClass)
        (by simpa [Hlate, xu, xv] using hxvNotXuRow)
        (by simpa [Hlate, xu, xv] using hxuNotXvRow)
        first second hdeletedNe

private theorem equilateral_inner_nonneg {a b c : ℝ²}
    (hab : dist a b = dist a c)
    (habc : dist a b = dist b c) :
    0 ≤ inner ℝ (b - a) (c - a) := by
  rw [real_inner_eq_norm_mul_self_add_norm_mul_self_sub_norm_sub_mul_self_div_two]
  have hba : ‖b - a‖ = dist a b := by
    simpa [dist_comm] using (dist_eq_norm b a).symm
  have hca : ‖c - a‖ = dist a c := by
    simpa [dist_comm] using (dist_eq_norm c a).symm
  have hbc : ‖(b - a) - (c - a)‖ = dist b c := by
    rw [show (b - a) - (c - a) = b - c by abel]
    simpa [dist_comm] using (dist_eq_norm b c).symm
  rw [hba, hca, hbc, ← hab, ← habc]
  nlinarith [sq_nonneg (dist a b)]

/-- If the `xv` row also contains the third physical-cap interior point
`xu`, its actual blocker is forced to be `u`.  Together with the already
fixed blocker of the `u` row this makes `u,xu,xv` equilateral around the
physical apex, contradicting strict convex position. -/
theorem
    false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_uXvMutualOmission_xuXvRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (W :
      ExactFourRigid221SourceHeavyOtherXvExactFivePlacementPacket P packet)
    (hxvA : packet.xv ∈ D.A)
    (_huNotXvRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hxuXvRow :
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ku :=
    (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  let Kxv :=
    (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell

  have hxuInter :
      packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.source_row_trace]
    simp
  have hxvInter :
      packet.xv ∈
        (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.opposite_row_trace]
    simp
  have hxuClass :
      packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxuInter).2
  have hxvClass :
      packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxvInter).2

  have huInterior :
      P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [W.secondInterior_eq_named]
    simp
  have hxuInterior :
      packet.xu ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [W.secondInterior_eq_named]
    simp
  have hxvInterior :
      packet.xv ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [W.secondInterior_eq_named]
    simp

  have hcenterU :
      Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa [Hlate, P.huSource] using packet.blocker_eq_xv
  have hxuURow :
      packet.xu ∈ Ku.support :=
    (Finset.mem_inter.mp hxuInter).1
  have hxvNotURow : packet.xv ∉ Ku.support := by
    intro h
    rw [← hcenterU] at h
    exact Ku.center_not_mem_support h
  have huNeXu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply hxvNotURow
    simpa only [← h] using Ku.q_mem_support
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply hxvNotURow
    rw [← h]
    exact hxuURow

  have hcxvA : Hlate.centerAt packet.xv hxvA ∈ D.A := by
    exact Finset.mem_of_mem_erase Kxv.center_mem
  have hcxvNe :
      Hlate.centerAt packet.xv hxvA ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne Hlate packet.xv hxvA
  have hcxvEq :
      dist (Hlate.centerAt packet.xv hxvA) packet.xv =
        dist (Hlate.centerAt packet.xv hxvA) packet.xu :=
    (Kxv.support_eq_radius _ Kxv.q_mem_support).trans
      (Kxv.support_eq_radius _ hxuXvRow).symm
  have hphysicalXvXu :
      dist S.oppApex2 packet.xv = dist S.oppApex2 packet.xu :=
    (mem_selectedClass.mp hxvClass).2.trans
      (mem_selectedClass.mp hxuClass).2.symm
  have hcxvInterior :
      Hlate.centerAt packet.xv hxvA ∈
        S.capInteriorByIndex S.oppIndex2 :=
    commonPhysicalPair_center_mem_secondCapInterior hcxvA hcxvNe
      hxvInterior hxuInterior hxuNeXv.symm hcxvEq hphysicalXvXu
  rw [W.secondInterior_eq_named] at hcxvInterior
  simp only [Finset.mem_insert, Finset.mem_singleton] at hcxvInterior
  have hcxv :
      Hlate.centerAt packet.xv hxvA = P.u.1 := by
    rcases hcxvInterior with h | h | h
    · exact h
    · apply False.elim
      apply Kxv.center_not_mem_support
      simpa only [h] using hxuXvRow
    · exact (centerAt_ne_source Hlate packet.xv hxvA h).elim

  have huxu_eq_uxv :
      dist P.u.1 packet.xu = dist P.u.1 packet.xv := by
    simpa [hcxv] using hcxvEq.symm
  have huxu_eq_xuxv :
      dist P.u.1 packet.xu = dist packet.xu packet.xv := by
    have h := (Ku.support_eq_radius _ Ku.q_mem_support).trans
      (Ku.support_eq_radius _ hxuURow).symm
    rw [hcenterU] at h
    calc
      dist P.u.1 packet.xu = dist P.u.1 packet.xv := huxu_eq_uxv
      _ = dist packet.xv P.u.1 := dist_comm _ _
      _ = dist packet.xv packet.xu := h
      _ = dist packet.xu packet.xv := dist_comm _ _

  have harea :
      signedArea2 P.u.1 packet.xu packet.xv ≠ 0 := by
    intro hzero
    exact D.convex.not_three_collinear P.u.2
      (mem_selectedClass.mp hxuClass).1 hxvA
      huNeXu huNeXv hxuNeXv
      (collinear_of_signedArea2_eq_zero _ _ _ hzero)
  have hinnerU :
      0 ≤ inner ℝ (packet.xu - P.u.1) (packet.xv - P.u.1) :=
    equilateral_inner_nonneg huxu_eq_uxv huxu_eq_xuxv
  have hinnerXu :
      0 ≤ inner ℝ (packet.xv - packet.xu) (P.u.1 - packet.xu) := by
    apply equilateral_inner_nonneg
    · calc
        dist packet.xu packet.xv = dist P.u.1 packet.xu :=
          huxu_eq_xuxv.symm
        _ = dist packet.xu P.u.1 := dist_comm _ _
    · calc
        dist packet.xu packet.xv = dist P.u.1 packet.xu :=
          huxu_eq_xuxv.symm
        _ = dist P.u.1 packet.xv := huxu_eq_uxv
        _ = dist packet.xv P.u.1 := dist_comm _ _
  have hinnerXv :
      0 ≤ inner ℝ (P.u.1 - packet.xv) (packet.xu - packet.xv) := by
    apply equilateral_inner_nonneg
    · calc
        dist packet.xv P.u.1 = dist P.u.1 packet.xv := dist_comm _ _
        _ = dist P.u.1 packet.xu := huxu_eq_uxv.symm
        _ = dist packet.xu packet.xv := huxu_eq_xuxv
        _ = dist packet.xv packet.xu := dist_comm _ _
    · calc
        dist packet.xv P.u.1 = dist P.u.1 packet.xv := dist_comm _ _
        _ = dist P.u.1 packet.xu := huxu_eq_uxv.symm
  have hphysicalU := (mem_selectedClass.mp P.huClass).2
  have hphysicalXu := (mem_selectedClass.mp hxuClass).2
  have hphysicalXv := (mem_selectedClass.mp hxvClass).2
  have hhull :
      S.oppApex2 ∈
        convexHull ℝ ({P.u.1, packet.xu, packet.xv} : Set ℝ²) :=
    mem_convexHull_three_of_equidistant_nonobtuse harea
      (hphysicalU.trans hphysicalXu.symm)
      (hphysicalU.trans hphysicalXv.symm)
      hinnerU hinnerXu hinnerXv
  have happA : S.oppApex2 ∈ D.A :=
    P.surface.ingress.packet.center₂_mem_A
  have hneU : S.oppApex2 ≠ P.u.1 := by
    intro h
    rw [h, dist_self] at hphysicalU
    exact (ne_of_gt P.hrho) hphysicalU.symm
  have hneXu : S.oppApex2 ≠ packet.xu := by
    intro h
    rw [h, dist_self] at hphysicalXu
    exact (ne_of_gt P.hrho) hphysicalXu.symm
  have hneXv : S.oppApex2 ≠ packet.xv := by
    intro h
    rw [h, dist_self] at hphysicalXv
    exact (ne_of_gt P.hrho) hphysicalXv.symm
  have hsub :
      ({P.u.1, packet.xu, packet.xv} : Set ℝ²) ⊆
        (D.A : Set ℝ²) \ {S.oppApex2} := by
    simp only [Set.insert_subset_iff, Set.singleton_subset_iff]
    exact
      ⟨⟨Finset.mem_coe.mpr P.u.2, fun h => hneU h.symm⟩,
       ⟨Finset.mem_coe.mpr (mem_selectedClass.mp hxuClass).1,
          fun h => hneXu h.symm⟩,
       ⟨Finset.mem_coe.mpr hxvA, fun h => hneXv h.symm⟩⟩
  exact D.convex S.oppApex2 (Finset.mem_coe.mpr happA)
    (convexHull_mono hsub hhull)

/-- If the `xv` row contains none of the other three points outside the
named physical-cap interior pair, then `v` and the original rigid deletion
are two distinct prescribed joint deletions for the mutually omitted pair
`(u,xv)`. -/
theorem
    false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_uXvMutualOmission_twoDeletions
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxvA : packet.xv ∈ D.A)
    (huNotXvRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hvNotXvRow :
      P.v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hdeletedNotXvRow :
      P.jointDeletion.deleted.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let C := SelectedClass D.A S.oppApex2 P.rho
  let xv : CarrierVertex D.A := ⟨packet.xv, hxvA⟩
  have hxvInter :
      packet.xv ∈
        (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩ C := by
    simpa [Hlate, C] using
      (show packet.xv ∈
          ((lateFirstApexSystem R).selectedAt
              P.v.1 P.v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.opposite_row_trace]
        simp)
  have hxvClass : packet.xv ∈ C :=
    (Finset.mem_inter.mp hxvInter).2
  have hcenterU :
      Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa [Hlate, P.huSource] using packet.blocker_eq_xv
  have hxvNotURow :
      packet.xv ∉
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support := by
    intro h
    rw [← hcenterU] at h
    exact
      (Hlate.selectedAt
        P.u.1 P.u.2).toCriticalFourShell.center_not_mem_support h
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply hxvNotURow
    simpa only [← h] using
      (Hlate.selectedAt
        P.u.1 P.u.2).toCriticalFourShell.q_mem_support
  have hblockersNe :
      Hlate.centerAt P.u.1 P.u.2 ≠
        Hlate.centerAt packet.xv hxvA := by
    intro hcenters
    have hsupports :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        Hlate P.u.2 hxvA hcenters
    apply hxvNotURow
    rw [hsupports]
    exact
      (Hlate.selectedAt
        packet.xv hxvA).toCriticalFourShell.q_mem_support
  rcases
      exactFourMutualOmissionJointDeletion_of_prescribed
        R P.surface P.rho P.u xv P.v P.hvClass P.hvOmitted
          (by simpa [Hlate, xv] using hvNotXvRow)
          (by simpa [Hlate, xv] using hblockersNe) with
    ⟨first, hfirst⟩
  rcases
      exactFourMutualOmissionJointDeletion_of_prescribed
        R P.surface P.rho P.u xv P.jointDeletion.deleted
          P.jointDeletion.deleted_mem_class
          P.jointDeletion.deleted_not_mem_uRow
          (by simpa [Hlate, xv] using hdeletedNotXvRow)
          (by simpa [Hlate, xv] using hblockersNe) with
    ⟨second, hsecond⟩
  have hdeletedNe : first.deleted ≠ second.deleted := by
    intro h
    exact
      P.jointDeletion.deleted_ne_v
        (hsecond.symm.trans (h.symm.trans hfirst))
  exact
    false_of_twoDistinctExactFourMutualOmissionJointDeletions
      R P.hcard P.surface P.rho P.hrho P.hfive P.u xv
        (by
          intro h
          exact huNeXv (congrArg Subtype.val h))
        P.huClass
        (by simpa [C, xv] using hxvClass)
        (by simpa [Hlate, xv] using hxvNotURow)
        (by simpa [Hlate, xv] using huNotXvRow)
        first second hdeletedNe

set_option maxHeartbeats 800000 in
-- Rebuilding the full rigid/source/global-deletion packet needs more than the
-- project default during elaboration.
/-- Reindex the rigid `2+2+1` packet along the new `u`/`xv` mutual-omission
pair.  In the remaining incidence branch the `xv` row has physical trace
exactly `{xv, deleted}`, so the old `v` is the new unique joint deletion.
The global deletion witness is unchanged, while the source blocker is now
literally the new opposite source. -/
theorem
    false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_uXvMutualOmission_deletedXvRow_direct
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxvA : packet.xv ∈ D.A)
    (huNotXvRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hxuNotXvRow :
      packet.xu ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hdeletedXvRow :
      P.jointDeletion.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let C := SelectedClass D.A S.oppApex2 P.rho
  let xv : CarrierVertex D.A := ⟨packet.xv, hxvA⟩
  have hxvInter :
      packet.xv ∈
        (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩ C := by
    simpa [Hlate, C] using
      (show packet.xv ∈
          ((lateFirstApexSystem R).selectedAt
              P.v.1 P.v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.opposite_row_trace]
        simp)
  have hxvClass : packet.xv ∈ C :=
    (Finset.mem_inter.mp hxvInter).2
  have hdeletedClass : P.jointDeletion.deleted.1 ∈ C := by
    simpa [C] using P.jointDeletion.deleted_mem_class
  have hdeletedNeXv :
      P.jointDeletion.deleted.1 ≠ packet.xv := by
    intro h
    apply P.jointDeletion.deleted_not_mem_vRow
    rw [h]
    exact (Finset.mem_inter.mp hxvInter).1
  have hpairSub :
      ({packet.xv, P.jointDeletion.deleted.1} : Finset ℝ²) ⊆
        (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support ∩ C := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨(Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.q_mem_support,
          hxvClass⟩
    · exact Finset.mem_inter.mpr ⟨hdeletedXvRow, hdeletedClass⟩
  have hxvTraceCard :
      ((Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support ∩ C).card ≤
        2 := by
    simpa [Hlate, C, xv] using
      actualLateRow_secondClass_card_le_two R P.surface xv
  have hpairCard :
      ({packet.xv, P.jointDeletion.deleted.1} : Finset ℝ²).card = 2 := by
    simp [hdeletedNeXv.symm]
  have hxvTrace :
      (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support ∩ C =
        {packet.xv, P.jointDeletion.deleted.1} := by
    exact
      (Finset.eq_of_subset_of_card_le hpairSub
        (by simpa [hpairCard] using hxvTraceCard)).symm
  have hvNotXvRow :
      P.v.1 ∉
        (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support := by
    intro hv
    have hvC : P.v.1 ∈ C := by simpa [C] using P.hvClass
    have hvPair : P.v.1 ∈
        ({packet.xv, P.jointDeletion.deleted.1} : Finset ℝ²) := by
      rw [← hxvTrace]
      exact Finset.mem_inter.mpr ⟨hv, hvC⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hvPair
    rcases hvPair with hvxv | hvd
    · exact packet.xv_ne_v hvxv.symm
    · exact P.jointDeletion.deleted_ne_v
        (Subtype.ext (by simpa using hvd.symm))
  have hcenterU :
      Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa [Hlate, P.huSource] using packet.blocker_eq_xv
  have hxvNotURow :
      packet.xv ∉
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support := by
    intro h
    rw [← hcenterU] at h
    exact
      (Hlate.selectedAt
        P.u.1 P.u.2).toCriticalFourShell.center_not_mem_support h
  have hxuURow :
      packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support := by
    have : packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support ∩ C := by
      simpa [Hlate, C] using
        (show packet.xu ∈
            ((lateFirstApexSystem R).selectedAt
                P.u.1 P.u.2).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 P.rho by
          rw [packet.source_row_trace]
          simp)
    exact (Finset.mem_inter.mp this).1
  have hblockersNe :
      Hlate.centerAt P.u.1 P.u.2 ≠
        Hlate.centerAt packet.xv hxvA := by
    intro hcenters
    have hcenterXv :
        Hlate.centerAt packet.xv hxvA = packet.xv := by
      exact hcenters.symm.trans hcenterU
    exact centerAt_ne_source Hlate packet.xv hxvA hcenterXv
  rcases
      exactFourMutualOmissionJointDeletion_of_prescribed
        R P.surface P.rho P.u xv P.v P.hvClass P.hvOmitted
          (by simpa [Hlate, xv] using hvNotXvRow)
          (by simpa [Hlate, xv] using hblockersNe) with
    ⟨J, hJdeleted⟩
  have huNeXv : P.u ≠ xv := by
    intro h
    apply hblockersNe
    simpa [CriticalShellSystem.blockerVertex] using
      congrArg (fun q : CarrierVertex D.A => (Hlate.blockerVertex q).1) h
  have huNeXvPoint : P.u.1 ≠ packet.xv := by
    intro h
    apply huNeXv
    exact Subtype.ext h
  have huNeDeleted :
      P.u.1 ≠ P.jointDeletion.deleted.1 := by
    intro h
    apply P.jointDeletion.deleted_ne_u
    exact Subtype.ext h.symm
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply hxuNotXvRow
    simpa only [h] using
      (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.q_mem_support
  have hxuNeDeleted :
      packet.xu ≠ P.jointDeletion.deleted.1 := by
    intro h
    apply P.jointDeletion.deleted_not_mem_uRow
    simpa only [← h] using hxuURow
  have hnewRigid :
      let C' := SelectedClass D.A S.oppApex2 P.rho
      let Iu :=
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∩ C'
      let Ixv :=
        ((lateFirstApexSystem R).selectedAt
          xv.1 xv.2).toCriticalFourShell.support ∩ C'
      Iu.card = 2 ∧ Ixv.card = 2 ∧ Disjoint Iu Ixv ∧
        C' = insert J.deleted.1 (Iu ∪ Ixv) := by
    dsimp only
    have hsourceTrace :
        ((lateFirstApexSystem R).selectedAt
            P.u.1 P.u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho =
            {P.u.1, packet.xu} :=
      packet.source_row_trace
    have hxvTrace' :
        ((lateFirstApexSystem R).selectedAt
            xv.1 xv.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho =
            {packet.xv, P.jointDeletion.deleted.1} := by
      simpa [Hlate, C, xv] using hxvTrace
    rw [hsourceTrace, hxvTrace']
    constructor
    · simp [Ne.symm packet.xu_ne_u]
    constructor
    · simp [Ne.symm hdeletedNeXv]
    constructor
    · rw [Finset.disjoint_left]
      intro z hzSource hzXv
      simp only [Finset.mem_insert, Finset.mem_singleton] at hzSource hzXv
      rcases hzSource with rfl | rfl <;> rcases hzXv with h | h
      · exact huNeXvPoint h
      · exact huNeDeleted h
      · exact hxuNeXv h
      · exact hxuNeDeleted h
    · rw [hJdeleted]
      rw [packet.physical_class]
      ext z
      simp only [Finset.mem_insert, Finset.mem_union,
        Finset.mem_singleton]
      tauto
  let Gnew :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R P.rho P.u xv J :=
    { rigid := hnewRigid
      center := P.globalDeletion.center
      deleted := P.globalDeletion.deleted
      center_mem_remaining := P.globalDeletion.center_mem_remaining
      deleted_nonempty := P.globalDeletion.deleted_nonempty
      deleted_subset_class := P.globalDeletion.deleted_subset_class
      deleted_card_le_five := P.globalDeletion.deleted_card_le_five
      blocked := P.globalDeletion.blocked
      restores := P.globalDeletion.restores
      geometry := P.globalDeletion.geometry }
  let contextNew :
      ExactFourMutualOmissionSourceContext
        R P.rho P.source P.other P.u xv :=
    { source_mem_class := P.context.source_mem_class
      source_mem_interior := P.context.source_mem_interior
      source_mem_outside := P.context.source_mem_outside
      source_cross_card_le_two := P.context.source_cross_card_le_two
      other_ne_source := P.context.other_ne_source
      other_mem_class := P.context.other_mem_class
      other_mem_interior := P.context.other_mem_interior
      other_not_mem_source_row := P.context.other_not_mem_source_row
      source_other_blockers_ne := P.context.source_other_blockers_ne
      source_survives_q_or_w := P.context.source_survives_q_or_w
      source_mem_u_row := P.context.source_mem_u_row
      v_not_mem_source_row := by
        intro h
        have h' : packet.xv ∈
            ((lateFirstApexSystem R).selectedAt
              P.source.1 P.source.2).toCriticalFourShell.support := by
          simpa [xv] using h
        rw [← packet.blocker_eq_xv] at h'
        exact
          ((lateFirstApexSystem R).selectedAt
            P.source.1
            P.source.2).toCriticalFourShell.center_not_mem_support h'
      u_eq_source_or_not_mem_source_row := P.context.u_eq_source_or_not_mem_source_row }
  let Pnew : ExactFourRigid221PhysicalApexSourceEqUContext R :=
    { hcard := P.hcard
      surface := P.surface
      rho := P.rho
      source := P.source
      other := P.other
      hrho := P.hrho
      hfive := P.hfive
      u := P.u
      v := xv
      huNeV := huNeXv
      huClass := P.huClass
      hvClass := by simpa [C, xv] using hxvClass
      hvOmitted := by simpa [xv] using hxvNotURow
      huOmitted := by simpa [Hlate, xv] using huNotXvRow
      context := contextNew
      jointDeletion := J
      hclassFive := P.hclassFive
      globalDeletion := Gnew
      hcenter := by simpa [Gnew] using P.hcenter
      hsourceBlockerClass := P.hsourceBlockerClass
      huSource := P.huSource }
  exact
    false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV
      Pnew (by simpa [Pnew, xv] using packet.blocker_eq_xv)

set_option maxHeartbeats 800000 in
-- Rebuilding the full rigid/source/global-deletion packet needs more than the
-- project default during elaboration.
/-- Reindex the rigid `2+2+1` packet when the `xv` row contains the old
opposite source `v`.  The physical trace is then exactly `{xv, v}`, the old
joint deletion remains the unique deleted point, and `xv` becomes the new
opposite source.  Thus the source blocker is literally the new opposite
source, which is the earlier blocker-`v` terminal. -/
theorem
    false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_uXvMutualOmission_vXvRow_direct
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxvA : packet.xv ∈ D.A)
    (huNotXvRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hxuNotXvRow :
      packet.xu ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (hvXvRow :
      P.v.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let C := SelectedClass D.A S.oppApex2 P.rho
  let xv : CarrierVertex D.A := ⟨packet.xv, hxvA⟩
  have hxvInter :
      packet.xv ∈
        (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩ C := by
    simpa [Hlate, C] using
      (show packet.xv ∈
          ((lateFirstApexSystem R).selectedAt
              P.v.1 P.v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.opposite_row_trace]
        simp)
  have hxvClass : packet.xv ∈ C :=
    (Finset.mem_inter.mp hxvInter).2
  have hvClass : P.v.1 ∈ C := by
    simpa [C] using P.hvClass
  have hvNeXv : P.v.1 ≠ packet.xv :=
    packet.xv_ne_v.symm
  have hpairSub :
      ({packet.xv, P.v.1} : Finset ℝ²) ⊆
        (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support ∩ C := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨(Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.q_mem_support,
          hxvClass⟩
    · exact Finset.mem_inter.mpr ⟨hvXvRow, hvClass⟩
  have hxvTraceCard :
      ((Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support ∩ C).card ≤
        2 := by
    simpa [Hlate, C, xv] using
      actualLateRow_secondClass_card_le_two R P.surface xv
  have hpairCard :
      ({packet.xv, P.v.1} : Finset ℝ²).card = 2 := by
    simp [packet.xv_ne_v]
  have hxvTrace :
      (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support ∩ C =
        {packet.xv, P.v.1} := by
    exact
      (Finset.eq_of_subset_of_card_le hpairSub
        (by simpa [hpairCard] using hxvTraceCard)).symm
  have hdeletedNotXvRow :
      P.jointDeletion.deleted.1 ∉
        (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.support := by
    intro hd
    have hdC : P.jointDeletion.deleted.1 ∈ C := by
      simpa [C] using P.jointDeletion.deleted_mem_class
    have hdPair :
        P.jointDeletion.deleted.1 ∈
          ({packet.xv, P.v.1} : Finset ℝ²) := by
      rw [← hxvTrace]
      exact Finset.mem_inter.mpr ⟨hd, hdC⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hdPair
    rcases hdPair with hdxv | hdv
    · apply P.jointDeletion.deleted_not_mem_vRow
      rw [hdxv]
      exact (Finset.mem_inter.mp hxvInter).1
    · exact P.jointDeletion.deleted_ne_v
        (Subtype.ext hdv)
  have hcenterU :
      Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa [Hlate, P.huSource] using packet.blocker_eq_xv
  have hxvNotURow :
      packet.xv ∉
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support := by
    intro h
    rw [← hcenterU] at h
    exact
      (Hlate.selectedAt
        P.u.1 P.u.2).toCriticalFourShell.center_not_mem_support h
  have hxuURow :
      packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support := by
    have : packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support ∩ C := by
      simpa [Hlate, C] using
        (show packet.xu ∈
            ((lateFirstApexSystem R).selectedAt
                P.u.1 P.u.2).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 P.rho by
          rw [packet.source_row_trace]
          simp)
    exact (Finset.mem_inter.mp this).1
  have hblockersNe :
      Hlate.centerAt P.u.1 P.u.2 ≠
        Hlate.centerAt packet.xv hxvA := by
    intro hcenters
    have hcenterXv :
        Hlate.centerAt packet.xv hxvA = packet.xv := by
      exact hcenters.symm.trans hcenterU
    exact centerAt_ne_source Hlate packet.xv hxvA hcenterXv
  rcases
      exactFourMutualOmissionJointDeletion_of_prescribed
        R P.surface P.rho P.u xv P.jointDeletion.deleted
          P.jointDeletion.deleted_mem_class
          P.jointDeletion.deleted_not_mem_uRow
          (by simpa [Hlate, xv] using hdeletedNotXvRow)
          (by simpa [Hlate, xv] using hblockersNe) with
    ⟨J, hJdeleted⟩
  have huNeXv : P.u ≠ xv := by
    intro h
    apply hblockersNe
    simpa [CriticalShellSystem.blockerVertex] using
      congrArg (fun q : CarrierVertex D.A => (Hlate.blockerVertex q).1) h
  have huNeXvPoint : P.u.1 ≠ packet.xv := by
    intro h
    apply huNeXv
    exact Subtype.ext h
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply hxuNotXvRow
    simpa only [h] using
      (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell.q_mem_support
  have hxuNeV : packet.xu ≠ P.v.1 := by
    intro h
    apply P.hvOmitted
    simpa only [← h] using hxuURow
  have hnewRigid :
      let C' := SelectedClass D.A S.oppApex2 P.rho
      let Iu :=
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∩ C'
      let Ixv :=
        ((lateFirstApexSystem R).selectedAt
          xv.1 xv.2).toCriticalFourShell.support ∩ C'
      Iu.card = 2 ∧ Ixv.card = 2 ∧ Disjoint Iu Ixv ∧
        C' = insert J.deleted.1 (Iu ∪ Ixv) := by
    dsimp only
    have hsourceTrace :
        ((lateFirstApexSystem R).selectedAt
            P.u.1 P.u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho =
            {P.u.1, packet.xu} :=
      packet.source_row_trace
    have hxvTrace' :
        ((lateFirstApexSystem R).selectedAt
            xv.1 xv.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho =
            {packet.xv, P.v.1} := by
      simpa [Hlate, C, xv] using hxvTrace
    rw [hsourceTrace, hxvTrace']
    constructor
    · simp [Ne.symm packet.xu_ne_u]
    constructor
    · simp [packet.xv_ne_v]
    constructor
    · rw [Finset.disjoint_left]
      intro z hzSource hzXv
      simp only [Finset.mem_insert, Finset.mem_singleton] at hzSource hzXv
      rcases hzSource with rfl | rfl <;> rcases hzXv with h | h
      · exact huNeXvPoint h
      · exact P.huNeV (Subtype.ext h)
      · exact hxuNeXv h
      · exact hxuNeV h
    · rw [hJdeleted]
      rw [packet.physical_class]
      ext z
      simp only [Finset.mem_insert, Finset.mem_union,
        Finset.mem_singleton]
      tauto
  let Gnew :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R P.rho P.u xv J :=
    { rigid := hnewRigid
      center := P.globalDeletion.center
      deleted := P.globalDeletion.deleted
      center_mem_remaining := P.globalDeletion.center_mem_remaining
      deleted_nonempty := P.globalDeletion.deleted_nonempty
      deleted_subset_class := P.globalDeletion.deleted_subset_class
      deleted_card_le_five := P.globalDeletion.deleted_card_le_five
      blocked := P.globalDeletion.blocked
      restores := P.globalDeletion.restores
      geometry := P.globalDeletion.geometry }
  let contextNew :
      ExactFourMutualOmissionSourceContext
        R P.rho P.source P.other P.u xv :=
    { source_mem_class := P.context.source_mem_class
      source_mem_interior := P.context.source_mem_interior
      source_mem_outside := P.context.source_mem_outside
      source_cross_card_le_two := P.context.source_cross_card_le_two
      other_ne_source := P.context.other_ne_source
      other_mem_class := P.context.other_mem_class
      other_mem_interior := P.context.other_mem_interior
      other_not_mem_source_row := P.context.other_not_mem_source_row
      source_other_blockers_ne := P.context.source_other_blockers_ne
      source_survives_q_or_w := P.context.source_survives_q_or_w
      source_mem_u_row := P.context.source_mem_u_row
      v_not_mem_source_row := by
        intro h
        have h' : packet.xv ∈
            ((lateFirstApexSystem R).selectedAt
              P.source.1 P.source.2).toCriticalFourShell.support := by
          simpa [xv] using h
        rw [← packet.blocker_eq_xv] at h'
        exact
          ((lateFirstApexSystem R).selectedAt
            P.source.1
            P.source.2).toCriticalFourShell.center_not_mem_support h'
      u_eq_source_or_not_mem_source_row := P.context.u_eq_source_or_not_mem_source_row }
  let Pnew : ExactFourRigid221PhysicalApexSourceEqUContext R :=
    { hcard := P.hcard
      surface := P.surface
      rho := P.rho
      source := P.source
      other := P.other
      hrho := P.hrho
      hfive := P.hfive
      u := P.u
      v := xv
      huNeV := huNeXv
      huClass := P.huClass
      hvClass := by simpa [C, xv] using hxvClass
      hvOmitted := by simpa [xv] using hxvNotURow
      huOmitted := by simpa [Hlate, xv] using huNotXvRow
      context := contextNew
      jointDeletion := J
      hclassFive := P.hclassFive
      globalDeletion := Gnew
      hcenter := by simpa [Gnew] using P.hcenter
      hsourceBlockerClass := P.hsourceBlockerClass
      huSource := P.huSource }
  exact
    false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV
      Pnew (by simpa [Pnew, xv] using packet.blocker_eq_xv)

/-- First-growth residual in which `u` and `xv` mutually omit one another.
This is strictly narrower than the former undifferentiated packet terminal. -/
theorem false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_uXvMutualOmission
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (_W :
      ExactFourRigid221SourceHeavyOtherXvExactFivePlacementPacket P packet)
    (hxvA : packet.xv ∈ D.A)
    (_huNotXvRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    False := by
  by_cases hxuXvRow :
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support
  · exact
      false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_uXvMutualOmission_xuXvRow
        P packet _W hxvA _huNotXvRow hxuXvRow
  by_cases hvXvRow :
      P.v.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support
  · exact
      false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_uXvMutualOmission_vXvRow_direct
        P packet hxvA _huNotXvRow hxuXvRow hvXvRow
  by_cases hdeletedXvRow :
      P.jointDeletion.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support
  · exact
      false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_uXvMutualOmission_deletedXvRow_direct
        P packet hxvA _huNotXvRow hxuXvRow hdeletedXvRow
  exact
    false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_uXvMutualOmission_twoDeletions
      P packet hxvA _huNotXvRow hvXvRow hdeletedXvRow

/-- First-growth residual in which `xu` and `xv` mutually omit one another
after `u` occupies the second slot of the `xv` row but is absent from the
`xu` row. -/
theorem false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_xuXvMutualOmission
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (W :
      ExactFourRigid221SourceHeavyOtherXvExactFivePlacementPacket P packet)
    (hxuA : packet.xu ∈ D.A)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (_huNotXuRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support)
    (_hxvNotXuRow :
      packet.xv ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support)
    (_hxuNotXvRow :
      packet.xu ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ku :=
    (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  let Kxv :=
    (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell
  have hxuInter :
      packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.source_row_trace]
    simp
  have hxvInter :
      packet.xv ∈
        (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.opposite_row_trace]
    simp
  have hxuClass :
      packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxuInter).2
  have hxvClass :
      packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxvInter).2

  have huInterior :
      P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [W.secondInterior_eq_named]
    simp
  have hxuInterior :
      packet.xu ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [W.secondInterior_eq_named]
    simp
  have hxvInterior :
      packet.xv ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [W.secondInterior_eq_named]
    simp

  have hcenterU :
      Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa [Hlate, P.huSource] using packet.blocker_eq_xv
  have hxuURow :
      packet.xu ∈ Ku.support :=
    (Finset.mem_inter.mp hxuInter).1
  have hxvNotURow : packet.xv ∉ Ku.support := by
    intro h
    rw [← hcenterU] at h
    exact Ku.center_not_mem_support h
  have huNeXu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply hxvNotURow
    simpa only [← h] using Ku.q_mem_support
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply hxvNotURow
    rw [← h]
    exact hxuURow

  have hcxvA : Hlate.centerAt packet.xv hxvA ∈ D.A := by
    exact Finset.mem_of_mem_erase Kxv.center_mem
  have hcxvNe :
      Hlate.centerAt packet.xv hxvA ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne Hlate packet.xv hxvA
  have hcxvEq :
      dist (Hlate.centerAt packet.xv hxvA) packet.xv =
        dist (Hlate.centerAt packet.xv hxvA) P.u.1 :=
    (Kxv.support_eq_radius _ Kxv.q_mem_support).trans
      (Kxv.support_eq_radius _ huXvRow).symm
  have hphysicalXvU :
      dist S.oppApex2 packet.xv = dist S.oppApex2 P.u.1 :=
    (mem_selectedClass.mp hxvClass).2.trans
      (mem_selectedClass.mp P.huClass).2.symm
  have hcxvInterior :
      Hlate.centerAt packet.xv hxvA ∈
        S.capInteriorByIndex S.oppIndex2 :=
    commonPhysicalPair_center_mem_secondCapInterior hcxvA hcxvNe
      hxvInterior huInterior huNeXv.symm hcxvEq hphysicalXvU
  rw [W.secondInterior_eq_named] at hcxvInterior
  simp only [Finset.mem_insert, Finset.mem_singleton] at hcxvInterior
  have hcxv :
      Hlate.centerAt packet.xv hxvA = packet.xu := by
    rcases hcxvInterior with h | h | h
    · apply False.elim
      apply Kxv.center_not_mem_support
      simpa only [h] using huXvRow
    · exact h
    · exact (centerAt_ne_source Hlate packet.xv hxvA h).elim

  have huxv_eq_xuxv :
      dist P.u.1 packet.xv = dist packet.xu packet.xv := by
    have h := (Ku.support_eq_radius _ Ku.q_mem_support).trans
      (Ku.support_eq_radius _ hxuURow).symm
    rw [hcenterU] at h
    simpa [dist_comm] using h
  have huxu_eq_xuxv :
      dist P.u.1 packet.xu = dist packet.xu packet.xv := by
    have h := hcxvEq
    rw [hcxv] at h
    simpa [dist_comm] using h.symm
  have huxu_eq_uxv :
      dist P.u.1 packet.xu = dist P.u.1 packet.xv :=
    huxu_eq_xuxv.trans huxv_eq_xuxv.symm

  have harea :
      signedArea2 P.u.1 packet.xu packet.xv ≠ 0 := by
    intro hzero
    exact D.convex.not_three_collinear P.u.2 hxuA hxvA
      huNeXu huNeXv hxuNeXv
      (collinear_of_signedArea2_eq_zero _ _ _ hzero)
  have hinnerU :
      0 ≤ inner ℝ (packet.xu - P.u.1) (packet.xv - P.u.1) :=
    equilateral_inner_nonneg huxu_eq_uxv huxu_eq_xuxv
  have hinnerXu :
      0 ≤ inner ℝ (packet.xv - packet.xu) (P.u.1 - packet.xu) := by
    apply equilateral_inner_nonneg
    · calc
        dist packet.xu packet.xv = dist P.u.1 packet.xu :=
          huxu_eq_xuxv.symm
        _ = dist packet.xu P.u.1 := dist_comm _ _
    · calc
        dist packet.xu packet.xv = dist P.u.1 packet.xu :=
          huxu_eq_xuxv.symm
        _ = dist P.u.1 packet.xv := huxu_eq_uxv
        _ = dist packet.xv P.u.1 := dist_comm _ _
  have hinnerXv :
      0 ≤ inner ℝ (P.u.1 - packet.xv) (packet.xu - packet.xv) := by
    apply equilateral_inner_nonneg
    · calc
        dist packet.xv P.u.1 = dist P.u.1 packet.xv := dist_comm _ _
        _ = dist P.u.1 packet.xu := huxu_eq_uxv.symm
        _ = dist packet.xu packet.xv := huxu_eq_xuxv
        _ = dist packet.xv packet.xu := dist_comm _ _
    · calc
        dist packet.xv P.u.1 = dist P.u.1 packet.xv := dist_comm _ _
        _ = dist P.u.1 packet.xu := huxu_eq_uxv.symm
  have hphysicalU := (mem_selectedClass.mp P.huClass).2
  have hphysicalXu := (mem_selectedClass.mp hxuClass).2
  have hphysicalXv := (mem_selectedClass.mp hxvClass).2
  have hhull :
      S.oppApex2 ∈
        convexHull ℝ ({P.u.1, packet.xu, packet.xv} : Set ℝ²) :=
    mem_convexHull_three_of_equidistant_nonobtuse harea
      (hphysicalU.trans hphysicalXu.symm)
      (hphysicalU.trans hphysicalXv.symm)
      hinnerU hinnerXu hinnerXv
  have happA : S.oppApex2 ∈ D.A :=
    P.surface.ingress.packet.center₂_mem_A
  have hneU : S.oppApex2 ≠ P.u.1 := by
    intro h
    rw [h, dist_self] at hphysicalU
    exact (ne_of_gt P.hrho) hphysicalU.symm
  have hneXu : S.oppApex2 ≠ packet.xu := by
    intro h
    rw [h, dist_self] at hphysicalXu
    exact (ne_of_gt P.hrho) hphysicalXu.symm
  have hneXv : S.oppApex2 ≠ packet.xv := by
    intro h
    rw [h, dist_self] at hphysicalXv
    exact (ne_of_gt P.hrho) hphysicalXv.symm
  have hsub :
      ({P.u.1, packet.xu, packet.xv} : Set ℝ²) ⊆
        (D.A : Set ℝ²) \ {S.oppApex2} := by
    simp only [Set.insert_subset_iff, Set.singleton_subset_iff]
    exact
      ⟨⟨Finset.mem_coe.mpr P.u.2, fun h => hneU h.symm⟩,
       ⟨Finset.mem_coe.mpr hxuA, fun h => hneXu h.symm⟩,
       ⟨Finset.mem_coe.mpr hxvA, fun h => hneXv h.symm⟩⟩
  exact D.convex S.oppApex2 (Finset.mem_coe.mpr happA)
    (convexHull_mono hsub hhull)

/-- Exact directed three-cycle residual among `u`, `xu`, and `xv`.
Each actual row contains its source and its named successor, and the reverse
incidences are absent by the two-point class-intersection bound. -/
theorem false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_directedCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (W :
      ExactFourRigid221SourceHeavyOtherXvExactFivePlacementPacket P packet)
    (hxuA : packet.xu ∈ D.A)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (huNotXuRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support)
    (hxvXuRow :
      packet.xv ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support)
    (hxuNotXvRow :
      packet.xu ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxu :=
    (Hlate.selectedAt packet.xu hxuA).toCriticalFourShell
  let Kxv :=
    (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell

  have hxuInter :
      packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.source_row_trace]
    simp
  have hxvInter :
      packet.xv ∈
        (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.opposite_row_trace]
    simp
  have hxuClass :
      packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxuInter).2
  have hxvClass :
      packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxvInter).2

  have huInterior :
      P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [W.secondInterior_eq_named]
    simp
  have hxuInterior :
      packet.xu ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [W.secondInterior_eq_named]
    simp
  have hxvInterior :
      packet.xv ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [W.secondInterior_eq_named]
    simp

  have hcxuA : Hlate.centerAt packet.xu hxuA ∈ D.A := by
    exact Finset.mem_of_mem_erase Kxu.center_mem
  have hcxuNe :
      Hlate.centerAt packet.xu hxuA ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne Hlate packet.xu hxuA
  have hcxuEq :
      dist (Hlate.centerAt packet.xu hxuA) packet.xu =
        dist (Hlate.centerAt packet.xu hxuA) packet.xv :=
    (Kxu.support_eq_radius _ Kxu.q_mem_support).trans
      (Kxu.support_eq_radius _ hxvXuRow).symm
  have hphysicalXuXv :
      dist S.oppApex2 packet.xu = dist S.oppApex2 packet.xv :=
    (mem_selectedClass.mp hxuClass).2.trans
      (mem_selectedClass.mp hxvClass).2.symm
  have hcxuInterior :
      Hlate.centerAt packet.xu hxuA ∈
        S.capInteriorByIndex S.oppIndex2 :=
    commonPhysicalPair_center_mem_secondCapInterior hcxuA hcxuNe
      hxuInterior hxvInterior
      (by
        intro h
        apply hxuNotXvRow
        rw [h]
        exact Kxv.q_mem_support)
      hcxuEq hphysicalXuXv
  rw [W.secondInterior_eq_named] at hcxuInterior
  simp only [Finset.mem_insert, Finset.mem_singleton] at hcxuInterior
  have hcxu :
      Hlate.centerAt packet.xu hxuA = P.u.1 := by
    rcases hcxuInterior with h | h | h
    · exact h
    · exact (centerAt_ne_source Hlate packet.xu hxuA h).elim
    · have hr := Kxu.support_eq_radius _ hxvXuRow
      rw [← h, dist_self] at hr
      linarith [Kxu.radius_pos]

  have hcxvA : Hlate.centerAt packet.xv hxvA ∈ D.A := by
    exact Finset.mem_of_mem_erase Kxv.center_mem
  have hcxvNe :
      Hlate.centerAt packet.xv hxvA ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne Hlate packet.xv hxvA
  have hcxvEq :
      dist (Hlate.centerAt packet.xv hxvA) packet.xv =
        dist (Hlate.centerAt packet.xv hxvA) P.u.1 :=
    (Kxv.support_eq_radius _ Kxv.q_mem_support).trans
      (Kxv.support_eq_radius _ huXvRow).symm
  have hphysicalXvU :
      dist S.oppApex2 packet.xv = dist S.oppApex2 P.u.1 :=
    (mem_selectedClass.mp hxvClass).2.trans
      (mem_selectedClass.mp P.huClass).2.symm
  have hcxvInterior :
      Hlate.centerAt packet.xv hxvA ∈
        S.capInteriorByIndex S.oppIndex2 :=
    commonPhysicalPair_center_mem_secondCapInterior hcxvA hcxvNe
      hxvInterior huInterior
      (by
        intro h
        apply huNotXuRow
        rw [← h]
        exact hxvXuRow)
      hcxvEq hphysicalXvU
  rw [W.secondInterior_eq_named] at hcxvInterior
  simp only [Finset.mem_insert, Finset.mem_singleton] at hcxvInterior
  have hcxv :
      Hlate.centerAt packet.xv hxvA = packet.xu := by
    rcases hcxvInterior with h | h | h
    · have hr := Kxv.support_eq_radius _ huXvRow
      rw [← h, dist_self] at hr
      linarith [Kxv.radius_pos]
    · exact h
    · exact (centerAt_ne_source Hlate packet.xv hxvA h).elim

  have huxu_eq_uxv :
      dist P.u.1 packet.xu = dist P.u.1 packet.xv := by
    simpa [hcxu] using hcxuEq
  have huxu_eq_xuxv :
      dist P.u.1 packet.xu = dist packet.xu packet.xv := by
    have h := hcxvEq
    rw [hcxv] at h
    calc
      dist P.u.1 packet.xu = dist packet.xu P.u.1 := dist_comm _ _
      _ = dist packet.xu packet.xv := h.symm

  have hu_ne_xu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have hu_ne_xv : P.u.1 ≠ packet.xv := by
    intro h
    apply huNotXuRow
    rw [h]
    exact hxvXuRow
  have hxu_ne_xv : packet.xu ≠ packet.xv := by
    intro h
    apply hxuNotXvRow
    rw [h]
    exact Kxv.q_mem_support
  have harea :
      signedArea2 P.u.1 packet.xu packet.xv ≠ 0 := by
    intro hzero
    exact D.convex.not_three_collinear P.u.2 hxuA hxvA
      hu_ne_xu hu_ne_xv hxu_ne_xv
      (collinear_of_signedArea2_eq_zero _ _ _ hzero)

  have hinnerU :
      0 ≤ inner ℝ (packet.xu - P.u.1) (packet.xv - P.u.1) :=
    equilateral_inner_nonneg huxu_eq_uxv huxu_eq_xuxv
  have hinnerXu :
      0 ≤ inner ℝ (packet.xv - packet.xu) (P.u.1 - packet.xu) := by
    apply equilateral_inner_nonneg
    · calc
        dist packet.xu packet.xv = dist P.u.1 packet.xu :=
          huxu_eq_xuxv.symm
        _ = dist packet.xu P.u.1 := dist_comm _ _
    · calc
        dist packet.xu packet.xv = dist P.u.1 packet.xu :=
          huxu_eq_xuxv.symm
        _ = dist P.u.1 packet.xv := huxu_eq_uxv
        _ = dist packet.xv P.u.1 := dist_comm _ _
  have hinnerXv :
      0 ≤ inner ℝ (P.u.1 - packet.xv) (packet.xu - packet.xv) := by
    apply equilateral_inner_nonneg
    · calc
        dist packet.xv P.u.1 = dist P.u.1 packet.xv := dist_comm _ _
        _ = dist P.u.1 packet.xu := huxu_eq_uxv.symm
        _ = dist packet.xu packet.xv := huxu_eq_xuxv
        _ = dist packet.xv packet.xu := dist_comm _ _
    · calc
        dist packet.xv P.u.1 = dist P.u.1 packet.xv := dist_comm _ _
        _ = dist P.u.1 packet.xu := huxu_eq_uxv.symm

  have hphysicalU := (mem_selectedClass.mp P.huClass).2
  have hphysicalXu := (mem_selectedClass.mp hxuClass).2
  have hphysicalXv := (mem_selectedClass.mp hxvClass).2
  have hhull :
      S.oppApex2 ∈
        convexHull ℝ ({P.u.1, packet.xu, packet.xv} : Set ℝ²) :=
    mem_convexHull_three_of_equidistant_nonobtuse harea
      (hphysicalU.trans hphysicalXu.symm)
      (hphysicalU.trans hphysicalXv.symm)
      hinnerU hinnerXu hinnerXv
  have happA : S.oppApex2 ∈ D.A :=
    P.surface.ingress.packet.center₂_mem_A
  have hneU : S.oppApex2 ≠ P.u.1 := by
    intro h
    rw [h, dist_self] at hphysicalU
    exact (ne_of_gt P.hrho) hphysicalU.symm
  have hneXu : S.oppApex2 ≠ packet.xu := by
    intro h
    rw [h, dist_self] at hphysicalXu
    exact (ne_of_gt P.hrho) hphysicalXu.symm
  have hneXv : S.oppApex2 ≠ packet.xv := by
    intro h
    rw [h, dist_self] at hphysicalXv
    exact (ne_of_gt P.hrho) hphysicalXv.symm
  have hsub :
      ({P.u.1, packet.xu, packet.xv} : Set ℝ²) ⊆
        (D.A : Set ℝ²) \ {S.oppApex2} := by
    simp only [Set.insert_subset_iff, Set.singleton_subset_iff]
    exact
      ⟨⟨Finset.mem_coe.mpr P.u.2, fun h => hneU h.symm⟩,
       ⟨Finset.mem_coe.mpr hxuA, fun h => hneXu h.symm⟩,
       ⟨Finset.mem_coe.mpr hxvA, fun h => hneXv h.symm⟩⟩
  exact D.convex S.oppApex2 (Finset.mem_coe.mpr happA)
    (convexHull_mono hsub hhull)

theorem false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_packet
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (_hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho)
    (_hblockerNeV :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (_W :
      ExactFourRigid221SourceHeavyOtherXvExactFivePlacementPacket P packet) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let C := SelectedClass D.A S.oppApex2 P.rho
  have hxuInter :
      packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support ∩ C := by
    simpa [Hlate, C] using
      (show packet.xu ∈
          ((lateFirstApexSystem R).selectedAt
              P.u.1 P.u.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.source_row_trace]
        simp)
  have hxvInter :
      packet.xv ∈
        (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩ C := by
    simpa [Hlate, C] using
      (show packet.xv ∈
          ((lateFirstApexSystem R).selectedAt
              P.v.1 P.v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.opposite_row_trace]
        simp)
  have hxuClass : packet.xu ∈ C := (Finset.mem_inter.mp hxuInter).2
  have hxvClass : packet.xv ∈ C := (Finset.mem_inter.mp hxvInter).2
  have hxuA : packet.xu ∈ D.A :=
    (mem_selectedClass.mp hxuClass).1
  have hxvA : packet.xv ∈ D.A :=
    (mem_selectedClass.mp hxvClass).1
  have hxuURow :
      packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support :=
    (Finset.mem_inter.mp hxuInter).1
  have hcenterU :
      Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa [Hlate, P.huSource] using packet.blocker_eq_xv
  have hxvNotURow :
      packet.xv ∉
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support := by
    intro h
    rw [← hcenterU] at h
    exact
      (Hlate.selectedAt
        P.u.1 P.u.2).toCriticalFourShell.center_not_mem_support h
  have huNeXu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply hxvNotURow
    rw [← h]
    exact
      (Hlate.selectedAt
        P.u.1 P.u.2).toCriticalFourShell.q_mem_support
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply hxvNotURow
    rw [← h]
    exact hxuURow
  by_cases huXvRow :
      P.u.1 ∈
        (Hlate.selectedAt
          packet.xv hxvA).toCriticalFourShell.support
  · have hcardXv :
        (((Hlate.selectedAt
              packet.xv hxvA).toCriticalFourShell.support ∩ C).card ≤ 2) := by
      let xv : CarrierVertex D.A := ⟨packet.xv, hxvA⟩
      simpa [Hlate, C, xv] using
        actualLateRow_secondClass_card_le_two R P.surface xv
    have hxvOwnInter :
        packet.xv ∈
          (Hlate.selectedAt
              packet.xv hxvA).toCriticalFourShell.support ∩ C :=
      Finset.mem_inter.mpr
        ⟨(Hlate.selectedAt
            packet.xv hxvA).toCriticalFourShell.q_mem_support,
          hxvClass⟩
    have huXvInter :
        P.u.1 ∈
          (Hlate.selectedAt
              packet.xv hxvA).toCriticalFourShell.support ∩ C :=
      Finset.mem_inter.mpr
        ⟨huXvRow, by simpa [C] using P.huClass⟩
    have hxuNotXvInter :
        packet.xu ∉
          (Hlate.selectedAt
              packet.xv hxvA).toCriticalFourShell.support ∩ C :=
      third_not_mem_of_card_le_two
        hcardXv hxvOwnInter huXvInter huNeXv.symm
          hxuNeXv.symm huNeXu
    have hxuNotXvRow :
        packet.xu ∉
          (Hlate.selectedAt
            packet.xv hxvA).toCriticalFourShell.support := by
      intro h
      exact hxuNotXvInter (Finset.mem_inter.mpr ⟨h, hxuClass⟩)
    by_cases huXuRow :
        P.u.1 ∈
          (Hlate.selectedAt
            packet.xu hxuA).toCriticalFourShell.support
    · exact
        false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_reciprocalArm
          P packet hxuA hxvA
            (by simpa [Hlate] using huXvRow)
            (by simpa [Hlate] using huXuRow)
    · by_cases hxvXuRow :
          packet.xv ∈
            (Hlate.selectedAt
              packet.xu hxuA).toCriticalFourShell.support
      · exact
          false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_directedCycle
            P packet _W hxuA hxvA
              (by simpa [Hlate] using huXvRow)
              (by simpa [Hlate] using huXuRow)
              (by simpa [Hlate] using hxvXuRow)
              (by simpa [Hlate] using hxuNotXvRow)
      · exact
          false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_xuXvMutualOmission
            P packet _W hxuA hxvA
              (by simpa [Hlate] using huXvRow)
              (by simpa [Hlate] using huXuRow)
              (by simpa [Hlate] using hxvXuRow)
              (by simpa [Hlate] using hxuNotXvRow)
  · exact
      false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_uXvMutualOmission
        P packet _W hxvA
          (by simpa [Hlate] using huXvRow)

/-- Exact-five physical-second-cap leaf with first-opposite-cap growth below
the source-heavy `other = xv` placement. -/
theorem false_of_exactFourRigid221_sourceHeavyOtherXv_exactFiveFirstGrowth
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (_hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho)
    (_hblockerNeV :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1)
    (_packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (_hother : P.other.1 = _packet.xv)
    (_hsecond : S.oppCap2.card = 5)
    (_hinterior :
      (S.capInteriorByIndex S.oppIndex2).card = 3)
    (_hfirst : ExactFourFirstOppositeCapGrowth S)
    (_hbudget : S.oppCap1.card + 7 = D.A.card) :
    False := by
  exact
    false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_packet
      P _hblockerVRow _hblockerNeV _packet
        (exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_packet
          P _packet _hother _hsecond _hinterior)

/-- Exact-five physical-second-cap arm with surplus-cap growth below the
source-heavy `other = xv` placement.  The growth profile is not consumed:
the shared exact-five placement packet already closes every incidence case. -/
theorem false_of_exactFourRigid221_sourceHeavyOtherXv_exactFiveSurplusGrowth
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (_hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho)
    (_hblockerNeV :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1)
    (_packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (_hother : P.other.1 = _packet.xv)
    (_hsecond : S.oppCap2.card = 5)
    (_hinterior :
      (S.capInteriorByIndex S.oppIndex2).card = 3)
    (_hsurplus : 6 ≤ S.surplusCap.card)
    (_hbudget :
      S.surplusCap.card + S.oppCap1.card + 2 = D.A.card)
    (_hten : 10 ≤ S.surplusCap.card + S.oppCap1.card) :
    False := by
  exact
    false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_packet
      P _hblockerVRow _hblockerNeV _packet
        (exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_packet
          P _packet _hother _hsecond _hinterior)

/-- Large-cap incidence leaf with `u` in the `xv` row and `v` in the `xu`
row, both reverse incidences absent.  All four class row traces are pinned
exactly — `{u, xu}`, `{v, xv}`, `{xv, u}`, `{xu, v}` — so the rigid class
carries the directed four-cycle `u → xu → v → xv → u` of row incidences.
The rigid deleted point is omitted from all four pinned rows, so every
pair `(deleted, ·)` is mutually omitted with a free blocker-distinctness
certificate, and casing on the second class slot of the deleted row
always leaves such a pair with two prescribed joint deletions. -/
theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_vXuRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (_hsecond : 6 ≤ S.oppCap2.card)
    (hxuA : packet.xu ∈ D.A)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (huNotXuRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support)
    (hxvNotXuRow :
      packet.xv ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support)
    (hvXuRow :
      P.v.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support) :
    False := by
  classical
  have hxuInter :
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
            P.u.1 P.u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.source_row_trace]
    simp
  have hxvInter :
      packet.xv ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.opposite_row_trace]
    simp
  have hxuClass :
      packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxuInter).2
  have hxvClass :
      packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxvInter).2
  have hxuURow :
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support :=
    (Finset.mem_inter.mp hxuInter).1
  have hxvVRow :
      packet.xv ∈
        ((lateFirstApexSystem R).selectedAt
          P.v.1 P.v.2).toCriticalFourShell.support :=
    (Finset.mem_inter.mp hxvInter).1
  have hcenterU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [P.huSource] using packet.blocker_eq_xv
  have hxvNotURow :
      packet.xv ∉
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support := by
    intro h
    rw [← hcenterU] at h
    exact
      ((lateFirstApexSystem R).selectedAt
        P.u.1 P.u.2).toCriticalFourShell.center_not_mem_support h
  have huNeXu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply hxvNotURow
    rw [← h]
    exact
      ((lateFirstApexSystem R).selectedAt
        P.u.1 P.u.2).toCriticalFourShell.q_mem_support
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply hxvNotURow
    rw [← h]
    exact hxuURow
  have hxuNeV : packet.xu ≠ P.v.1 := by
    intro h
    apply P.hvOmitted
    simpa only [← h] using hxuURow
  have hvNeXv : P.v.1 ≠ packet.xv := by
    intro h
    exact packet.xv_ne_v h.symm
  have huNeVpt : P.u.1 ≠ P.v.1 := by
    intro h
    exact P.huNeV (Subtype.ext h)
  have hdeletedNeXu : P.jointDeletion.deleted.1 ≠ packet.xu := by
    intro h
    apply P.jointDeletion.deleted_not_mem_uRow
    simpa only [h] using hxuURow
  have hdeletedNeXv : P.jointDeletion.deleted.1 ≠ packet.xv := by
    intro h
    apply P.jointDeletion.deleted_not_mem_vRow
    simpa only [h] using hxvVRow
  have hdeletedNeU : P.jointDeletion.deleted.1 ≠ P.u.1 := by
    intro h
    exact P.jointDeletion.deleted_ne_u (Subtype.ext h)
  have hdeletedNeV : P.jointDeletion.deleted.1 ≠ P.v.1 := by
    intro h
    exact P.jointDeletion.deleted_ne_v (Subtype.ext h)
  have hcardXv :
      (((lateFirstApexSystem R).selectedAt
            packet.xv hxvA).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho).card ≤ 2 :=
    actualLateRow_secondClass_card_le_two R P.surface ⟨packet.xv, hxvA⟩
  have hxvOwnInter :
      packet.xv ∈
        ((lateFirstApexSystem R).selectedAt
            packet.xv hxvA).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho :=
    Finset.mem_inter.mpr
      ⟨((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.q_mem_support,
        hxvClass⟩
  have huXvInter :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
            packet.xv hxvA).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho :=
    Finset.mem_inter.mpr ⟨huXvRow, P.huClass⟩
  have hvNotXvRow :
      P.v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support := by
    intro h
    exact
      third_not_mem_of_card_le_two hcardXv hxvOwnInter huXvInter
        huNeXv.symm hvNeXv.symm huNeVpt
        (Finset.mem_inter.mpr ⟨h, P.hvClass⟩)
  have hxuNotXvRow :
      packet.xu ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support := by
    intro h
    exact
      third_not_mem_of_card_le_two hcardXv hxvOwnInter huXvInter
        huNeXv.symm hxuNeXv.symm huNeXu
        (Finset.mem_inter.mpr ⟨h, hxuClass⟩)
  have hdeletedNotXvRow :
      P.jointDeletion.deleted.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support := by
    intro h
    exact
      third_not_mem_of_card_le_two hcardXv hxvOwnInter huXvInter
        huNeXv.symm hdeletedNeXv.symm hdeletedNeU.symm
        (Finset.mem_inter.mpr ⟨h, P.jointDeletion.deleted_mem_class⟩)
  have hcardXu :
      (((lateFirstApexSystem R).selectedAt
            packet.xu hxuA).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho).card ≤ 2 :=
    actualLateRow_secondClass_card_le_two R P.surface ⟨packet.xu, hxuA⟩
  have hxuOwnInter :
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
            packet.xu hxuA).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho :=
    Finset.mem_inter.mpr
      ⟨((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.q_mem_support,
        hxuClass⟩
  have hvXuInter :
      P.v.1 ∈
        ((lateFirstApexSystem R).selectedAt
            packet.xu hxuA).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho :=
    Finset.mem_inter.mpr ⟨hvXuRow, P.hvClass⟩
  have hdeletedNotXuRow :
      P.jointDeletion.deleted.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support := by
    intro h
    exact
      third_not_mem_of_card_le_two hcardXu hxuOwnInter hvXuInter
        hxuNeV hdeletedNeXu.symm hdeletedNeV.symm
        (Finset.mem_inter.mpr ⟨h, P.jointDeletion.deleted_mem_class⟩)
  have hxuNotVRow :
      packet.xu ∉
        ((lateFirstApexSystem R).selectedAt
          P.v.1 P.v.2).toCriticalFourShell.support := by
    intro h
    have hmem :
        packet.xu ∈
          ((lateFirstApexSystem R).selectedAt
              P.v.1 P.v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho :=
      Finset.mem_inter.mpr ⟨h, hxuClass⟩
    rw [packet.opposite_row_trace] at hmem
    simp only [Finset.mem_insert, Finset.mem_singleton] at hmem
    rcases hmem with h1 | h1
    · exact hxuNeV h1
    · exact hxuNeXv h1
  have hcardDel :
      (((lateFirstApexSystem R).selectedAt
            P.jointDeletion.deleted.1
            P.jointDeletion.deleted.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho).card ≤ 2 :=
    actualLateRow_secondClass_card_le_two R P.surface
      P.jointDeletion.deleted
  have hdelOwnInter :
      P.jointDeletion.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
            P.jointDeletion.deleted.1
            P.jointDeletion.deleted.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho :=
    Finset.mem_inter.mpr
      ⟨((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.q_mem_support,
        P.jointDeletion.deleted_mem_class⟩
  by_cases hUDel :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support
  · -- Deleted-row class trace `{deleted, u}`: two prescribed joint
    -- deletions for the mutually omitted pair `(deleted, xv)`.
    have huDelInter :
        P.u.1 ∈
          ((lateFirstApexSystem R).selectedAt
              P.jointDeletion.deleted.1
              P.jointDeletion.deleted.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho :=
      Finset.mem_inter.mpr ⟨hUDel, P.huClass⟩
    have hvNotDelRow :
        P.v.1 ∉
          ((lateFirstApexSystem R).selectedAt
            P.jointDeletion.deleted.1
            P.jointDeletion.deleted.2).toCriticalFourShell.support := by
      intro h
      exact
        third_not_mem_of_card_le_two hcardDel hdelOwnInter huDelInter
          hdeletedNeU hdeletedNeV huNeVpt
          (Finset.mem_inter.mpr ⟨h, P.hvClass⟩)
    have hxuNotDelRow :
        packet.xu ∉
          ((lateFirstApexSystem R).selectedAt
            P.jointDeletion.deleted.1
            P.jointDeletion.deleted.2).toCriticalFourShell.support := by
      intro h
      exact
        third_not_mem_of_card_le_two hcardDel hdelOwnInter huDelInter
          hdeletedNeU hdeletedNeXu huNeXu
          (Finset.mem_inter.mpr ⟨h, hxuClass⟩)
    have hxvNotDelRow :
        packet.xv ∉
          ((lateFirstApexSystem R).selectedAt
            P.jointDeletion.deleted.1
            P.jointDeletion.deleted.2).toCriticalFourShell.support := by
      intro h
      exact
        third_not_mem_of_card_le_two hcardDel hdelOwnInter huDelInter
          hdeletedNeU hdeletedNeXv huNeXv
          (Finset.mem_inter.mpr ⟨h, hxvClass⟩)
    have hblockersNe :
        (lateFirstApexSystem R).centerAt
            P.jointDeletion.deleted.1 P.jointDeletion.deleted.2 ≠
          (lateFirstApexSystem R).centerAt packet.xv hxvA := by
      intro hcenters
      have hsupports :=
        ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
          (lateFirstApexSystem R) P.jointDeletion.deleted.2 hxvA hcenters
      apply hdeletedNotXvRow
      rw [← hsupports]
      exact
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.q_mem_support
    rcases
        exactFourMutualOmissionJointDeletion_of_prescribed
          R P.surface P.rho P.jointDeletion.deleted ⟨packet.xv, hxvA⟩
            P.v P.hvClass hvNotDelRow hvNotXvRow hblockersNe with
      ⟨first, hfirst⟩
    rcases
        exactFourMutualOmissionJointDeletion_of_prescribed
          R P.surface P.rho P.jointDeletion.deleted ⟨packet.xv, hxvA⟩
            ⟨packet.xu, hxuA⟩ hxuClass hxuNotDelRow hxuNotXvRow
            hblockersNe with
      ⟨second, hsecond2⟩
    have hdeletionsNe : first.deleted ≠ second.deleted := by
      intro h
      exact
        hxuNeV
          (congrArg Subtype.val
            (hfirst.symm.trans (h.trans hsecond2))).symm
    exact
      false_of_twoDistinctExactFourMutualOmissionJointDeletions
        R P.hcard P.surface P.rho P.hrho P.hfive
          P.jointDeletion.deleted ⟨packet.xv, hxvA⟩
          (by
            intro hpair
            exact hdeletedNeXv (congrArg Subtype.val hpair))
          P.jointDeletion.deleted_mem_class hxvClass
          hxvNotDelRow hdeletedNotXvRow
          first second hdeletionsNe
  · by_cases hVDel :
        P.v.1 ∈
          ((lateFirstApexSystem R).selectedAt
            P.jointDeletion.deleted.1
            P.jointDeletion.deleted.2).toCriticalFourShell.support
    · -- Deleted-row class trace `{deleted, v}`: two prescribed joint
      -- deletions for the mutually omitted pair `(deleted, xu)`.
      have hvDelInter :
          P.v.1 ∈
            ((lateFirstApexSystem R).selectedAt
                P.jointDeletion.deleted.1
                P.jointDeletion.deleted.2).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 P.rho :=
        Finset.mem_inter.mpr ⟨hVDel, P.hvClass⟩
      have hxvNotDelRow :
          packet.xv ∉
            ((lateFirstApexSystem R).selectedAt
              P.jointDeletion.deleted.1
              P.jointDeletion.deleted.2).toCriticalFourShell.support := by
        intro h
        exact
          third_not_mem_of_card_le_two hcardDel hdelOwnInter hvDelInter
            hdeletedNeV hdeletedNeXv hvNeXv
            (Finset.mem_inter.mpr ⟨h, hxvClass⟩)
      have hxuNotDelRow :
          packet.xu ∉
            ((lateFirstApexSystem R).selectedAt
              P.jointDeletion.deleted.1
              P.jointDeletion.deleted.2).toCriticalFourShell.support := by
        intro h
        exact
          third_not_mem_of_card_le_two hcardDel hdelOwnInter hvDelInter
            hdeletedNeV hdeletedNeXu hxuNeV.symm
            (Finset.mem_inter.mpr ⟨h, hxuClass⟩)
      have hblockersNe :
          (lateFirstApexSystem R).centerAt
              P.jointDeletion.deleted.1 P.jointDeletion.deleted.2 ≠
            (lateFirstApexSystem R).centerAt packet.xu hxuA := by
        intro hcenters
        have hsupports :=
          ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
            (lateFirstApexSystem R) P.jointDeletion.deleted.2 hxuA
              hcenters
        apply hdeletedNotXuRow
        rw [← hsupports]
        exact
          ((lateFirstApexSystem R).selectedAt
            P.jointDeletion.deleted.1
            P.jointDeletion.deleted.2).toCriticalFourShell.q_mem_support
      rcases
          exactFourMutualOmissionJointDeletion_of_prescribed
            R P.surface P.rho P.jointDeletion.deleted ⟨packet.xu, hxuA⟩
              P.u P.huClass hUDel huNotXuRow hblockersNe with
        ⟨first, hfirst⟩
      rcases
          exactFourMutualOmissionJointDeletion_of_prescribed
            R P.surface P.rho P.jointDeletion.deleted ⟨packet.xu, hxuA⟩
              ⟨packet.xv, hxvA⟩ hxvClass hxvNotDelRow hxvNotXuRow
              hblockersNe with
        ⟨second, hsecond2⟩
      have hdeletionsNe : first.deleted ≠ second.deleted := by
        intro h
        exact
          huNeXv
            (congrArg Subtype.val
              (hfirst.symm.trans (h.trans hsecond2)))
      exact
        false_of_twoDistinctExactFourMutualOmissionJointDeletions
          R P.hcard P.surface P.rho P.hrho P.hfive
            P.jointDeletion.deleted ⟨packet.xu, hxuA⟩
            (by
              intro hpair
              exact hdeletedNeXu (congrArg Subtype.val hpair))
            P.jointDeletion.deleted_mem_class hxuClass
            hxuNotDelRow hdeletedNotXuRow
            first second hdeletionsNe
    · by_cases hXuDel :
          packet.xu ∈
            ((lateFirstApexSystem R).selectedAt
              P.jointDeletion.deleted.1
              P.jointDeletion.deleted.2).toCriticalFourShell.support
      · -- Deleted-row class trace `{deleted, xu}`: two prescribed joint
        -- deletions for the mutually omitted pair `(deleted, u)`.
        have hxuDelInter :
            packet.xu ∈
              ((lateFirstApexSystem R).selectedAt
                  P.jointDeletion.deleted.1
                  P.jointDeletion.deleted.2).toCriticalFourShell.support
                ∩ SelectedClass D.A S.oppApex2 P.rho :=
          Finset.mem_inter.mpr ⟨hXuDel, hxuClass⟩
        have hxvNotDelRow :
            packet.xv ∉
              ((lateFirstApexSystem R).selectedAt
                P.jointDeletion.deleted.1
                P.jointDeletion.deleted.2).toCriticalFourShell.support := by
          intro h
          exact
            third_not_mem_of_card_le_two hcardDel hdelOwnInter
              hxuDelInter hdeletedNeXu hdeletedNeXv hxuNeXv
              (Finset.mem_inter.mpr ⟨h, hxvClass⟩)
        have hblockersNe :
            (lateFirstApexSystem R).centerAt
                P.jointDeletion.deleted.1 P.jointDeletion.deleted.2 ≠
              (lateFirstApexSystem R).centerAt P.u.1 P.u.2 := by
          intro hcenters
          have hsupports :=
            ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
              (lateFirstApexSystem R) P.jointDeletion.deleted.2 P.u.2
                hcenters
          apply P.jointDeletion.deleted_not_mem_uRow
          rw [← hsupports]
          exact
            ((lateFirstApexSystem R).selectedAt
              P.jointDeletion.deleted.1
              P.jointDeletion.deleted.2).toCriticalFourShell.q_mem_support
        rcases
            exactFourMutualOmissionJointDeletion_of_prescribed
              R P.surface P.rho P.jointDeletion.deleted P.u
                P.v P.hvClass hVDel P.hvOmitted hblockersNe with
          ⟨first, hfirst⟩
        rcases
            exactFourMutualOmissionJointDeletion_of_prescribed
              R P.surface P.rho P.jointDeletion.deleted P.u
                ⟨packet.xv, hxvA⟩ hxvClass hxvNotDelRow hxvNotURow
                hblockersNe with
          ⟨second, hsecond2⟩
        have hdeletionsNe : first.deleted ≠ second.deleted := by
          intro h
          exact
            hvNeXv
              (congrArg Subtype.val
                (hfirst.symm.trans (h.trans hsecond2)))
        exact
          false_of_twoDistinctExactFourMutualOmissionJointDeletions
            R P.hcard P.surface P.rho P.hrho P.hfive
              P.jointDeletion.deleted P.u
              P.jointDeletion.deleted_ne_u
              P.jointDeletion.deleted_mem_class P.huClass
              hUDel P.jointDeletion.deleted_not_mem_uRow
              first second hdeletionsNe
      · -- The deleted row omits `u`, `v`, and `xu`: two prescribed joint
        -- deletions for the mutually omitted pair `(deleted, v)`.
        have hblockersNe :
            (lateFirstApexSystem R).centerAt
                P.jointDeletion.deleted.1 P.jointDeletion.deleted.2 ≠
              (lateFirstApexSystem R).centerAt P.v.1 P.v.2 := by
          intro hcenters
          have hsupports :=
            ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
              (lateFirstApexSystem R) P.jointDeletion.deleted.2 P.v.2
                hcenters
          apply P.jointDeletion.deleted_not_mem_vRow
          rw [← hsupports]
          exact
            ((lateFirstApexSystem R).selectedAt
              P.jointDeletion.deleted.1
              P.jointDeletion.deleted.2).toCriticalFourShell.q_mem_support
        rcases
            exactFourMutualOmissionJointDeletion_of_prescribed
              R P.surface P.rho P.jointDeletion.deleted P.v
                P.u P.huClass hUDel P.huOmitted hblockersNe with
          ⟨first, hfirst⟩
        rcases
            exactFourMutualOmissionJointDeletion_of_prescribed
              R P.surface P.rho P.jointDeletion.deleted P.v
                ⟨packet.xu, hxuA⟩ hxuClass hXuDel hxuNotVRow
                hblockersNe with
          ⟨second, hsecond2⟩
        have hdeletionsNe : first.deleted ≠ second.deleted := by
          intro h
          exact
            huNeXu
              (congrArg Subtype.val
                (hfirst.symm.trans (h.trans hsecond2)))
        exact
          false_of_twoDistinctExactFourMutualOmissionJointDeletions
            R P.hcard P.surface P.rho P.hrho P.hfive
              P.jointDeletion.deleted P.v
              P.jointDeletion.deleted_ne_v
              P.jointDeletion.deleted_mem_class P.hvClass
              hVDel P.jointDeletion.deleted_not_mem_vRow
              first second hdeletionsNe

private theorem exactFourRigid221_sourceHeavy_row_class_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (q : ℝ²) (hq : q ∈ D.A)
    {a b : ℝ²}
    (haRow :
      a ∈
        ((lateFirstApexSystem R).selectedAt
          q hq).toCriticalFourShell.support)
    (hbRow :
      b ∈
        ((lateFirstApexSystem R).selectedAt
          q hq).toCriticalFourShell.support)
    (haClass : a ∈ SelectedClass D.A S.oppApex2 P.rho)
    (hbClass : b ∈ SelectedClass D.A S.oppApex2 P.rho)
    (hab : a ≠ b)
    {x : ℝ²}
    (hxRow :
      x ∈
        ((lateFirstApexSystem R).selectedAt
          q hq).toCriticalFourShell.support)
    (hxClass : x ∈ SelectedClass D.A S.oppApex2 P.rho) :
    x = a ∨ x = b := by
  classical
  by_contra hcon
  push_neg at hcon
  have hcard :=
    ATailExactFourRobustCapExpansion.actualLateRow_secondClass_card_le_two
      (rho := P.rho) R P.surface ⟨q, hq⟩
  exact
    third_not_mem_of_card_le_two hcard
      (Finset.mem_inter.mpr ⟨haRow, haClass⟩)
      (Finset.mem_inter.mpr ⟨hbRow, hbClass⟩)
      hab (fun h => hcon.1 h.symm) (fun h => hcon.2 h.symm)
      (Finset.mem_inter.mpr ⟨hxRow, hxClass⟩)

/-- Class trace of the `xv` row of the pentagon configuration, pinned to
exactly `{xv, u}`.  Both points are on that row and in the physical class —
`xv` as the row source, `u` by the pentagon incidence hypothesis — and they
are distinct because `xv` is the `u`-row blocker, so the row pair bound
admits no third class point.  In particular the deleted point is off the
`xv` row.  Independent of the cap placement of `v` and `deleted`. -/
private theorem exactFourRigid221_sourceHeavy_pentagon_xvRow_trace_bound
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    ∀ x ∈
      ((lateFirstApexSystem R).selectedAt
        packet.xv hxvA).toCriticalFourShell.support,
      x ∈ SelectedClass D.A S.oppApex2 P.rho →
        x = packet.xv ∨ x = P.u.1 := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ku :=
    (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  let Kxv :=
    (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell
  have hxvInter :
      packet.xv ∈
        (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.opposite_row_trace]
    simp
  have hxvClass :
      packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxvInter).2
  have hcenterU :
      Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa [Hlate, P.huSource] using packet.blocker_eq_xv
  have hxvNotURow : packet.xv ∉ Ku.support := by
    intro h
    rw [← hcenterU] at h
    exact Ku.center_not_mem_support h
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply hxvNotURow
    simpa only [← h] using Ku.q_mem_support
  intro x hxRow hxClass
  exact
    exactFourRigid221_sourceHeavy_row_class_pair P packet.xv hxvA
      Kxv.q_mem_support huXvRow hxvClass P.huClass (Ne.symm huNeXv)
      hxRow hxClass

/-- Class trace of the `xu` row of the pentagon configuration, pinned to
exactly `{xu, deleted}`.  Both points are on that row and in the physical
class — `xu` as the row source and a source-row class point, `deleted` by
the placement hypothesis — and they are distinct because `xu` is off the
deleted row, so the row pair bound admits no third class point. -/
private theorem exactFourRigid221_sourceHeavy_pentagon_xuRow_trace_bound
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxuA : packet.xu ∈ D.A)
    (hdeletedXuRow :
      P.jointDeletion.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support)
    (hxuNotDeletedRow :
      packet.xu ∉
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support) :
    ∀ x ∈
      ((lateFirstApexSystem R).selectedAt
        packet.xu hxuA).toCriticalFourShell.support,
      x ∈ SelectedClass D.A S.oppApex2 P.rho →
        x = packet.xu ∨ x = P.jointDeletion.deleted.1 := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxu :=
    (Hlate.selectedAt packet.xu hxuA).toCriticalFourShell
  let Kdel :=
    (Hlate.selectedAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2).toCriticalFourShell
  have hxuInter :
      packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.source_row_trace]
    simp
  have hxuClass :
      packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxuInter).2
  have hxuNeDel : packet.xu ≠ P.jointDeletion.deleted.1 := by
    intro h
    apply hxuNotDeletedRow
    rw [h]
    exact Kdel.q_mem_support
  intro x hxRow hxClass
  exact
    exactFourRigid221_sourceHeavy_row_class_pair P packet.xu hxuA
      Kxu.q_mem_support hdeletedXuRow hxuClass
      P.jointDeletion.deleted_mem_class hxuNeDel hxRow hxClass

/-- Equilateral kill for any three distinct physical class points: they are
inscribed in the physical class circle centred at the second apex, so a
pairwise-equidistant triple is an equilateral triangle whose circumcentre
is that apex, putting the apex inside their convex hull and contradicting
strict convex position of the carrier. -/
private theorem exactFourRigid221_sourceHeavy_equilateral_class_triple_false
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    {x y z : ℝ²}
    (hxA : x ∈ D.A) (hyA : y ∈ D.A) (hzA : z ∈ D.A)
    (hxy : x ≠ y) (hxz : x ≠ z) (hyz : y ≠ z)
    (hxClass : x ∈ SelectedClass D.A S.oppApex2 P.rho)
    (hyClass : y ∈ SelectedClass D.A S.oppApex2 P.rho)
    (hzClass : z ∈ SelectedClass D.A S.oppApex2 P.rho)
    (hxz_eq_yz : dist x z = dist y z)
    (hxy_eq_yz : dist x y = dist y z) :
    False := by
  classical
  have hxy_eq_xz : dist x y = dist x z :=
    hxy_eq_yz.trans hxz_eq_yz.symm
  have harea : signedArea2 x y z ≠ 0 := by
    intro hzero
    exact D.convex.not_three_collinear hxA hyA hzA hxy hxz hyz
      (collinear_of_signedArea2_eq_zero _ _ _ hzero)
  have hinnerX : 0 ≤ inner ℝ (y - x) (z - x) :=
    equilateral_inner_nonneg hxy_eq_xz hxy_eq_yz
  have hinnerY : 0 ≤ inner ℝ (z - y) (x - y) := by
    apply equilateral_inner_nonneg
    · calc
        dist y z = dist x y := hxy_eq_yz.symm
        _ = dist y x := dist_comm _ _
    · calc
        dist y z = dist x y := hxy_eq_yz.symm
        _ = dist x z := hxy_eq_xz
        _ = dist z x := dist_comm _ _
  have hinnerZ : 0 ≤ inner ℝ (x - z) (y - z) := by
    apply equilateral_inner_nonneg
    · calc
        dist z x = dist x z := dist_comm _ _
        _ = dist x y := hxy_eq_xz.symm
        _ = dist y z := hxy_eq_yz
        _ = dist z y := dist_comm _ _
    · calc
        dist z x = dist x z := dist_comm _ _
        _ = dist x y := hxy_eq_xz.symm
  have hphysicalX := (mem_selectedClass.mp hxClass).2
  have hphysicalY := (mem_selectedClass.mp hyClass).2
  have hphysicalZ := (mem_selectedClass.mp hzClass).2
  have hhull :
      S.oppApex2 ∈ convexHull ℝ ({x, y, z} : Set ℝ²) :=
    mem_convexHull_three_of_equidistant_nonobtuse harea
      (hphysicalX.trans hphysicalY.symm)
      (hphysicalX.trans hphysicalZ.symm)
      hinnerX hinnerY hinnerZ
  have happA : S.oppApex2 ∈ D.A :=
    P.surface.ingress.packet.center₂_mem_A
  have hneX : S.oppApex2 ≠ x := by
    intro h
    rw [h, dist_self] at hphysicalX
    exact (ne_of_gt P.hrho) hphysicalX.symm
  have hneY : S.oppApex2 ≠ y := by
    intro h
    rw [h, dist_self] at hphysicalY
    exact (ne_of_gt P.hrho) hphysicalY.symm
  have hneZ : S.oppApex2 ≠ z := by
    intro h
    rw [h, dist_self] at hphysicalZ
    exact (ne_of_gt P.hrho) hphysicalZ.symm
  have hsub :
      ({x, y, z} : Set ℝ²) ⊆ (D.A : Set ℝ²) \ {S.oppApex2} := by
    simp only [Set.insert_subset_iff, Set.singleton_subset_iff]
    exact
      ⟨⟨Finset.mem_coe.mpr hxA, fun h => hneX h.symm⟩,
       ⟨Finset.mem_coe.mpr hyA, fun h => hneY h.symm⟩,
       ⟨Finset.mem_coe.mpr hzA, fun h => hneZ h.symm⟩⟩
  exact D.convex S.oppApex2 (Finset.mem_coe.mpr happA)
    (convexHull_mono hsub hhull)

/-- Equilateral kill specialised to the pentagon triple `{u, xu, xv}`,
whose distinctness and class membership come from the packet. -/
private theorem exactFourRigid221_sourceHeavy_pentagon_equilateralXu_false
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxuA : packet.xu ∈ D.A)
    (hxvA : packet.xv ∈ D.A)
    (huxv_eq_xuxv :
      dist P.u.1 packet.xv = dist packet.xu packet.xv)
    (huxu_eq_xuxv :
      dist P.u.1 packet.xu = dist packet.xu packet.xv) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ku :=
    (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  have hxuInter :
      packet.xu ∈
        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.source_row_trace]
    simp
  have hxvInter :
      packet.xv ∈
        (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.opposite_row_trace]
    simp
  have hxuClass :
      packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxuInter).2
  have hxvClass :
      packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxvInter).2
  have hcenterU :
      Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa [Hlate, P.huSource] using packet.blocker_eq_xv
  have hxuURow :
      packet.xu ∈ Ku.support :=
    (Finset.mem_inter.mp hxuInter).1
  have hxvNotURow : packet.xv ∉ Ku.support := by
    intro h
    rw [← hcenterU] at h
    exact Ku.center_not_mem_support h
  have huNeXu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply hxvNotURow
    simpa only [← h] using Ku.q_mem_support
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply hxvNotURow
    rw [← h]
    exact hxuURow
  exact exactFourRigid221_sourceHeavy_equilateral_class_triple_false
    P P.u.2 hxuA hxvA huNeXu huNeXv hxuNeXv P.huClass hxuClass hxvClass
    huxv_eq_xuxv huxu_eq_xuxv

/-- The `xv`-row blocker of the pentagon lies in the strict physical
second-cap interior.  It is equidistant from the pinned class edge
`{xv, u}` of that row, `u` is strict-interior by the packet's source-pair
interiority and `xv` by the two-center localization at the source row, so
the two-center cap localization applies to the pair. -/
private theorem exactFourRigid221_sourceHeavy_pentagon_blocker_mem_secondCapInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    (lateFirstApexSystem R).centerAt packet.xv hxvA ∈
      S.capInteriorByIndex S.oppIndex2 := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ku :=
    (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  let Kxv :=
    (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell
  have hxvInterior :=
    exactFourRigid221_sourceHeavy_xv_mem_secondCapInterior P packet
  have hxvInter :
      packet.xv ∈
        (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.opposite_row_trace]
    simp
  have hxvClass :
      packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxvInter).2
  have hcenterU :
      Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa [Hlate, P.huSource] using packet.blocker_eq_xv
  have hxvNotURow : packet.xv ∉ Ku.support := by
    intro h
    rw [← hcenterU] at h
    exact Ku.center_not_mem_support h
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply hxvNotURow
    simpa only [← h] using Ku.q_mem_support
  have huInterior :
      P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hmem :
        P.u.1 ∈ ({P.u.1, packet.xu} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 := by
      rw [packet.source_pair_interior]
      simp
    exact (Finset.mem_inter.mp hmem).2
  have hcxvA : Hlate.centerAt packet.xv hxvA ∈ D.A :=
    Finset.mem_of_mem_erase Kxv.center_mem
  have hcxvNe :
      Hlate.centerAt packet.xv hxvA ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne Hlate packet.xv hxvA
  have hcxvEq :
      dist (Hlate.centerAt packet.xv hxvA) packet.xv =
        dist (Hlate.centerAt packet.xv hxvA) P.u.1 :=
    (Kxv.support_eq_radius _ Kxv.q_mem_support).trans
      (Kxv.support_eq_radius _ huXvRow).symm
  have hphysicalXvU :
      dist S.oppApex2 packet.xv = dist S.oppApex2 P.u.1 :=
    (mem_selectedClass.mp hxvClass).2.trans
      (mem_selectedClass.mp P.huClass).2.symm
  exact commonPhysicalPair_center_mem_secondCapInterior hcxvA hcxvNe
    hxvInterior huInterior huNeXv.symm hcxvEq hphysicalXvU

/-- Pentagon blocker leaf: the `xv`-row blocker is the deleted point.
Narrowing over the parent pentagon: the blocker is pinned to a named class
point, which also puts the deleted point in the strict second-cap interior
via the parent-proved blocker localization, and the deleted point is
therefore equidistant from the pinned edge `{xv, u}` while being off the
`xv` row.  The five-cycle class traces are carried unchanged. -/
theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerDeleted
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (_packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (_hsecond : 6 ≤ S.oppCap2.card)
    (hxuA : _packet.xu ∈ D.A)
    (hxvA : _packet.xv ∈ D.A)
    (_huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          _packet.xv hxvA).toCriticalFourShell.support)
    (_huNotXuRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          _packet.xu hxuA).toCriticalFourShell.support)
    (_hxvNotXuRow :
      _packet.xv ∉
        ((lateFirstApexSystem R).selectedAt
          _packet.xu hxuA).toCriticalFourShell.support)
    (_hdeletedXuRow :
      P.jointDeletion.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          _packet.xu hxuA).toCriticalFourShell.support)
    (_hvDeletedRow :
      P.v.1 ∈
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support)
    (_huNotDeletedRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support)
    (_hxuNotDeletedRow :
      _packet.xu ∉
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support)
    (_hxvNotDeletedRow :
      _packet.xv ∉
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support)
    (_hclassFive :
      ∀ q ∈ SelectedClass D.A S.oppApex2 P.rho,
        q = P.u.1 ∨ q = _packet.xu ∨ q = P.jointDeletion.deleted.1 ∨
          q = P.v.1 ∨ q = _packet.xv)
    (_hxvInterior :
      _packet.xv ∈ S.capInteriorByIndex S.oppIndex2)
    (_hblockerInterior :
      (lateFirstApexSystem R).centerAt _packet.xv hxvA ∈
        S.capInteriorByIndex S.oppIndex2)
    (_hblockerEqDeleted :
      (lateFirstApexSystem R).centerAt _packet.xv hxvA =
        P.jointDeletion.deleted.1)
    (_htraceBound :
      ∀ x ∈
        ((lateFirstApexSystem R).selectedAt
          _packet.xv hxvA).toCriticalFourShell.support,
        x ∈ SelectedClass D.A S.oppApex2 P.rho →
          x = _packet.xv ∨ x = P.u.1)
    (_htraceBoundXu :
      ∀ x ∈
        ((lateFirstApexSystem R).selectedAt
          _packet.xu hxuA).toCriticalFourShell.support,
        x ∈ SelectedClass D.A S.oppApex2 P.rho →
          x = _packet.xu ∨ x = P.jointDeletion.deleted.1) :
    False := by
  sorry

/-- Full residual packet for the pentagon branch in which the `xv`-row
blocker is the opposite source `v`.  The child leaves below split only on
the actual blocker of the next row, centred at `v`, while retaining every
hypothesis of the parent. -/
structure ExactFourRigid221PentagonBlockerVResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P) : Type where
  hsecond : 6 ≤ S.oppCap2.card
  hxuA : packet.xu ∈ D.A
  hxvA : packet.xv ∈ D.A
  huXvRow :
    P.u.1 ∈
      ((lateFirstApexSystem R).selectedAt
        packet.xv hxvA).toCriticalFourShell.support
  huNotXuRow :
    P.u.1 ∉
      ((lateFirstApexSystem R).selectedAt
        packet.xu hxuA).toCriticalFourShell.support
  hxvNotXuRow :
    packet.xv ∉
      ((lateFirstApexSystem R).selectedAt
        packet.xu hxuA).toCriticalFourShell.support
  hdeletedXuRow :
    P.jointDeletion.deleted.1 ∈
      ((lateFirstApexSystem R).selectedAt
        packet.xu hxuA).toCriticalFourShell.support
  hvDeletedRow :
    P.v.1 ∈
      ((lateFirstApexSystem R).selectedAt
        P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2).toCriticalFourShell.support
  huNotDeletedRow :
    P.u.1 ∉
      ((lateFirstApexSystem R).selectedAt
        P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2).toCriticalFourShell.support
  hxuNotDeletedRow :
    packet.xu ∉
      ((lateFirstApexSystem R).selectedAt
        P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2).toCriticalFourShell.support
  hxvNotDeletedRow :
    packet.xv ∉
      ((lateFirstApexSystem R).selectedAt
        P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2).toCriticalFourShell.support
  hclassFive :
    ∀ q ∈ SelectedClass D.A S.oppApex2 P.rho,
      q = P.u.1 ∨ q = packet.xu ∨ q = P.jointDeletion.deleted.1 ∨
        q = P.v.1 ∨ q = packet.xv
  hxvInterior : packet.xv ∈ S.capInteriorByIndex S.oppIndex2
  hblockerInterior :
    (lateFirstApexSystem R).centerAt packet.xv hxvA ∈
      S.capInteriorByIndex S.oppIndex2
  hblockerEqV :
    (lateFirstApexSystem R).centerAt packet.xv hxvA = P.v.1
  htraceBound :
    ∀ x ∈
      ((lateFirstApexSystem R).selectedAt
        packet.xv hxvA).toCriticalFourShell.support,
      x ∈ SelectedClass D.A S.oppApex2 P.rho →
        x = packet.xv ∨ x = P.u.1
  htraceBoundXu :
    ∀ x ∈
      ((lateFirstApexSystem R).selectedAt
        packet.xu hxuA).toCriticalFourShell.support,
      x ∈ SelectedClass D.A S.oppApex2 P.rho →
        x = packet.xu ∨ x = P.jointDeletion.deleted.1

/-- Three successive perpendicular-bisector incidences cannot form a cycle
inside one strictly ordered minor cap. -/
theorem false_of_orderedCap_three_equidistant_betweenness_cycle
    {A : Finset ℝ²} {m : ℕ} {L : CGN.OrderedCap m}
    (Packet : CGN.MecCapPacket A L)
    (Hside : CGN.MinorCapSideHypotheses Packet)
    (Hord : CGN.StrictCapOrder A L)
    {iu ix iv iy : Fin m}
    (hiu_ix : iu ≠ ix)
    (hiy_iu : iy ≠ iu) (hiy_ix : iy ≠ ix)
    (hiv_iy : iv ≠ iy) (hiv_iu : iv ≠ iu)
    (hix_iv : ix ≠ iv)
    (hY : dist (L.points iy) (L.points iu) =
      dist (L.points iy) (L.points ix))
    (hV : dist (L.points iv) (L.points iy) =
      dist (L.points iv) (L.points iu))
    (hX : dist (L.points ix) (L.points iv) =
      dist (L.points ix) (L.points iy)) :
    False := by
  rcases lt_or_gt_of_ne hiu_ix with hiuix | hixiu
  · have hYbetween := CGN.index_strictly_between_of_equidistant
      Packet Hside Hord hiuix hiy_iu hiy_ix hY
    rcases lt_or_gt_of_ne hiy_iu with hiyiu | hiuiy
    · have hVbetween := CGN.index_strictly_between_of_equidistant
        Packet Hside Hord hiyiu hiv_iy hiv_iu hV
      rcases lt_or_gt_of_ne hiv_iy with hiviy | hiyiv
      · have hXbetween := CGN.index_strictly_between_of_equidistant
          Packet Hside Hord hiviy hix_iv hiy_ix.symm hX
        omega
      · have hXbetween := CGN.index_strictly_between_of_equidistant
          Packet Hside Hord hiyiv hiy_ix.symm hix_iv hX.symm
        omega
    · have hVbetween := CGN.index_strictly_between_of_equidistant
        Packet Hside Hord hiuiy hiv_iu hiv_iy hV.symm
      rcases lt_or_gt_of_ne hiv_iy with hiviy | hiyiv
      · have hXbetween := CGN.index_strictly_between_of_equidistant
          Packet Hside Hord hiviy hix_iv hiy_ix.symm hX
        omega
      · have hXbetween := CGN.index_strictly_between_of_equidistant
          Packet Hside Hord hiyiv hiy_ix.symm hix_iv hX.symm
        omega
  · have hYbetween := CGN.index_strictly_between_of_equidistant
      Packet Hside Hord hixiu hiy_ix hiy_iu hY.symm
    rcases lt_or_gt_of_ne hiy_iu with hiyiu | hiuiy
    · have hVbetween := CGN.index_strictly_between_of_equidistant
        Packet Hside Hord hiyiu hiv_iy hiv_iu hV
      rcases lt_or_gt_of_ne hiv_iy with hiviy | hiyiv
      · have hXbetween := CGN.index_strictly_between_of_equidistant
          Packet Hside Hord hiviy hix_iv hiy_ix.symm hX
        omega
      · have hXbetween := CGN.index_strictly_between_of_equidistant
          Packet Hside Hord hiyiv hiy_ix.symm hix_iv hX.symm
        omega
    · have hVbetween := CGN.index_strictly_between_of_equidistant
        Packet Hside Hord hiuiy hiv_iu hiv_iy hV.symm
      rcases lt_or_gt_of_ne hiv_iy with hiviy | hiyiv
      · have hXbetween := CGN.index_strictly_between_of_equidistant
          Packet Hside Hord hiviy hix_iv hiy_ix.symm hX
        omega
      · have hXbetween := CGN.index_strictly_between_of_equidistant
          Packet Hside Hord hiyiv hiy_ix.symm hix_iv hX.symm
        omega

/-- Four successive perpendicular-bisector incidences cannot form a cycle
inside one strictly ordered minor cap. -/
theorem false_of_orderedCap_four_equidistant_betweenness_cycle
    {A : Finset ℝ²} {m : ℕ} {L : CGN.OrderedCap m}
    (Packet : CGN.MecCapPacket A L)
    (Hside : CGN.MinorCapSideHypotheses Packet)
    (Hord : CGN.StrictCapOrder A L)
    {iu ix iy iv iz : Fin m}
    (hiu_ix : iu ≠ ix)
    (hiy_iu : iy ≠ iu) (hiy_ix : iy ≠ ix)
    (hiv_iy : iv ≠ iy) (hiv_iu : iv ≠ iu)
    (hiz_iv : iz ≠ iv) (hiz_iy : iz ≠ iy)
    (hix_iz : ix ≠ iz) (hix_iv : ix ≠ iv)
    (hY : dist (L.points iy) (L.points iu) =
      dist (L.points iy) (L.points ix))
    (hV : dist (L.points iv) (L.points iy) =
      dist (L.points iv) (L.points iu))
    (hZ : dist (L.points iz) (L.points iv) =
      dist (L.points iz) (L.points iy))
    (hX : dist (L.points ix) (L.points iz) =
      dist (L.points ix) (L.points iv)) :
    False := by
  have between_of_equidistant :
      ∀ {j r s : Fin m}, r ≠ s → j ≠ r → j ≠ s →
        dist (L.points j) (L.points r) =
          dist (L.points j) (L.points s) →
        (r < j ∧ j < s) ∨ (s < j ∧ j < r) := by
    intro j r s hrs hjr hjs heq
    rcases lt_or_gt_of_ne hrs with hrslt | hsrlt
    · exact Or.inl
        (CGN.index_strictly_between_of_equidistant
          Packet Hside Hord hrslt hjr hjs heq)
    · exact Or.inr
        (CGN.index_strictly_between_of_equidistant
          Packet Hside Hord hsrlt hjs hjr heq.symm)
  have hYbetween := between_of_equidistant hiu_ix hiy_iu hiy_ix hY
  have hVbetween := between_of_equidistant hiy_iu hiv_iy hiv_iu hV
  have hZbetween := between_of_equidistant hiv_iy hiz_iv hiz_iy hZ
  have hXbetween := between_of_equidistant hiz_iv hix_iz hix_iv hX
  rcases hYbetween with hYbetween | hYbetween <;>
    rcases hVbetween with hVbetween | hVbetween <;>
    rcases hZbetween with hZbetween | hZbetween <;>
    rcases hXbetween with hXbetween | hXbetween <;> omega

/-- A point in a strictly ordered minor cap cannot be equidistant from three
distinct points of the same cap.  Each of the three pairs would have to
straddle the center in the linear cap order. -/
theorem false_of_orderedCap_center_equidistant_three_points
    {A : Finset ℝ²} {m : ℕ} {L : CGN.OrderedCap m}
    (Packet : CGN.MecCapPacket A L)
    (Hside : CGN.MinorCapSideHypotheses Packet)
    (Hord : CGN.StrictCapOrder A L)
    {id ic ia ib : Fin m}
    (hic_ia : ic ≠ ia) (hic_ib : ic ≠ ib) (hia_ib : ia ≠ ib)
    (hid_ic : id ≠ ic) (hid_ia : id ≠ ia) (hid_ib : id ≠ ib)
    (hca : dist (L.points id) (L.points ic) =
      dist (L.points id) (L.points ia))
    (hcb : dist (L.points id) (L.points ic) =
      dist (L.points id) (L.points ib)) :
    False := by
  have between_of_equidistant :
      ∀ {j r s : Fin m}, r ≠ s → j ≠ r → j ≠ s →
        dist (L.points j) (L.points r) =
          dist (L.points j) (L.points s) →
        (r < j ∧ j < s) ∨ (s < j ∧ j < r) := by
    intro j r s hrs hjr hjs heq
    rcases lt_or_gt_of_ne hrs with hrslt | hsrlt
    · exact Or.inl
        (CGN.index_strictly_between_of_equidistant
          Packet Hside Hord hrslt hjr hjs heq)
    · exact Or.inr
        (CGN.index_strictly_between_of_equidistant
          Packet Hside Hord hsrlt hjs hjr heq.symm)
  have hcaBetween := between_of_equidistant hic_ia hid_ic hid_ia hca
  have hcbBetween := between_of_equidistant hic_ib hid_ic hid_ib hcb
  have habBetween := between_of_equidistant hia_ib hid_ia hid_ib
    (hca.symm.trans hcb)
  rcases hcaBetween with hcaBetween | hcaBetween <;>
    rcases hcbBetween with hcbBetween | hcbBetween <;>
    rcases habBetween with habBetween | habBetween <;> omega

/-- Four points in one strict cap cannot consist of a center and three
distinct points equidistant from that center. -/
theorem false_of_capInterior_center_equidistant_three_points
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {i : Fin 3}
    {d c a b : ℝ²}
    (hd : d ∈ S.capInteriorByIndex i)
    (hc : c ∈ S.capInteriorByIndex i)
    (ha : a ∈ S.capInteriorByIndex i)
    (hb : b ∈ S.capInteriorByIndex i)
    (hca : c ≠ a) (hcb : c ≠ b) (hab : a ≠ b)
    (hdc : d ≠ c) (hda : d ≠ a) (hdb : d ≠ b)
    (hdca : dist d c = dist d a)
    (hdcb : dist d c = dist d b) :
    False := by
  rcases S.capByIndex_cgn4g_capData D.convex i with
    ⟨m, L, Packet, Hside, Hord, hcap⟩
  have point_mem_image {z : ℝ²}
      (hz : z ∈ S.capInteriorByIndex i) :
      z ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex i hz
  rcases Finset.mem_image.mp (point_mem_image hd) with ⟨id, _hidMem, hid⟩
  rcases Finset.mem_image.mp (point_mem_image hc) with ⟨ic, _hicMem, hic⟩
  rcases Finset.mem_image.mp (point_mem_image ha) with ⟨ia, _hiaMem, hia⟩
  rcases Finset.mem_image.mp (point_mem_image hb) with ⟨ib, _hibMem, hib⟩
  have hic_ia : ic ≠ ia := by
    intro h
    apply hca
    rw [← hic, ← hia, h]
  have hic_ib : ic ≠ ib := by
    intro h
    apply hcb
    rw [← hic, ← hib, h]
  have hia_ib : ia ≠ ib := by
    intro h
    apply hab
    rw [← hia, ← hib, h]
  have hid_ic : id ≠ ic := by
    intro h
    apply hdc
    rw [← hid, ← hic, h]
  have hid_ia : id ≠ ia := by
    intro h
    apply hda
    rw [← hid, ← hia, h]
  have hid_ib : id ≠ ib := by
    intro h
    apply hdb
    rw [← hid, ← hib, h]
  exact false_of_orderedCap_center_equidistant_three_points
    Packet Hside Hord hic_ia hic_ib hia_ib hid_ic hid_ia hid_ib
    (by simpa only [hid, hic, hia] using hdca)
    (by simpa only [hid, hic, hib] using hdcb)

/-- Four linked perpendicular-bisector incidences cannot form the indicated
hook cycle inside one strict cap: `d` bisects `a,b`, `c` bisects `d,a`, `e`
bisects `c,d`, and `a` bisects `b,e`. -/
theorem false_of_capInterior_four_equidistant_hook_cycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {i : Fin 3}
    {a b c d e : ℝ²}
    (ha : a ∈ S.capInteriorByIndex i)
    (hb : b ∈ S.capInteriorByIndex i)
    (hc : c ∈ S.capInteriorByIndex i)
    (hd : d ∈ S.capInteriorByIndex i)
    (he : e ∈ S.capInteriorByIndex i)
    (hab : a ≠ b)
    (hda : d ≠ a) (hdb : d ≠ b)
    (hcd : c ≠ d) (hca : c ≠ a)
    (hec : e ≠ c) (hed : e ≠ d)
    (hae : a ≠ e) (hbe : b ≠ e)
    (hD : dist d a = dist d b)
    (hC : dist c d = dist c a)
    (hE : dist e c = dist e d)
    (hA : dist a b = dist a e) :
    False := by
  rcases S.capByIndex_cgn4g_capData D.convex i with
    ⟨m, L, Packet, Hside, Hord, hcap⟩
  have point_mem_image {z : ℝ²}
      (hz : z ∈ S.capInteriorByIndex i) :
      z ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex i hz
  rcases Finset.mem_image.mp (point_mem_image ha) with ⟨ia, _hiaMem, hia⟩
  rcases Finset.mem_image.mp (point_mem_image hb) with ⟨ib, _hibMem, hib⟩
  rcases Finset.mem_image.mp (point_mem_image hc) with ⟨ic, _hicMem, hic⟩
  rcases Finset.mem_image.mp (point_mem_image hd) with ⟨id, _hidMem, hid⟩
  rcases Finset.mem_image.mp (point_mem_image he) with ⟨ie, _hieMem, hie⟩
  have hia_ib : ia ≠ ib := by
    intro h; apply hab; rw [← hia, ← hib, h]
  have hid_ia : id ≠ ia := by
    intro h; apply hda; rw [← hid, ← hia, h]
  have hid_ib : id ≠ ib := by
    intro h; apply hdb; rw [← hid, ← hib, h]
  have hic_id : ic ≠ id := by
    intro h; apply hcd; rw [← hic, ← hid, h]
  have hic_ia : ic ≠ ia := by
    intro h; apply hca; rw [← hic, ← hia, h]
  have hie_ic : ie ≠ ic := by
    intro h; apply hec; rw [← hie, ← hic, h]
  have hie_id : ie ≠ id := by
    intro h; apply hed; rw [← hie, ← hid, h]
  have hia_ie : ia ≠ ie := by
    intro h; apply hae; rw [← hia, ← hie, h]
  have hib_ie : ib ≠ ie := by
    intro h; apply hbe; rw [← hib, ← hie, h]
  have between_of_equidistant :
      ∀ {j r s : Fin m}, r ≠ s → j ≠ r → j ≠ s →
        dist (L.points j) (L.points r) =
          dist (L.points j) (L.points s) →
        (r < j ∧ j < s) ∨ (s < j ∧ j < r) := by
    intro j r s hrs hjr hjs heq
    rcases lt_or_gt_of_ne hrs with hrslt | hsrlt
    · exact Or.inl
        (CGN.index_strictly_between_of_equidistant
          Packet Hside Hord hrslt hjr hjs heq)
    · exact Or.inr
        (CGN.index_strictly_between_of_equidistant
          Packet Hside Hord hsrlt hjs hjr heq.symm)
  have hDbetween := between_of_equidistant
    hia_ib hid_ia hid_ib (by simpa only [hid, hia, hib] using hD)
  have hCbetween := between_of_equidistant
    hid_ia hic_id hic_ia (by simpa only [hic, hid, hia] using hC)
  have hEbetween := between_of_equidistant
    hic_id hie_ic hie_id (by simpa only [hie, hic, hid] using hE)
  have hAbetween := between_of_equidistant
    hib_ie hia_ib hia_ie (by simpa only [hia, hib, hie] using hA)
  rcases hDbetween with hDbetween | hDbetween <;>
    rcases hCbetween with hCbetween | hCbetween <;>
    rcases hEbetween with hEbetween | hEbetween <;>
    rcases hAbetween with hAbetween | hAbetween <;> omega

/-- The first arm of the `BlockerV` pentagon split: the next row blocker,
centred at `v`, is the source-row companion `xu`.  The ordered-cap
betweenness cycle above discharges this arm. -/
theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerXu
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 = packet.xu) :
    False := by
  classical
  have hxuInter :
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
            P.u.1 P.u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.source_row_trace]
    simp
  have hxvInter :
      packet.xv ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.opposite_row_trace]
    simp
  have hxuURow :
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support :=
    (Finset.mem_inter.mp hxuInter).1
  have hxvVRow :
      packet.xv ∈
        ((lateFirstApexSystem R).selectedAt
          P.v.1 P.v.2).toCriticalFourShell.support :=
    (Finset.mem_inter.mp hxvInter).1
  have hcenterU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [P.huSource] using packet.blocker_eq_xv
  have hxvNotURow :
      packet.xv ∉
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support := by
    intro h
    rw [← hcenterU] at h
    exact
      ((lateFirstApexSystem R).selectedAt
        P.u.1 P.u.2).toCriticalFourShell.center_not_mem_support h
  have huNeXu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply hxvNotURow
    rw [← h]
    exact
      ((lateFirstApexSystem R).selectedAt
        P.u.1 P.u.2).toCriticalFourShell.q_mem_support
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply hxvNotURow
    rw [← h]
    exact hxuURow
  have hxuNeV : packet.xu ≠ P.v.1 := by
    intro h
    apply P.hvOmitted
    simpa only [← h] using hxuURow
  have hvNeXv : P.v.1 ≠ packet.xv := by
    intro h
    exact packet.xv_ne_v h.symm
  have huNeVpt : P.u.1 ≠ P.v.1 := by
    intro h
    exact P.huNeV (Subtype.ext h)
  have hpairSubset :
      ({P.u.1, packet.xu} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.oppIndex2 := by
    intro z hz
    have hzInter :
        z ∈ ({P.u.1, packet.xu} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 := by
      rw [packet.source_pair_interior]
      exact hz
    exact (Finset.mem_inter.mp hzInter).2
  have huInterior : P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 :=
    hpairSubset (by simp)
  have hxuInterior : packet.xu ∈ S.capInteriorByIndex S.oppIndex2 :=
    hpairSubset (by simp)
  have hvInterior : P.v.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [← Q.hblockerEqV]
    exact Q.hblockerInterior
  have hY : dist packet.xv P.u.1 = dist packet.xv packet.xu := by
    rw [← hcenterU]
    exact
      (((lateFirstApexSystem R).selectedAt
        P.u.1 P.u.2).toCriticalFourShell.support_eq_radius _
          ((lateFirstApexSystem R).selectedAt
            P.u.1 P.u.2).toCriticalFourShell.q_mem_support).trans
        ((((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support_eq_radius _ hxuURow).symm)
  have hV : dist P.v.1 packet.xv = dist P.v.1 P.u.1 := by
    rw [← Q.hblockerEqV]
    exact
      (((lateFirstApexSystem R).selectedAt
        packet.xv Q.hxvA).toCriticalFourShell.support_eq_radius _
          ((lateFirstApexSystem R).selectedAt
            packet.xv Q.hxvA).toCriticalFourShell.q_mem_support).trans
        ((((lateFirstApexSystem R).selectedAt
          packet.xv Q.hxvA).toCriticalFourShell.support_eq_radius _
            Q.huXvRow).symm)
  have hX : dist packet.xu P.v.1 = dist packet.xu packet.xv := by
    rw [← hcenterV]
    exact
      (((lateFirstApexSystem R).selectedAt
        P.v.1 P.v.2).toCriticalFourShell.support_eq_radius _
          ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.q_mem_support).trans
        ((((lateFirstApexSystem R).selectedAt
          P.v.1 P.v.2).toCriticalFourShell.support_eq_radius _ hxvVRow).symm)
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex2 with
    ⟨m, L, Packet, Hside, Hord, hcap⟩
  have huImage : P.u.1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 huInterior
  have hxuImage : packet.xu ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hxuInterior
  have hvImage : P.v.1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hvInterior
  have hxvImage : packet.xv ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 Q.hxvInterior
  rcases Finset.mem_image.mp huImage with ⟨iu, _hiuMem, hiu⟩
  rcases Finset.mem_image.mp hxuImage with ⟨ix, _hixMem, hix⟩
  rcases Finset.mem_image.mp hvImage with ⟨iv, _hivMem, hiv⟩
  rcases Finset.mem_image.mp hxvImage with ⟨iy, _hiyMem, hiy⟩
  have hiu_ix : iu ≠ ix := by
    intro h
    apply huNeXu
    rw [← hiu, ← hix, h]
  have hiy_iu : iy ≠ iu := by
    intro h
    apply huNeXv
    rw [← hiu, ← hiy, h]
  have hiy_ix : iy ≠ ix := by
    intro h
    apply hxuNeXv
    rw [← hix, ← hiy, h]
  have hiv_iy : iv ≠ iy := by
    intro h
    apply hvNeXv
    rw [← hiv, ← hiy, h]
  have hiv_iu : iv ≠ iu := by
    intro h
    apply huNeVpt
    rw [← hiu, ← hiv, h]
  have hix_iv : ix ≠ iv := by
    intro h
    apply hxuNeV
    rw [← hix, ← hiv, h]
  apply false_of_orderedCap_three_equidistant_betweenness_cycle
    Packet Hside Hord hiu_ix hiy_iu hiy_ix hiv_iy hiv_iu hix_iv
  · simpa only [hiu, hix, hiy] using hY
  · simpa only [hiu, hiv, hiy] using hV
  · simpa only [hix, hiv, hiy] using hX

private theorem blockerV_vRowBlockerDeleted_centerDeletedInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1) :
    (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2 ∈
      S.capInteriorByIndex S.oppIndex2 := by
  let Hlate := lateFirstApexSystem R
  let Kv := (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
  let Kdel :=
    (Hlate.selectedAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2).toCriticalFourShell
  have hxvInter :
      packet.xv ∈ Kv.support ∩ SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.opposite_row_trace]
    simp
  have hxvVRow : packet.xv ∈ Kv.support := (Finset.mem_inter.mp hxvInter).1
  have hxvClass : packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxvInter).2
  have hvInterior : P.v.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [← Q.hblockerEqV]
    exact Q.hblockerInterior
  have hCraw :
      dist (Hlate.centerAt P.v.1 P.v.2) P.v.1 =
        dist (Hlate.centerAt P.v.1 P.v.2) packet.xv :=
    (Kv.support_eq_radius _ Kv.q_mem_support).trans
      (Kv.support_eq_radius _ hxvVRow).symm
  have hphysicalVXv :
      dist S.oppApex2 P.v.1 = dist S.oppApex2 packet.xv :=
    (mem_selectedClass.mp P.hvClass).2.trans
      (mem_selectedClass.mp hxvClass).2.symm
  have hdeletedInterior :
      P.jointDeletion.deleted.1 ∈
        S.capInteriorByIndex S.oppIndex2 := by
    have h := commonPhysicalPair_center_mem_secondCapInterior
      (Finset.mem_of_mem_erase Kv.center_mem)
      (P.surface.secondApex_robust.centerAt_ne Hlate P.v.1 P.v.2)
      hvInterior Q.hxvInterior packet.xv_ne_v.symm hCraw hphysicalVXv
    simpa only [Hlate, hcenterV] using h
  have hX :
      dist (Hlate.centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2) P.jointDeletion.deleted.1 =
        dist (Hlate.centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2) P.v.1 :=
    (Kdel.support_eq_radius _ Kdel.q_mem_support).trans
      (Kdel.support_eq_radius _ Q.hvDeletedRow).symm
  have hphysicalDeletedV :
      dist S.oppApex2 P.jointDeletion.deleted.1 =
        dist S.oppApex2 P.v.1 :=
    (mem_selectedClass.mp P.jointDeletion.deleted_mem_class).2.trans
      (mem_selectedClass.mp P.hvClass).2.symm
  exact commonPhysicalPair_center_mem_secondCapInterior
    (Finset.mem_of_mem_erase Kdel.center_mem)
    (P.surface.secondApex_robust.centerAt_ne Hlate
      P.jointDeletion.deleted.1 P.jointDeletion.deleted.2)
    hdeletedInterior hvInterior (by
      intro h
      apply Kv.center_not_mem_support
      simpa only [Hlate, hcenterV, h] using Kv.q_mem_support)
    hX hphysicalDeletedV

theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet : ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (hcenterDeletedClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        SelectedClass D.A S.oppApex2 P.rho) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ku := (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  let Kv := (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
  let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let Kdel :=
    (Hlate.selectedAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2).toCriticalFourShell
  have hxuInter :
      packet.xu ∈ Ku.support ∩ SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.source_row_trace]
    simp
  have hxvInter :
      packet.xv ∈ Kv.support ∩ SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.opposite_row_trace]
    simp
  have hxuURow : packet.xu ∈ Ku.support := (Finset.mem_inter.mp hxuInter).1
  have hxvVRow : packet.xv ∈ Kv.support := (Finset.mem_inter.mp hxvInter).1
  have hxvClass : packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxvInter).2
  have hcenterU : Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [P.huSource] using packet.blocker_eq_xv
  have huNeXu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have hvNeXv : P.v.1 ≠ packet.xv := packet.xv_ne_v.symm
  have huNeV : P.u.1 ≠ P.v.1 := by
    intro h
    exact P.huNeV (Subtype.ext h)
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply Ku.center_not_mem_support
    simpa only [hcenterU, ← h] using Ku.q_mem_support
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply Ku.center_not_mem_support
    simpa only [hcenterU, ← h] using hxuURow
  have hxuNeV : packet.xu ≠ P.v.1 := by
    intro h
    apply P.hvOmitted
    simpa only [← h] using hxuURow
  have hdelNeU : P.jointDeletion.deleted.1 ≠ P.u.1 := by
    intro h
    apply Q.huNotDeletedRow
    simpa only [← h] using Kdel.q_mem_support
  have hdelNeXu : P.jointDeletion.deleted.1 ≠ packet.xu := by
    intro h
    apply Q.hxuNotDeletedRow
    simpa only [← h] using Kdel.q_mem_support
  have hdelNeXv : P.jointDeletion.deleted.1 ≠ packet.xv := by
    intro h
    apply Q.hxvNotDeletedRow
    simpa only [← h] using Kdel.q_mem_support
  have hdelNeV : P.jointDeletion.deleted.1 ≠ P.v.1 := by
    intro h
    apply Kv.center_not_mem_support
    simpa only [Hlate, hcenterV, h] using Kv.q_mem_support
  have hpairSubset :
      ({P.u.1, packet.xu} : Finset _) ⊆
        S.capInteriorByIndex S.oppIndex2 := by
    intro z hz
    have hzInter :
        z ∈ ({P.u.1, packet.xu} : Finset _) ∩
          S.capInteriorByIndex S.oppIndex2 := by
      rw [packet.source_pair_interior]
      exact hz
    exact (Finset.mem_inter.mp hzInter).2
  have huInterior : P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 :=
    hpairSubset (by simp)
  have hxuInterior : packet.xu ∈ S.capInteriorByIndex S.oppIndex2 :=
    hpairSubset (by simp)
  have hvInterior : P.v.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [← Q.hblockerEqV]
    exact Q.hblockerInterior
  have hCraw :
      dist (Hlate.centerAt P.v.1 P.v.2) P.v.1 =
        dist (Hlate.centerAt P.v.1 P.v.2) packet.xv :=
    (Kv.support_eq_radius _ Kv.q_mem_support).trans
      (Kv.support_eq_radius _ hxvVRow).symm
  have hC :
      dist P.jointDeletion.deleted.1 P.v.1 =
        dist P.jointDeletion.deleted.1 packet.xv := by
    simpa only [Hlate, hcenterV] using hCraw
  have hphysicalVXv :
      dist S.oppApex2 P.v.1 = dist S.oppApex2 packet.xv :=
    (mem_selectedClass.mp P.hvClass).2.trans
      (mem_selectedClass.mp hxvClass).2.symm
  have hdeletedInterior :
      P.jointDeletion.deleted.1 ∈
        S.capInteriorByIndex S.oppIndex2 := by
    have h := commonPhysicalPair_center_mem_secondCapInterior
      (Finset.mem_of_mem_erase Kv.center_mem)
      (P.surface.secondApex_robust.centerAt_ne Hlate P.v.1 P.v.2)
      hvInterior Q.hxvInterior hvNeXv hCraw hphysicalVXv
    simpa only [Hlate, hcenterV] using h
  have hE : dist packet.xv P.u.1 = dist packet.xv packet.xu := by
    rw [← hcenterU]
    exact
      (Ku.support_eq_radius _ Ku.q_mem_support).trans
        (Ku.support_eq_radius _ hxuURow).symm
  have hD : dist P.v.1 packet.xv = dist P.v.1 P.u.1 := by
    rw [← Q.hblockerEqV]
    exact
      (Kxv.support_eq_radius _ Kxv.q_mem_support).trans
        (Kxv.support_eq_radius _ Q.huXvRow).symm
  have hX :
      dist (Hlate.centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2) P.jointDeletion.deleted.1 =
        dist (Hlate.centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2) P.v.1 :=
    (Kdel.support_eq_radius _ Kdel.q_mem_support).trans
      (Kdel.support_eq_radius _ Q.hvDeletedRow).symm
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex2 with
    ⟨m, L, Packet, Hside, Hord, hcap⟩
  have huImage : P.u.1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 huInterior
  have hxuImage : packet.xu ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hxuInterior
  have hdelImage :
      P.jointDeletion.deleted.1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hdeletedInterior
  have hvImage : P.v.1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hvInterior
  have hxvImage : packet.xv ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 Q.hxvInterior
  rcases Finset.mem_image.mp huImage with ⟨iu, _hiuMem, hiu⟩
  rcases Finset.mem_image.mp hxuImage with ⟨ix, _hixMem, hix⟩
  rcases Finset.mem_image.mp hdelImage with ⟨iz, _hizMem, hiz⟩
  rcases Finset.mem_image.mp hvImage with ⟨iv, _hivMem, hiv⟩
  rcases Finset.mem_image.mp hxvImage with ⟨iy, _hiyMem, hiy⟩
  have hiu_ix : iu ≠ ix := by
    intro h; apply huNeXu; rw [← hiu, ← hix, h]
  have hiy_iu : iy ≠ iu := by
    intro h; apply huNeXv; rw [← hiu, ← hiy, h]
  have hiy_ix : iy ≠ ix := by
    intro h; apply hxuNeXv; rw [← hix, ← hiy, h]
  have hiv_iy : iv ≠ iy := by
    intro h; apply hvNeXv; rw [← hiv, ← hiy, h]
  have hiv_iu : iv ≠ iu := by
    intro h; apply huNeV; rw [← hiu, ← hiv, h]
  have hiz_iv : iz ≠ iv := by
    intro h; apply hdelNeV; rw [← hiz, ← hiv, h]
  have hiz_iy : iz ≠ iy := by
    intro h; apply hdelNeXv; rw [← hiz, ← hiy, h]
  have hix_iz : ix ≠ iz := by
    intro h; apply hdelNeXu; rw [← hiz, ← hix, h]
  have hix_iv : ix ≠ iv := by
    intro h; apply hxuNeV; rw [← hix, ← hiv, h]
  have hiu_iz : iu ≠ iz := by
    intro h; apply hdelNeU; rw [← hiz, ← hiu, h]
  rcases Q.hclassFive _ hcenterDeletedClass with
      hcenterU' | hcenterXu | hcenterDeleted | hcenterV' | hcenterXv
  · have hA : dist P.u.1 P.jointDeletion.deleted.1 =
        dist P.u.1 P.v.1 := by simpa only [Hlate, hcenterU'] using hX
    apply false_of_orderedCap_three_equidistant_betweenness_cycle
      Packet Hside Hord hiy_iu hiv_iy hiv_iu hiz_iv hiz_iy hiu_iz
    · simpa only [hiy, hiu, hiv] using hD
    · simpa only [hiy, hiv, hiz] using hC
    · simpa only [hiu, hiz, hiv] using hA
  · have hB : dist packet.xu P.jointDeletion.deleted.1 =
        dist packet.xu P.v.1 := by simpa only [Hlate, hcenterXu] using hX
    apply false_of_orderedCap_four_equidistant_betweenness_cycle
      Packet Hside Hord hiu_ix hiy_iu hiy_ix hiv_iy hiv_iu
      hiz_iv hiz_iy hix_iz hix_iv
    · simpa only [hiu, hix, hiy] using hE
    · simpa only [hiu, hiv, hiy] using hD
    · simpa only [hiv, hiy, hiz] using hC
    · simpa only [hix, hiv, hiz] using hB
  · exact
      (centerAt_ne_source Hlate _ _
        (by simpa only [Hlate] using hcenterDeleted)).elim
  · apply Kdel.center_not_mem_support
    simpa only [Kdel, Hlate, hcenterV'] using Q.hvDeletedRow
  · have hE' : dist packet.xv P.jointDeletion.deleted.1 =
        dist packet.xv P.v.1 := by simpa only [Hlate, hcenterXv] using hX
    have hCbetween :
        (iv < iz ∧ iz < iy) ∨ (iy < iz ∧ iz < iv) := by
      rcases lt_or_gt_of_ne hiv_iy with h | h
      · exact Or.inl (CGN.index_strictly_between_of_equidistant
          Packet Hside Hord h hiz_iv hiz_iy (by
            simpa only [hiv, hiy, hiz] using hC))
      · exact Or.inr (CGN.index_strictly_between_of_equidistant
          Packet Hside Hord h hiz_iy hiz_iv (by
            simpa only [hiv, hiy, hiz] using hC.symm))
    have hEbetween :
        (iz < iy ∧ iy < iv) ∨ (iv < iy ∧ iy < iz) := by
      rcases lt_or_gt_of_ne hiz_iv with h | h
      · exact Or.inl (CGN.index_strictly_between_of_equidistant
          Packet Hside Hord h hiz_iy.symm hiv_iy.symm (by
            simpa only [hiv, hiy, hiz] using hE'))
      · exact Or.inr (CGN.index_strictly_between_of_equidistant
          Packet Hside Hord h hiv_iy.symm hiz_iy.symm (by
            simpa only [hiv, hiy, hiz] using hE'.symm))
    rcases hCbetween with hCbetween | hCbetween <;>
      rcases hEbetween with hEbetween | hEbetween <;> omega

/-- The seven source-named points forced into the second strict cap by the
off-class `BlockerV` residual. -/
noncomputable def blockerVSecondCapNamedSeven
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet) : Finset ℝ² :=
  insert
    ((lateFirstApexSystem R).centerAt packet.xu Q.hxuA)
    (insert
      ((lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2)
      (SelectedClass D.A S.oppApex2 P.rho))

/-- The off-class `BlockerV` packet supplies seven distinct named points in
the strict interior of the second opposite cap. -/
theorem
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_namedSeven
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (hcenterDeletedInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (hcenterDeletedOffClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∉
        SelectedClass D.A S.oppApex2 P.rho) :
    blockerVSecondCapNamedSeven Q ⊆
        S.capInteriorByIndex S.oppIndex2 ∧
      (blockerVSecondCapNamedSeven Q).card = 7 := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ku := (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  let Kv := (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
  let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let Kdel :=
    (Hlate.selectedAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2).toCriticalFourShell
  let Kxu := (Hlate.selectedAt packet.xu Q.hxuA).toCriticalFourShell
  let C := SelectedClass D.A S.oppApex2 P.rho
  let I := S.capInteriorByIndex S.oppIndex2
  let c :=
    Hlate.centerAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2
  let e := Hlate.centerAt packet.xu Q.hxuA
  have hxuInter : packet.xu ∈ Ku.support ∩ C := by
    simpa only [Ku, C, Hlate] using (show
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
      rw [packet.source_row_trace]
      simp)
  have hxuURow : packet.xu ∈ Ku.support :=
    (Finset.mem_inter.mp hxuInter).1
  have hxuClass : packet.xu ∈ C :=
    (Finset.mem_inter.mp hxuInter).2
  have hxvInter : packet.xv ∈ Kv.support ∩ C := by
    simpa only [C] using (show
      packet.xv ∈ Kv.support ∩ SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.opposite_row_trace]
        simp)
  have hxvVRow : packet.xv ∈ Kv.support :=
    (Finset.mem_inter.mp hxvInter).1
  have hxvClass : packet.xv ∈ C :=
    (Finset.mem_inter.mp hxvInter).2
  have hcenterU : Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [Hlate, P.huSource] using packet.blocker_eq_xv
  have huNeXu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have hvNeXv : P.v.1 ≠ packet.xv := packet.xv_ne_v.symm
  have huNeV : P.u.1 ≠ P.v.1 := by
    intro h
    exact P.huNeV (Subtype.ext h)
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply Ku.center_not_mem_support
    simpa only [hcenterU, ← h] using Ku.q_mem_support
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply Ku.center_not_mem_support
    simpa only [hcenterU, ← h] using hxuURow
  have hxuNeV : packet.xu ≠ P.v.1 := by
    intro h
    apply P.hvOmitted
    simpa only [← h] using hxuURow
  have hdelNeU : P.jointDeletion.deleted.1 ≠ P.u.1 := by
    intro h
    apply Q.huNotDeletedRow
    simpa only [← h] using Kdel.q_mem_support
  have hdelNeXu : P.jointDeletion.deleted.1 ≠ packet.xu := by
    intro h
    apply Q.hxuNotDeletedRow
    simpa only [← h] using Kdel.q_mem_support
  have hdelNeXv : P.jointDeletion.deleted.1 ≠ packet.xv := by
    intro h
    apply Q.hxvNotDeletedRow
    simpa only [← h] using Kdel.q_mem_support
  have hdelNeV : P.jointDeletion.deleted.1 ≠ P.v.1 := by
    intro h
    apply Kv.center_not_mem_support
    simpa only [Hlate, hcenterV, h] using Kv.q_mem_support
  have hvInterior : P.v.1 ∈ I := by
    simpa only [I, ← Q.hblockerEqV] using Q.hblockerInterior
  have hCraw :
      dist (Hlate.centerAt P.v.1 P.v.2) P.v.1 =
        dist (Hlate.centerAt P.v.1 P.v.2) packet.xv :=
    (Kv.support_eq_radius _ Kv.q_mem_support).trans
      (Kv.support_eq_radius _ hxvVRow).symm
  have hphysicalVXv :
      dist S.oppApex2 P.v.1 = dist S.oppApex2 packet.xv :=
    (mem_selectedClass.mp P.hvClass).2.trans
      (mem_selectedClass.mp (show
        packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho by
          simpa only [C] using hxvClass)).2.symm
  have hdeletedInterior : P.jointDeletion.deleted.1 ∈ I := by
    have h := commonPhysicalPair_center_mem_secondCapInterior
      (Finset.mem_of_mem_erase Kv.center_mem)
      (P.surface.secondApex_robust.centerAt_ne Hlate P.v.1 P.v.2)
      (by simpa only [I] using hvInterior)
      Q.hxvInterior packet.xv_ne_v.symm hCraw hphysicalVXv
    simpa only [I, Hlate, hcenterV] using h
  have hpairSubset :
      ({P.u.1, packet.xu} : Finset _) ⊆ I := by
    intro z hz
    have hzInter :
        z ∈ ({P.u.1, packet.xu} : Finset _) ∩ I := by
      simpa only [I, packet.source_pair_interior] using hz
    exact (Finset.mem_inter.mp hzInter).2
  have huInterior : P.u.1 ∈ I := hpairSubset (by simp)
  have hxuInterior : packet.xu ∈ I := hpairSubset (by simp)
  have hE :
      dist packet.xv P.u.1 = dist packet.xv packet.xu := by
    rw [← hcenterU]
    exact (Ku.support_eq_radius _ Ku.q_mem_support).trans
      (Ku.support_eq_radius _ hxuURow).symm
  have hD :
      dist P.v.1 packet.xv = dist P.v.1 P.u.1 := by
    rw [← Q.hblockerEqV]
    exact (Kxv.support_eq_radius _ Kxv.q_mem_support).trans
      (Kxv.support_eq_radius _ Q.huXvRow).symm
  have hC :
      dist P.jointDeletion.deleted.1 P.v.1 =
        dist P.jointDeletion.deleted.1 packet.xv := by
    simpa only [Hlate, hcenterV] using hCraw
  have hB :
      dist e packet.xu = dist e P.jointDeletion.deleted.1 := by
    simpa only [e, Kxu] using
      (Kxu.support_eq_radius _ Kxu.q_mem_support).trans
        (Kxu.support_eq_radius _ Q.hdeletedXuRow).symm
  have hphysicalXuDeleted :
      dist S.oppApex2 packet.xu =
        dist S.oppApex2 P.jointDeletion.deleted.1 :=
    (mem_selectedClass.mp (show
      packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho by
        simpa only [C] using hxuClass)).2.trans
      (mem_selectedClass.mp P.jointDeletion.deleted_mem_class).2.symm
  have heInterior : e ∈ I := by
    have h := commonPhysicalPair_center_mem_secondCapInterior
      (Finset.mem_of_mem_erase Kxu.center_mem)
      (P.surface.secondApex_robust.centerAt_ne Hlate packet.xu Q.hxuA)
      (by simpa only [I] using hxuInterior)
      (by simpa only [I] using hdeletedInterior)
      hdelNeXu.symm hB hphysicalXuDeleted
    simpa only [e, I] using h
  have hclassSubset : C ⊆ I := by
    intro z hz
    have hz' :
        z = P.u.1 ∨ z = packet.xu ∨
          z = P.jointDeletion.deleted.1 ∨
          z = P.v.1 ∨ z = packet.xv :=
      Q.hclassFive z (by simpa only [C] using hz)
    rcases hz' with h | h | h | h | h
    · simpa only [h] using huInterior
    · simpa only [h] using hxuInterior
    · simpa only [h] using hdeletedInterior
    · simpa only [h] using hvInterior
    · simpa only [I, h] using Q.hxvInterior
  have hcInterior : c ∈ I := by
    simpa only [c, I, Hlate] using hcenterDeletedInterior
  have hcOff : c ∉ C := by
    simpa only [c, C, Hlate] using hcenterDeletedOffClass
  have heOff : e ∉ C := by
    intro heClass
    rcases Q.hclassFive _ (by simpa only [C] using heClass) with
        heU | heXu | heDeleted | heV | heXv
    · have hA :
          dist P.u.1 packet.xu =
            dist P.u.1 P.jointDeletion.deleted.1 := by
        simpa only [heU] using hB
      exact false_of_capInterior_four_equidistant_hook_cycle
        (by simpa only [I] using huInterior)
        (by simpa only [I] using hxuInterior)
        (by simpa only [I] using hvInterior)
        (by simpa only [I] using Q.hxvInterior)
        (by simpa only [I] using hdeletedInterior)
        huNeXu huNeXv.symm hxuNeXv.symm hvNeXv huNeV.symm
        hdelNeV hdelNeXv hdelNeU.symm hdelNeXu.symm hE hD hC hA
    · exact (centerAt_ne_source Hlate packet.xu Q.hxuA
        (by simpa only [e] using heXu)).elim
    · apply Kxu.center_not_mem_support
      simpa only [Kxu, e, heDeleted] using Q.hdeletedXuRow
    · have hcenters :
          Hlate.centerAt packet.xv Q.hxvA =
            Hlate.centerAt packet.xu Q.hxuA := by
        calc
          _ = P.v.1 := Q.hblockerEqV
          _ = e := heV.symm
          _ = _ := by rfl
      have hsupports : Kxv.support = Kxu.support := by
        simpa only [Kxv, Kxu] using
          selectedSupports_eq_of_actualBlockers_eq
            Hlate Q.hxvA Q.hxuA hcenters
      apply Q.huNotXuRow
      rw [← hsupports]
      exact Q.huXvRow
    · have hcenters :
          Hlate.centerAt P.u.1 P.u.2 =
            Hlate.centerAt packet.xu Q.hxuA := by
        calc
          _ = packet.xv := hcenterU
          _ = e := heXv.symm
          _ = _ := by rfl
      have hsupports : Ku.support = Kxu.support := by
        simpa only [Ku, Kxu] using
          selectedSupports_eq_of_actualBlockers_eq
            Hlate P.u.2 Q.hxuA hcenters
      apply Q.huNotXuRow
      rw [← hsupports]
      exact Ku.q_mem_support
  have heNeC : e ≠ c := by
    intro hec
    have hcXuDeleted :
        dist c packet.xu =
          dist c P.jointDeletion.deleted.1 := by
      simpa only [hec] using hB
    have hcDeletedV :
        dist c P.jointDeletion.deleted.1 = dist c P.v.1 := by
      simpa only [c, Kdel] using
        (Kdel.support_eq_radius _ Kdel.q_mem_support).trans
          (Kdel.support_eq_radius _ Q.hvDeletedRow).symm
    have hcNeXu : c ≠ packet.xu := by
      intro h
      apply hcOff
      simpa only [h] using hxuClass
    have hcNeDeleted : c ≠ P.jointDeletion.deleted.1 := by
      simpa only [c, Hlate] using
        centerAt_ne_source Hlate P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2
    have hcNeV : c ≠ P.v.1 := by
      intro h
      apply hcOff
      simpa only [h] using P.hvClass
    exact false_of_capInterior_center_equidistant_three_points
      (by simpa only [I] using hcInterior)
      (by simpa only [I] using hxuInterior)
      (by simpa only [I] using hdeletedInterior)
      (by simpa only [I] using hvInterior)
      hdelNeXu.symm hxuNeV hdelNeV hcNeXu hcNeDeleted hcNeV
      hcXuDeleted (hcXuDeleted.trans hcDeletedV)
  have hinsertSubset : insert e (insert c C) ⊆ I := by
    intro z hz
    rcases Finset.mem_insert.mp hz with h | hz
    · simpa only [h] using heInterior
    · rcases Finset.mem_insert.mp hz with h | hz
      · simpa only [h] using hcInterior
      · exact hclassSubset hz
  have heNotInsert : e ∉ insert c C := by
    intro h
    rcases Finset.mem_insert.mp h with h | h
    · exact heNeC h
    · exact heOff h
  have hcardInsert : (insert e (insert c C)).card = 7 := by
    rw [Finset.card_insert_of_notMem heNotInsert]
    rw [Finset.card_insert_of_notMem hcOff]
    simpa only [C, P.hclassFive]
  simpa only [blockerVSecondCapNamedSeven, Hlate, e, c, C, I] using
    And.intro hinsertSubset hcardInsert

/-- At cap cardinality nine, the seven source-named points are the complete
strict interior of the second opposite cap.  This is the source-side domain
identity used by the exact-seventeen finite normal form; it prevents the
finite encoder from inventing or omitting strict-cap labels. -/
theorem
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_namedSeven_eq_capInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (hcenterDeletedInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (hcenterDeletedOffClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∉
        SelectedClass D.A S.oppApex2 P.rho)
    (hcapCard : (S.capByIndex S.oppIndex2).card = 9) :
    blockerVSecondCapNamedSeven Q =
      S.capInteriorByIndex S.oppIndex2 := by
  have hnamed :=
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_namedSeven
      Q hcenterV hcenterDeletedInterior hcenterDeletedOffClass
  have hcapAdd :=
    ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
      S S.oppIndex2
  have hIcard : (S.capInteriorByIndex S.oppIndex2).card = 7 := by
    omega
  apply Finset.eq_of_subset_of_card_le hnamed.1
  rw [hnamed.2, hIcard]

/-- The seven-point strict-cap packet forces the ambient carrier to have at
least fifteen points. -/
theorem
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_ge_fifteen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (hcenterDeletedInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (hcenterDeletedOffClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∉
        SelectedClass D.A S.oppApex2 P.rho) :
    15 ≤ D.A.card := by
  have hnamed :=
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_namedSeven
      Q hcenterV hcenterDeletedInterior hcenterDeletedOffClass
  have hIcard : 7 ≤ (S.capInteriorByIndex S.oppIndex2).card := by
    have hle := Finset.card_le_card hnamed.1
    omega
  have hcapAdd :=
    ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
      S S.oppIndex2
  rw [capByIndex_oppIndex2_eq_oppCap2_sourceHeavy S] at hcapAdd
  have hsecond : 9 ≤ S.oppCap2.card := by omega
  have hsum := S.capSum
  have hsurplus := S.surplus_card_gt_four
  have hfirst := P.surface.firstOppCap_card_ge_four
  omega

/-- At cardinality fifteen the off-class `BlockerV` residual has the exact cap
profile `(5,4,9)`, and its seven named points exhaust the second strict cap. -/
theorem
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_exact_fifteen_profile
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (hcenterDeletedInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (hcenterDeletedOffClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∉
        SelectedClass D.A S.oppApex2 P.rho)
    (hcard : D.A.card = 15) :
    S.surplusCap.card = 5 ∧
      S.oppCap1.card = 4 ∧
      S.oppCap2.card = 9 ∧
      blockerVSecondCapNamedSeven Q =
        S.capInteriorByIndex S.oppIndex2 := by
  have hnamed :=
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_namedSeven
      Q hcenterV hcenterDeletedInterior hcenterDeletedOffClass
  have hcapAdd :=
    ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
      S S.oppIndex2
  rw [capByIndex_oppIndex2_eq_oppCap2_sourceHeavy S] at hcapAdd
  have hsum := S.capSum
  have hsurplus := S.surplus_card_gt_four
  have hfirst := P.surface.firstOppCap_card_ge_four
  have hsecond : 9 ≤ S.oppCap2.card := by
    have hIcard : 7 ≤ (S.capInteriorByIndex S.oppIndex2).card := by
      have hle := Finset.card_le_card hnamed.1
      omega
    omega
  have hprofile :
      S.surplusCap.card = 5 ∧
        S.oppCap1.card = 4 ∧ S.oppCap2.card = 9 := by
    omega
  refine ⟨hprofile.1, hprofile.2.1, hprofile.2.2, ?_⟩
  apply Finset.eq_of_subset_of_card_le hnamed.1
  have hIcardEq : (S.capInteriorByIndex S.oppIndex2).card = 7 := by
    omega
  omega

/-- Banked small-cardinality consequence of the off-class `BlockerV`
residual: no such packet exists on a carrier of cardinality at most fourteen. -/
theorem
    false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_le_fourteen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (hcenterDeletedInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (hcenterDeletedOffClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∉
        SelectedClass D.A S.oppApex2 P.rho)
    (hcard : D.A.card ≤ 14) :
    False := by
  have hge :=
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_ge_fifteen
      Q hcenterV hcenterDeletedInterior hcenterDeletedOffClass
  omega

private theorem
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_nextRow_physical_hits_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (hcenterDeletedInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (hcenterDeletedOffClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∉
        SelectedClass D.A S.oppApex2 P.rho) :
    let Hlate := lateFirstApexSystem R
    let c := Hlate.centerAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2
    let hcA : c ∈ D.A := Finset.mem_of_mem_erase
      (Hlate.selectedAt P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2).toCriticalFourShell.center_mem
    (((Hlate.selectedAt c hcA).toCriticalFourShell.support ∩
      SelectedClass D.A S.oppApex2 P.rho).card ≤ 1) := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kv := (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
  let Kdel :=
    (Hlate.selectedAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2).toCriticalFourShell
  let C := SelectedClass D.A S.oppApex2 P.rho
  let I := S.capInteriorByIndex S.oppIndex2
  let c := Hlate.centerAt P.jointDeletion.deleted.1
    P.jointDeletion.deleted.2
  let hcA : c ∈ D.A := Finset.mem_of_mem_erase Kdel.center_mem
  let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
  change (Kc.support ∩ C).card ≤ 1
  by_contra hnot
  have hone : 1 < (Kc.support ∩ C).card := by omega
  rcases Finset.one_lt_card.mp hone with ⟨a, ha, b, hb, hab⟩
  have haSupport : a ∈ Kc.support := (Finset.mem_inter.mp ha).1
  have hbSupport : b ∈ Kc.support := (Finset.mem_inter.mp hb).1
  have haClass : a ∈ C := (Finset.mem_inter.mp ha).2
  have hbClass : b ∈ C := (Finset.mem_inter.mp hb).2
  have hxvInter : packet.xv ∈ Kv.support ∩ C := by
    simpa only [C] using (show
      packet.xv ∈ Kv.support ∩ SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.opposite_row_trace]
        simp)
  have hxvVRow : packet.xv ∈ Kv.support :=
    (Finset.mem_inter.mp hxvInter).1
  have hxvClass : packet.xv ∈ C :=
    (Finset.mem_inter.mp hxvInter).2
  have hvInterior : P.v.1 ∈ I := by
    simpa only [I, ← Q.hblockerEqV] using Q.hblockerInterior
  have hCraw :
      dist (Hlate.centerAt P.v.1 P.v.2) P.v.1 =
        dist (Hlate.centerAt P.v.1 P.v.2) packet.xv :=
    (Kv.support_eq_radius _ Kv.q_mem_support).trans
      (Kv.support_eq_radius _ hxvVRow).symm
  have hphysicalVXv :
      dist S.oppApex2 P.v.1 = dist S.oppApex2 packet.xv :=
    (mem_selectedClass.mp P.hvClass).2.trans
      (mem_selectedClass.mp (show
        packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho by
          simpa only [C] using hxvClass)).2.symm
  have hdeletedInterior : P.jointDeletion.deleted.1 ∈ I := by
    have h := commonPhysicalPair_center_mem_secondCapInterior
      (Finset.mem_of_mem_erase Kv.center_mem)
      (P.surface.secondApex_robust.centerAt_ne Hlate P.v.1 P.v.2)
      (by simpa only [I] using hvInterior)
      Q.hxvInterior packet.xv_ne_v.symm hCraw hphysicalVXv
    simpa only [I, Hlate, hcenterV] using h
  have hpairSubset :
      ({P.u.1, packet.xu} : Finset _) ⊆ I := by
    intro z hz
    have hzInter :
        z ∈ ({P.u.1, packet.xu} : Finset _) ∩ I := by
      simpa only [I, packet.source_pair_interior] using hz
    exact (Finset.mem_inter.mp hzInter).2
  have huInterior : P.u.1 ∈ I := hpairSubset (by simp)
  have hxuInterior : packet.xu ∈ I := hpairSubset (by simp)
  have hclassSubset : C ⊆ I := by
    intro z hz
    rcases Q.hclassFive z (by simpa only [C] using hz) with
      h | h | h | h | h
    · simpa only [h] using huInterior
    · simpa only [h] using hxuInterior
    · simpa only [h] using hdeletedInterior
    · simpa only [h] using hvInterior
    · simpa only [I, h] using Q.hxvInterior
  have haInterior : a ∈ I := hclassSubset haClass
  have hbInterior : b ∈ I := hclassSubset hbClass
  let d := Hlate.centerAt c hcA
  have hcenterEq : dist d a = dist d b := by
    simpa only [d, Kc] using
      (Kc.support_eq_radius _ haSupport).trans
        (Kc.support_eq_radius _ hbSupport).symm
  have hphysicalEq : dist S.oppApex2 a = dist S.oppApex2 b :=
    (mem_selectedClass.mp (show
      a ∈ SelectedClass D.A S.oppApex2 P.rho by
        simpa only [C] using haClass)).2.trans
      (mem_selectedClass.mp (show
        b ∈ SelectedClass D.A S.oppApex2 P.rho by
          simpa only [C] using hbClass)).2.symm
  have hdInterior : d ∈ I := by
    simpa only [d, I] using
      (commonPhysicalPair_center_mem_secondCapInterior
        (Finset.mem_of_mem_erase Kc.center_mem)
        (P.surface.secondApex_robust.centerAt_ne Hlate c hcA)
        (by simpa only [I] using haInterior)
        (by simpa only [I] using hbInterior)
        hab hcenterEq hphysicalEq)
  have hcInterior : c ∈ I := by
    simpa only [c, I, Hlate] using hcenterDeletedInterior
  have hcOff : c ∉ C := by
    simpa only [c, C, Hlate] using hcenterDeletedOffClass
  have hca : c ≠ a := by
    intro h
    apply hcOff
    simpa only [h] using haClass
  have hcb : c ≠ b := by
    intro h
    apply hcOff
    simpa only [h] using hbClass
  have hdNotSupport : d ∉ Kc.support := by
    simpa only [d, Kc] using Kc.center_not_mem_support
  have hdc : d ≠ c := by
    intro h
    apply hdNotSupport
    simpa only [h] using Kc.q_mem_support
  have hda : d ≠ a := by
    intro h
    apply hdNotSupport
    simpa only [h] using haSupport
  have hdb : d ≠ b := by
    intro h
    apply hdNotSupport
    simpa only [h] using hbSupport
  have hdca : dist d c = dist d a := by
    simpa only [d, Kc] using
      (Kc.support_eq_radius _ Kc.q_mem_support).trans
        (Kc.support_eq_radius _ haSupport).symm
  have hdcb : dist d c = dist d b := by
    simpa only [d, Kc] using
      (Kc.support_eq_radius _ Kc.q_mem_support).trans
        (Kc.support_eq_radius _ hbSupport).symm
  exact false_of_capInterior_center_equidistant_three_points
    (by simpa only [I] using hdInterior)
    (by simpa only [I] using hcInterior)
    (by simpa only [I] using haInterior)
    (by simpa only [I] using hbInterior)
    hca hcb hab hdc hda hdb hdca hdcb

private theorem injective_finCast_domain
    {n m : ℕ} (h : n = m) {α : Type} {f : Fin n → α}
    (hf : Function.Injective f) :
    Function.Injective (fun i : Fin m => f (Fin.cast h.symm i)) := by
  subst m
  simpa using hf

private theorem image_univ_finCast_domain
    {n m : ℕ} (h : n = m) {α : Type} [DecidableEq α]
    (f : Fin n → α) :
    Finset.univ.image (fun i : Fin m => f (Fin.cast h.symm i)) =
      Finset.univ.image f := by
  subst m
  rfl

private theorem ccw_finCast_domain
    {n m : ℕ} (h : n = m) {f : Fin n → ℝ²}
    (hf : EuclideanGeometry.IsCcwConvexPolygon f) :
    EuclideanGeometry.IsCcwConvexPolygon
      (fun i : Fin m => f (Fin.cast h.symm i)) := by
  subst m
  simpa using hf

private theorem filter_decide_mem_card_eq
    {n : ℕ} {α : Type} [DecidableEq α]
    (f : Fin n → α) (hf : Function.Injective f)
    {A support : Finset α}
    (himage : Finset.univ.image f = A) (hsupport : support ⊆ A) :
    (Finset.univ.filter fun i => decide (f i ∈ support)).card =
      support.card := by
  have hfilteredImage :
      (Finset.univ.filter fun i => decide (f i ∈ support)).image f =
        support := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
      simpa using (Finset.mem_filter.mp hi).2
    · intro hx
      have hxA := hsupport hx
      rw [← himage] at hxA
      rcases Finset.mem_image.mp hxA with ⟨i, _hi, rfl⟩
      exact Finset.mem_image.mpr ⟨i, by simp [hx], rfl⟩
  calc
    _ = ((Finset.univ.filter fun i => decide (f i ∈ support)).image f).card := by
      rw [Finset.card_image_of_injective _ hf]
    _ = support.card := congrArg Finset.card hfilteredImage

private theorem filter_decide_mem_and_mask_card_le
    {n : ℕ} {α : Type} [DecidableEq α]
    (f : Fin n → α) (hf : Function.Injective f)
    (support cap : Finset α) (mask : Fin n → Bool)
    (hmask : ∀ i, mask i = true → f i ∈ cap)
    (hcap : (support ∩ cap).card ≤ 2) :
    (Finset.univ.filter fun i => decide (f i ∈ support) && mask i).card ≤ 2 := by
  let selected :=
    Finset.univ.filter fun i => decide (f i ∈ support) && mask i
  have hsubset : selected.image f ⊆ support ∩ cap := by
    intro x hx
    rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
    have hi' := (Finset.mem_filter.mp hi).2
    have hboth : decide (f i ∈ support) = true ∧ mask i = true := by
      simpa only [Bool.and_eq_true] using hi'
    exact Finset.mem_inter.mpr ⟨of_decide_eq_true hboth.1, hmask i hboth.2⟩
  have hcardImage : (selected.image f).card ≤ 2 :=
    (Finset.card_le_card hsubset).trans hcap
  rw [Finset.card_image_of_injective _ hf] at hcardImage
  exact hcardImage

private theorem not_mem_of_inter_card_le_two_of_three_cap_points
    {α : Type} [DecidableEq α]
    {support cap : Finset α} {extra first second : α}
    (hextraCap : extra ∈ cap) (hfirstCap : first ∈ cap)
    (hsecondCap : second ∈ cap)
    (hfirstSupport : first ∈ support) (hsecondSupport : second ∈ support)
    (hextraFirst : extra ≠ first) (hextraSecond : extra ≠ second)
    (hfirstSecond : first ≠ second)
    (hcard : (support ∩ cap).card ≤ 2) :
    extra ∉ support := by
  intro hextraSupport
  have hsubset : {extra, first, second} ⊆ support ∩ cap := by
    intro point hpoint
    simp only [Finset.mem_insert, Finset.mem_singleton] at hpoint
    rcases hpoint with rfl | rfl | rfl
    · exact Finset.mem_inter.mpr ⟨hextraSupport, hextraCap⟩
    · exact Finset.mem_inter.mpr ⟨hfirstSupport, hfirstCap⟩
    · exact Finset.mem_inter.mpr ⟨hsecondSupport, hsecondCap⟩
  have hthree : ({extra, first, second} : Finset α).card = 3 := by
    simp [hextraFirst, hextraSecond, hfirstSecond]
  have := (Finset.card_le_card hsubset).trans hcard
  omega

private theorem support_subset_image_skip
    {n : ℕ} {α : Type} [DecidableEq α]
    {boundary : Fin (n + 1) → α} {carrier support : Finset α}
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hsupport : support ⊆ carrier) (gap : Fin (n + 1))
    (hgap : boundary gap ∉ support) :
    support ⊆ Finset.univ.image (fun i : Fin n => boundary (gap.succAbove i)) := by
  intro point hpoint
  have hcarrier := hsupport hpoint
  rw [← hboundaryImage] at hcarrier
  rcases Finset.mem_image.mp hcarrier with ⟨index, _hindex, hindex⟩
  have hne : index ≠ gap := by
    intro heq
    apply hgap
    rw [← hindex] at hpoint
    simpa [heq] using hpoint
  rcases Fin.exists_succAbove_eq_iff.mpr hne with ⟨index', hindex'⟩
  exact Finset.mem_image.mpr
    ⟨index', Finset.mem_univ _, by simpa [hindex'] using hindex⟩

private theorem support_subset_image_double_skip
    {n : ℕ} {α : Type} [DecidableEq α]
    {boundary : Fin (n + 2) → α} {carrier support : Finset α}
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hsupport : support ⊆ carrier) (outer : Fin (n + 2))
    (houter : boundary outer ∉ support) (inner : Fin (n + 1))
    (hinner : boundary (outer.succAbove inner) ∉ support) :
    support ⊆ Finset.univ.image
      (fun i : Fin n => boundary (outer.succAbove (inner.succAbove i))) := by
  have hafterOuter :
      support ⊆ Finset.univ.image (fun i : Fin (n + 1) => boundary (outer.succAbove i)) :=
    support_subset_image_skip hboundaryImage hsupport outer houter
  exact support_subset_image_skip rfl hafterOuter inner hinner

private theorem support_subset_image_skip_reindex
    {n : ℕ} {α : Type} [DecidableEq α]
    {boundary : Fin (n + 1) → α} {carrier support : Finset α}
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hsupport : support ⊆ carrier) (gap : Fin (n + 1))
    (hgap : boundary gap ∉ support) (reindex : Fin n → Fin n)
    (hreindex : Function.Surjective reindex) :
    support ⊆ Finset.univ.image
      (fun i : Fin n => boundary (gap.succAbove (reindex i))) := by
  intro point hpoint
  have hbase := support_subset_image_skip hboundaryImage hsupport gap hgap hpoint
  rcases Finset.mem_image.mp hbase with ⟨index, _hindex, hpointIndex⟩
  rcases hreindex index with ⟨label, rfl⟩
  exact Finset.mem_image.mpr
    ⟨label, Finset.mem_univ _, hpointIndex⟩

private theorem support_subset_image_double_skip_reindex
    {n : ℕ} {α : Type} [DecidableEq α]
    {boundary : Fin (n + 2) → α} {carrier support : Finset α}
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hsupport : support ⊆ carrier) (outer : Fin (n + 2))
    (houter : boundary outer ∉ support) (inner : Fin (n + 1))
    (hinner : boundary (outer.succAbove inner) ∉ support)
    (reindex : Fin n → Fin n) (hreindex : Function.Surjective reindex) :
    support ⊆ Finset.univ.image
      (fun i : Fin n => boundary
        (outer.succAbove (inner.succAbove (reindex i)))) := by
  intro point hpoint
  have hbase := support_subset_image_double_skip
    hboundaryImage hsupport outer houter inner hinner hpoint
  rcases Finset.mem_image.mp hbase with ⟨index, _hindex, hpointIndex⟩
  rcases hreindex index with ⟨label, rfl⟩
  exact Finset.mem_image.mpr
    ⟨label, Finset.mem_univ _, hpointIndex⟩

private theorem seven_strict_interior_indices_ten
    (a b c d e f g : Fin 10)
    (ha : 0 < a) (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f) (hfg : f < g)
    (hg : g < 9) :
    ∃ gap : Fin 10,
      0 < gap ∧ gap < 9 ∧
      a = gap.succAbove (1 : Fin 9) ∧
      b = gap.succAbove (2 : Fin 9) ∧
      c = gap.succAbove (3 : Fin 9) ∧
      d = gap.succAbove (4 : Fin 9) ∧
      e = gap.succAbove (5 : Fin 9) ∧
      f = gap.succAbove (6 : Fin 9) ∧
      g = gap.succAbove (7 : Fin 9) := by
  obtain ⟨gapNat, hgapLow, hgapHigh, hposA, hposB, hposC,
      hposD, hposE, hposF, hposG⟩ :
      ∃ gapNat : ℕ,
        0 < gapNat ∧ gapNat < 9 ∧
        a.1 = (if 1 < gapNat then 1 else 2) ∧
        b.1 = (if 2 < gapNat then 2 else 3) ∧
        c.1 = (if 3 < gapNat then 3 else 4) ∧
        d.1 = (if 4 < gapNat then 4 else 5) ∧
        e.1 = (if 5 < gapNat then 5 else 6) ∧
        f.1 = (if 6 < gapNat then 6 else 7) ∧
        g.1 = (if 7 < gapNat then 7 else 8) := by
    by_cases ha1 : a.1 = 1
    · by_cases hb2 : b.1 = 2
      · by_cases hc3 : c.1 = 3
        · by_cases hd4 : d.1 = 4
          · by_cases he5 : e.1 = 5
            · by_cases hf6 : f.1 = 6
              · by_cases hg7 : g.1 = 7
                · refine ⟨8, by omega, by omega, ?_⟩
                  norm_num
                  omega
                · refine ⟨7, by omega, by omega, ?_⟩
                  norm_num
                  omega
              · refine ⟨6, by omega, by omega, ?_⟩
                norm_num
                omega
            · refine ⟨5, by omega, by omega, ?_⟩
              norm_num
              omega
          · refine ⟨4, by omega, by omega, ?_⟩
            norm_num
            omega
        · refine ⟨3, by omega, by omega, ?_⟩
          norm_num
          omega
      · refine ⟨2, by omega, by omega, ?_⟩
        norm_num
        omega
    · refine ⟨1, by omega, by omega, ?_⟩
      norm_num
      omega
  let gap : Fin 10 := ⟨gapNat, by omega⟩
  refine ⟨gap, by simpa [gap], by simpa [gap], ?_⟩
  have hsucc (x : Fin 10) (i : Fin 9)
      (hxi : x.1 = if i.1 < gapNat then i.1 else i.1 + 1) :
      x = gap.succAbove i := by
    unfold Fin.succAbove
    split
    · have hi : i.1 < gapNat := by simpa [gap] using ‹i.castSucc < gap›
      rw [if_pos hi] at hxi
      apply Fin.ext
      simpa using hxi
    · have hi : ¬ i.1 < gapNat := by
        simpa [gap] using ‹¬ i.castSucc < gap›
      rw [if_neg hi] at hxi
      apply Fin.ext
      simpa using hxi
  exact ⟨hsucc a 1 (by simpa using hposA), hsucc b 2 (by simpa using hposB),
    hsucc c 3 (by simpa using hposC), hsucc d 4 (by simpa using hposD),
    hsucc e 5 (by simpa using hposE), hsucc f 6 (by simpa using hposF),
    hsucc g 7 (by simpa using hposG)⟩

private def SevenSkipOrder
    (a b c d e f g : Fin 10) : Prop :=
  ∃ gap : Fin 10,
    0 < gap ∧ gap < 9 ∧
    a = gap.succAbove (1 : Fin 9) ∧
    b = gap.succAbove (2 : Fin 9) ∧
    c = gap.succAbove (3 : Fin 9) ∧
    d = gap.succAbove (4 : Fin 9) ∧
    e = gap.succAbove (5 : Fin 9) ∧
    f = gap.succAbove (6 : Fin 9) ∧
    g = gap.succAbove (7 : Fin 9)

private theorem seven_index_order_classification_ten
    (iu iv ic id ixv ie ixu : Fin 10)
    (hu0 : 0 < iu) (hu8 : iu < 9)
    (hv0 : 0 < iv) (hv8 : iv < 9)
    (hc0 : 0 < ic) (hc8 : ic < 9)
    (hd0 : 0 < id) (hd8 : id < 9)
    (hxv0 : 0 < ixv) (hxv8 : ixv < 9)
    (he0 : 0 < ie) (he8 : ie < 9)
    (hxu0 : 0 < ixu) (hxu8 : ixu < 9)
    (he_ne_xv : ie ≠ ixv)
    (hXv : (iu < ixv ∧ ixv < ixu) ∨ (ixu < ixv ∧ ixv < iu))
    (hV : (iu < iv ∧ iv < ixv) ∨ (ixv < iv ∧ iv < iu))
    (hD : (iv < id ∧ id < ixv) ∨ (ixv < id ∧ id < iv))
    (hC : (iv < ic ∧ ic < id) ∨ (id < ic ∧ ic < iv))
    (hE : (id < ie ∧ ie < ixu) ∨ (ixu < ie ∧ ie < id)) :
    SevenSkipOrder iu iv ic id ixv ie ixu ∨
    SevenSkipOrder iu iv ic id ie ixv ixu ∨
    SevenSkipOrder ixu ie ixv id ic iv iu ∨
    SevenSkipOrder ixu ixv ie id ic iv iu := by
  rcases hXv with hXv | hXv
  · have hV' : iu < iv ∧ iv < ixv := by
      rcases hV with hV | hV
      · exact hV
      · omega
    have hD' : iv < id ∧ id < ixv := by
      rcases hD with hD | hD
      · exact hD
      · omega
    have hC' : iv < ic ∧ ic < id := by
      rcases hC with hC | hC
      · exact hC
      · omega
    have hE' : id < ie ∧ ie < ixu := by
      rcases hE with hE | hE
      · exact hE
      · omega
    rcases lt_or_gt_of_ne he_ne_xv with hlt | hgt
    · right; left
      exact seven_strict_interior_indices_ten iu iv ic id ie ixv ixu
        hu0 hV'.1 hC'.1 hC'.2 hE'.1 hlt hXv.2 hxu8
    · left
      exact seven_strict_interior_indices_ten iu iv ic id ixv ie ixu
        hu0 hV'.1 hC'.1 hC'.2 hD'.2 hgt hE'.2 hxu8
  · have hV' : ixv < iv ∧ iv < iu := by
      rcases hV with hV | hV
      · omega
      · exact hV
    have hD' : ixv < id ∧ id < iv := by
      rcases hD with hD | hD
      · omega
      · exact hD
    have hC' : id < ic ∧ ic < iv := by
      rcases hC with hC | hC
      · omega
      · exact hC
    have hE' : ixu < ie ∧ ie < id := by
      rcases hE with hE | hE
      · omega
      · exact hE
    rcases lt_or_gt_of_ne he_ne_xv with hlt | hgt
    · right; right; left
      exact seven_strict_interior_indices_ten ixu ie ixv id ic iv iu
        hxu0 hE'.1 hlt hD'.1 hC'.1 hC'.2 hV'.2 hu8
    · right; right; right
      exact seven_strict_interior_indices_ten ixu ixv ie id ic iv iu
        hxu0 hXv.1 hgt hE'.2 hC'.1 hC'.2 hV'.2 hu8

private theorem exists_unused_strict_interior_eleven
    (a b c d e f g : Fin 11)
    (ha : 0 < a) (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f) (hfg : f < g) :
    ∃ outer : Fin 10,
      0 < outer ∧ outer < 9 ∧
      a ≠ outer.castSucc ∧ b ≠ outer.castSucc ∧
      c ≠ outer.castSucc ∧ d ≠ outer.castSucc ∧
      e ≠ outer.castSucc ∧ f ≠ outer.castSucc ∧
      g ≠ outer.castSucc := by
  obtain ⟨gapNat, hgapLow, hgapHigh, haGap, hbGap, hcGap,
      hdGap, heGap, hfGap, hgGap⟩ :
      ∃ gapNat : ℕ,
        0 < gapNat ∧ gapNat < 9 ∧
        a.1 ≠ gapNat ∧ b.1 ≠ gapNat ∧ c.1 ≠ gapNat ∧
        d.1 ≠ gapNat ∧ e.1 ≠ gapNat ∧ f.1 ≠ gapNat ∧
        g.1 ≠ gapNat := by
    by_cases ha1 : a.1 = 1
    · by_cases hb2 : b.1 = 2
      · by_cases hc3 : c.1 = 3
        · by_cases hd4 : d.1 = 4
          · by_cases he5 : e.1 = 5
            · by_cases hf6 : f.1 = 6
              · by_cases hg7 : g.1 = 7
                · refine ⟨8, by omega, by omega, ?_⟩
                  omega
                · refine ⟨7, by omega, by omega, ?_⟩
                  omega
              · refine ⟨6, by omega, by omega, ?_⟩
                omega
            · refine ⟨5, by omega, by omega, ?_⟩
              omega
          · refine ⟨4, by omega, by omega, ?_⟩
            omega
        · refine ⟨3, by omega, by omega, ?_⟩
          omega
      · refine ⟨2, by omega, by omega, ?_⟩
        omega
    · refine ⟨1, by omega, by omega, ?_⟩
      omega
  let outer : Fin 10 := ⟨gapNat, by omega⟩
  refine ⟨outer, by simpa [outer], by simpa [outer], ?_⟩
  repeat' apply And.intro
  all_goals
    intro h
    have hval := congrArg Fin.val h
    simp only [Fin.val_castSucc, outer] at hval
    omega

private theorem seven_strict_interior_indices_eleven
    (a b c d e f g : Fin 11)
    (ha : 0 < a) (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f) (hfg : f < g)
    (hg : g < 10) :
    ∃ outer inner : Fin 10,
      0 < outer ∧ outer < 9 ∧ 0 < inner ∧ inner < 9 ∧
      a = outer.castSucc.succAbove (inner.succAbove (1 : Fin 9)) ∧
      b = outer.castSucc.succAbove (inner.succAbove (2 : Fin 9)) ∧
      c = outer.castSucc.succAbove (inner.succAbove (3 : Fin 9)) ∧
      d = outer.castSucc.succAbove (inner.succAbove (4 : Fin 9)) ∧
      e = outer.castSucc.succAbove (inner.succAbove (5 : Fin 9)) ∧
      f = outer.castSucc.succAbove (inner.succAbove (6 : Fin 9)) ∧
      g = outer.castSucc.succAbove (inner.succAbove (7 : Fin 9)) := by
  obtain ⟨outer, houter0, houter9, haNe, hbNe, hcNe, hdNe,
      heNe, hfNe, hgNe⟩ :=
    exists_unused_strict_interior_eleven a b c d e f g
      ha hab hbc hcd hde hef hfg
  let a' := outer.predAbove a
  let b' := outer.predAbove b
  let c' := outer.predAbove c
  let d' := outer.predAbove d
  let e' := outer.predAbove e
  let f' := outer.predAbove f
  let g' := outer.predAbove g
  have haRec : outer.castSucc.succAbove a' = a :=
    Fin.succAbove_predAbove haNe
  have hbRec : outer.castSucc.succAbove b' = b :=
    Fin.succAbove_predAbove hbNe
  have hcRec : outer.castSucc.succAbove c' = c :=
    Fin.succAbove_predAbove hcNe
  have hdRec : outer.castSucc.succAbove d' = d :=
    Fin.succAbove_predAbove hdNe
  have heRec : outer.castSucc.succAbove e' = e :=
    Fin.succAbove_predAbove heNe
  have hfRec : outer.castSucc.succAbove f' = f :=
    Fin.succAbove_predAbove hfNe
  have hgRec : outer.castSucc.succAbove g' = g :=
    Fin.succAbove_predAbove hgNe
  have hzero :
      outer.castSucc.succAbove (0 : Fin 10) = (0 : Fin 11) := by
    rw [Fin.succAbove_of_castSucc_lt _ _ (by simpa using houter0)]
    rfl
  have hnine :
      outer.castSucc.succAbove (9 : Fin 10) = (10 : Fin 11) := by
    rw [Fin.succAbove_of_le_castSucc _ _ (by simpa using le_of_lt houter9)]
    rfl
  have ha' : 0 < a' := by
    apply (Fin.succAbove_lt_succAbove_iff (p := outer.castSucc)).mp
    simpa only [hzero, haRec] using ha
  have hab' : a' < b' := by
    apply (Fin.succAbove_lt_succAbove_iff (p := outer.castSucc)).mp
    simpa only [haRec, hbRec] using hab
  have hbc' : b' < c' := by
    apply (Fin.succAbove_lt_succAbove_iff (p := outer.castSucc)).mp
    simpa only [hbRec, hcRec] using hbc
  have hcd' : c' < d' := by
    apply (Fin.succAbove_lt_succAbove_iff (p := outer.castSucc)).mp
    simpa only [hcRec, hdRec] using hcd
  have hde' : d' < e' := by
    apply (Fin.succAbove_lt_succAbove_iff (p := outer.castSucc)).mp
    simpa only [hdRec, heRec] using hde
  have hef' : e' < f' := by
    apply (Fin.succAbove_lt_succAbove_iff (p := outer.castSucc)).mp
    simpa only [heRec, hfRec] using hef
  have hfg' : f' < g' := by
    apply (Fin.succAbove_lt_succAbove_iff (p := outer.castSucc)).mp
    simpa only [hfRec, hgRec] using hfg
  have hg' : g' < 9 := by
    apply (Fin.succAbove_lt_succAbove_iff (p := outer.castSucc)).mp
    simpa only [hgRec, hnine] using hg
  obtain ⟨inner, hinner0, hinner9, haIn, hbIn, hcIn, hdIn,
      heIn, hfIn, hgIn⟩ :=
    seven_strict_interior_indices_ten a' b' c' d' e' f' g'
      ha' hab' hbc' hcd' hde' hef' hfg' hg'
  refine ⟨outer, inner, houter0, houter9, hinner0, hinner9, ?_⟩
  exact ⟨haRec.symm.trans (congrArg outer.castSucc.succAbove haIn),
    hbRec.symm.trans (congrArg outer.castSucc.succAbove hbIn),
    hcRec.symm.trans (congrArg outer.castSucc.succAbove hcIn),
    hdRec.symm.trans (congrArg outer.castSucc.succAbove hdIn),
    heRec.symm.trans (congrArg outer.castSucc.succAbove heIn),
    hfRec.symm.trans (congrArg outer.castSucc.succAbove hfIn),
    hgRec.symm.trans (congrArg outer.castSucc.succAbove hgIn)⟩

private def SevenDoubleSkipOrder
    (a b c d e f g : Fin 11) : Prop :=
  ∃ outer inner : Fin 10,
    0 < outer ∧ outer < 9 ∧ 0 < inner ∧ inner < 9 ∧
    a = outer.castSucc.succAbove (inner.succAbove (1 : Fin 9)) ∧
    b = outer.castSucc.succAbove (inner.succAbove (2 : Fin 9)) ∧
    c = outer.castSucc.succAbove (inner.succAbove (3 : Fin 9)) ∧
    d = outer.castSucc.succAbove (inner.succAbove (4 : Fin 9)) ∧
    e = outer.castSucc.succAbove (inner.succAbove (5 : Fin 9)) ∧
    f = outer.castSucc.succAbove (inner.succAbove (6 : Fin 9)) ∧
    g = outer.castSucc.succAbove (inner.succAbove (7 : Fin 9))

private theorem seven_index_order_classification_eleven
    (iu iv ic id ixv ie ixu : Fin 11)
    (hu0 : 0 < iu) (hu10 : iu < 10)
    (hv0 : 0 < iv) (hv10 : iv < 10)
    (hc0 : 0 < ic) (hc10 : ic < 10)
    (hd0 : 0 < id) (hd10 : id < 10)
    (hxv0 : 0 < ixv) (hxv10 : ixv < 10)
    (he0 : 0 < ie) (he10 : ie < 10)
    (hxu0 : 0 < ixu) (hxu10 : ixu < 10)
    (he_ne_xv : ie ≠ ixv)
    (hXv : (iu < ixv ∧ ixv < ixu) ∨ (ixu < ixv ∧ ixv < iu))
    (hV : (iu < iv ∧ iv < ixv) ∨ (ixv < iv ∧ iv < iu))
    (hD : (iv < id ∧ id < ixv) ∨ (ixv < id ∧ id < iv))
    (hC : (iv < ic ∧ ic < id) ∨ (id < ic ∧ ic < iv))
    (hE : (id < ie ∧ ie < ixu) ∨ (ixu < ie ∧ ie < id)) :
    SevenDoubleSkipOrder iu iv ic id ixv ie ixu ∨
    SevenDoubleSkipOrder iu iv ic id ie ixv ixu ∨
    SevenDoubleSkipOrder ixu ie ixv id ic iv iu ∨
    SevenDoubleSkipOrder ixu ixv ie id ic iv iu := by
  rcases hXv with hXv | hXv
  · have hV' : iu < iv ∧ iv < ixv := by
      rcases hV with hV | hV
      · exact hV
      · omega
    have hD' : iv < id ∧ id < ixv := by
      rcases hD with hD | hD
      · exact hD
      · omega
    have hC' : iv < ic ∧ ic < id := by
      rcases hC with hC | hC
      · exact hC
      · omega
    have hE' : id < ie ∧ ie < ixu := by
      rcases hE with hE | hE
      · exact hE
      · omega
    rcases lt_or_gt_of_ne he_ne_xv with hlt | hgt
    · right; left
      exact seven_strict_interior_indices_eleven iu iv ic id ie ixv ixu
        hu0 hV'.1 hC'.1 hC'.2 hE'.1 hlt hXv.2 hxu10
    · left
      exact seven_strict_interior_indices_eleven iu iv ic id ixv ie ixu
        hu0 hV'.1 hC'.1 hC'.2 hD'.2 hgt hE'.2 hxu10
  · have hV' : ixv < iv ∧ iv < iu := by
      rcases hV with hV | hV
      · omega
      · exact hV
    have hD' : ixv < id ∧ id < iv := by
      rcases hD with hD | hD
      · omega
      · exact hD
    have hC' : id < ic ∧ ic < iv := by
      rcases hC with hC | hC
      · omega
      · exact hC
    have hE' : ixu < ie ∧ ie < id := by
      rcases hE with hE | hE
      · omega
      · exact hE
    rcases lt_or_gt_of_ne he_ne_xv with hlt | hgt
    · right; right; left
      exact seven_strict_interior_indices_eleven ixu ie ixv id ic iv iu
        hxu0 hE'.1 hlt hD'.1 hC'.1 hC'.2 hV'.2 hu10
    · right; right; right
      exact seven_strict_interior_indices_eleven ixu ixv ie id ic iv iu
        hxu0 hXv.1 hgt hE'.2 hC'.1 hC'.2 hV'.2 hu10

private theorem skip_position_embedding_forward
    (gap : Fin 16) (order : Fin 2) :
    BlockerVExactFifteenFourRowCoverage.PositionEmbedding
      .forward order
        (fun point => gap.succAbove
          (BlockerVExactFifteenFourRowCoverage.position order point)) := by
  intro point₁ point₂ hlt
  exact Fin.succAbove_lt_succAbove_iff.mpr hlt

private theorem skip_position_embedding_reverse
    (gap : Fin 16) (order : Fin 2) :
    BlockerVExactFifteenFourRowCoverage.PositionEmbedding
      .reverse order
        (fun point => Fin.rev (gap.succAbove
          (BlockerVExactFifteenFourRowCoverage.position order point))) := by
  intro point₁ point₂ hlt
  change
    (Fin.rev (gap.succAbove
        (BlockerVExactFifteenFourRowCoverage.position order point₂))).val <
      (Fin.rev (gap.succAbove
        (BlockerVExactFifteenFourRowCoverage.position order point₁))).val
  rw [Fin.val_rev, Fin.val_rev]
  have hsucc :
      gap.succAbove
          (BlockerVExactFifteenFourRowCoverage.position order point₁) <
        gap.succAbove
          (BlockerVExactFifteenFourRowCoverage.position order point₂) :=
    (Fin.succAbove_lt_succAbove_iff (p := gap)).mpr hlt
  omega

private theorem double_skip_position_embedding_forward
    (outer : Fin 17) (inner : Fin 16) (order : Fin 2) :
    BlockerVExactFifteenFourRowCoverage.PositionEmbedding
      .forward order
        (fun point => outer.succAbove (inner.succAbove
          (BlockerVExactFifteenFourRowCoverage.position order point))) := by
  intro point₁ point₂ hlt
  exact Fin.succAbove_lt_succAbove_iff.mpr
    (Fin.succAbove_lt_succAbove_iff.mpr hlt)

private theorem double_skip_position_embedding_reverse
    (outer : Fin 17) (inner : Fin 16) (order : Fin 2) :
    BlockerVExactFifteenFourRowCoverage.PositionEmbedding
      .reverse order
        (fun point => Fin.rev (outer.succAbove (inner.succAbove
          (BlockerVExactFifteenFourRowCoverage.position order point)))) := by
  intro point₁ point₂ hlt
  change
    (Fin.rev (outer.succAbove (inner.succAbove
        (BlockerVExactFifteenFourRowCoverage.position order point₂)))).val <
      (Fin.rev (outer.succAbove (inner.succAbove
        (BlockerVExactFifteenFourRowCoverage.position order point₁)))).val
  rw [Fin.val_rev, Fin.val_rev]
  have hinner :
      inner.succAbove
          (BlockerVExactFifteenFourRowCoverage.position order point₁) <
        inner.succAbove
          (BlockerVExactFifteenFourRowCoverage.position order point₂) :=
    Fin.succAbove_lt_succAbove_iff.mpr hlt
  have houter :
      outer.succAbove (inner.succAbove
          (BlockerVExactFifteenFourRowCoverage.position order point₁)) <
        outer.succAbove (inner.succAbove
          (BlockerVExactFifteenFourRowCoverage.position order point₂)) :=
    Fin.succAbove_lt_succAbove_iff.mpr hinner
  omega

private theorem skip_exactSixteen_position_embedding_forward
    (gap : Fin 17) (order : Fin 2) :
    BlockerVExactSixteenFourRowCoverage.PositionEmbedding
      .forward order 0
        (fun point => gap.succAbove
          (BlockerVExactSixteenFourRowCoverage.position order 0 point)) := by
  intro point₁ point₂ hlt
  exact Fin.succAbove_lt_succAbove_iff.mpr hlt

private theorem skip_exactSixteen_position_embedding_reverse
    (gap : Fin 17) (order : Fin 2) :
    BlockerVExactSixteenFourRowCoverage.PositionEmbedding
      .reverse order 0
        (fun point => Fin.rev (gap.succAbove
          (BlockerVExactSixteenFourRowCoverage.position order 0 point))) := by
  intro point₁ point₂ hlt
  change
    (Fin.rev (gap.succAbove
        (BlockerVExactSixteenFourRowCoverage.position order 0 point₂))).val <
      (Fin.rev (gap.succAbove
        (BlockerVExactSixteenFourRowCoverage.position order 0 point₁))).val
  rw [Fin.val_rev, Fin.val_rev]
  have hsucc :
      gap.succAbove
          (BlockerVExactSixteenFourRowCoverage.position order 0 point₁) <
        gap.succAbove
          (BlockerVExactSixteenFourRowCoverage.position order 0 point₂) :=
    (Fin.succAbove_lt_succAbove_iff (p := gap)).mpr hlt
  omega

private theorem seven_index_order_classification_ten_of_eq
    {m : ℕ} (hm : m = 10)
    (iu iv ic id ixv ie ixu : Fin m)
    (hiuLower : 0 < iu.val) (hiuUpper : iu.val < m - 1)
    (hivLower : 0 < iv.val) (hivUpper : iv.val < m - 1)
    (hicLower : 0 < ic.val) (hicUpper : ic.val < m - 1)
    (hidLower : 0 < id.val) (hidUpper : id.val < m - 1)
    (hixvLower : 0 < ixv.val) (hixvUpper : ixv.val < m - 1)
    (hieLower : 0 < ie.val) (hieUpper : ie.val < m - 1)
    (hixuLower : 0 < ixu.val) (hixuUpper : ixu.val < m - 1)
    (hieNeIxv : ie ≠ ixv)
    (hXv : (iu < ixv ∧ ixv < ixu) ∨ (ixu < ixv ∧ ixv < iu))
    (hV : (iu < iv ∧ iv < ixv) ∨ (ixv < iv ∧ iv < iu))
    (hDel : (iv < id ∧ id < ixv) ∨ (ixv < id ∧ id < iv))
    (hCenter : (iv < ic ∧ ic < id) ∨ (id < ic ∧ ic < iv))
    (hXuCenter : (id < ie ∧ ie < ixu) ∨ (ixu < ie ∧ ie < id)) :
    SevenSkipOrder (Fin.cast hm iu) (Fin.cast hm iv) (Fin.cast hm ic)
        (Fin.cast hm id) (Fin.cast hm ixv) (Fin.cast hm ie)
        (Fin.cast hm ixu) ∨
      SevenSkipOrder (Fin.cast hm iu) (Fin.cast hm iv) (Fin.cast hm ic)
        (Fin.cast hm id) (Fin.cast hm ie) (Fin.cast hm ixv)
        (Fin.cast hm ixu) ∨
      SevenSkipOrder (Fin.cast hm ixu) (Fin.cast hm ie) (Fin.cast hm ixv)
        (Fin.cast hm id) (Fin.cast hm ic) (Fin.cast hm iv)
        (Fin.cast hm iu) ∨
      SevenSkipOrder (Fin.cast hm ixu) (Fin.cast hm ixv) (Fin.cast hm ie)
        (Fin.cast hm id) (Fin.cast hm ic) (Fin.cast hm iv)
        (Fin.cast hm iu) := by
  subst m
  simpa only [Fin.cast_eq_self] using
    seven_index_order_classification_ten iu iv ic id ixv ie ixu
      hiuLower hiuUpper hivLower hivUpper hicLower hicUpper
      hidLower hidUpper hixvLower hixvUpper hieLower hieUpper
      hixuLower hixuUpper hieNeIxv hXv hV hDel hCenter hXuCenter

private theorem seven_index_order_classification_eleven_of_eq
    {m : ℕ} (hm : m = 11)
    (iu iv ic id ixv ie ixu : Fin m)
    (hiuLower : 0 < iu.val) (hiuUpper : iu.val < m - 1)
    (hivLower : 0 < iv.val) (hivUpper : iv.val < m - 1)
    (hicLower : 0 < ic.val) (hicUpper : ic.val < m - 1)
    (hidLower : 0 < id.val) (hidUpper : id.val < m - 1)
    (hixvLower : 0 < ixv.val) (hixvUpper : ixv.val < m - 1)
    (hieLower : 0 < ie.val) (hieUpper : ie.val < m - 1)
    (hixuLower : 0 < ixu.val) (hixuUpper : ixu.val < m - 1)
    (hieNeIxv : ie ≠ ixv)
    (hXv : (iu < ixv ∧ ixv < ixu) ∨ (ixu < ixv ∧ ixv < iu))
    (hV : (iu < iv ∧ iv < ixv) ∨ (ixv < iv ∧ iv < iu))
    (hDel : (iv < id ∧ id < ixv) ∨ (ixv < id ∧ id < iv))
    (hCenter : (iv < ic ∧ ic < id) ∨ (id < ic ∧ ic < iv))
    (hXuCenter : (id < ie ∧ ie < ixu) ∨ (ixu < ie ∧ ie < id)) :
    SevenDoubleSkipOrder (Fin.cast hm iu) (Fin.cast hm iv) (Fin.cast hm ic)
        (Fin.cast hm id) (Fin.cast hm ixv) (Fin.cast hm ie)
        (Fin.cast hm ixu) ∨
      SevenDoubleSkipOrder (Fin.cast hm iu) (Fin.cast hm iv) (Fin.cast hm ic)
        (Fin.cast hm id) (Fin.cast hm ie) (Fin.cast hm ixv)
        (Fin.cast hm ixu) ∨
      SevenDoubleSkipOrder (Fin.cast hm ixu) (Fin.cast hm ie) (Fin.cast hm ixv)
        (Fin.cast hm id) (Fin.cast hm ic) (Fin.cast hm iv)
        (Fin.cast hm iu) ∨
      SevenDoubleSkipOrder (Fin.cast hm ixu) (Fin.cast hm ixv) (Fin.cast hm ie)
        (Fin.cast hm id) (Fin.cast hm ic) (Fin.cast hm iv)
        (Fin.cast hm iu) := by
  subst m
  simpa only [Fin.cast_eq_self] using
    seven_index_order_classification_eleven iu iv ic id ixv ie ixu
      hiuLower hiuUpper hivLower hivUpper hicLower hicUpper
      hidLower hidUpper hixvLower hixvUpper hieLower hieUpper
      hixuLower hixuUpper hieNeIxv hXv hV hDel hCenter hXuCenter

private def reverseGapTen (gap : Fin 10) : Fin 10 :=
  ⟨9 - gap.val, by omega⟩

private theorem reverse_gap_succAbove_sum
    (gap : Fin 10) (j p : Fin 9) (hsum : p.val + j.val = 8) :
    ((reverseGapTen gap).succAbove p).val + (gap.succAbove j).val = 9 := by
  by_cases hj : j.castSucc < gap
  · change j.val < gap.val at hj
    have hp : reverseGapTen gap ≤ p.castSucc := by
      change 9 - gap.val ≤ p.val
      omega
    rw [Fin.succAbove_of_le_castSucc _ _ hp,
      Fin.succAbove_of_castSucc_lt _ _ hj]
    simp only [Fin.val_succ, Fin.val_castSucc]
    omega
  · have hj' : gap ≤ j.castSucc := le_of_not_gt hj
    change gap.val ≤ j.val at hj'
    have hp : p.castSucc < reverseGapTen gap := by
      change p.val < 9 - gap.val
      omega
    rw [Fin.succAbove_of_castSucc_lt _ _ hp,
      Fin.succAbove_of_le_castSucc _ _ hj']
    simp only [Fin.val_succ, Fin.val_castSucc]
    omega

private theorem gapTen_castLE_succAbove_val
    (gap : Fin 10) (p : Fin 15) (j : Fin 9) (hp : p.val = j.val) :
    ((Fin.castLE (by omega) gap : Fin 16).succAbove p).val =
      (gap.succAbove j).val := by
  let gap16 : Fin 16 := Fin.castLE (by omega) gap
  by_cases hleft : p.castSucc < gap16
  · have hright : j.castSucc < gap := by
      change j.val < gap.val
      change p.val < gap.val at hleft
      omega
    rw [Fin.succAbove_of_castSucc_lt _ _ hleft,
      Fin.succAbove_of_castSucc_lt _ _ hright]
    simp only [Fin.val_castSucc]
    exact hp
  · have hleft' : gap16 ≤ p.castSucc := le_of_not_gt hleft
    have hright : gap ≤ j.castSucc := by
      change gap.val ≤ j.val
      change gap.val ≤ p.val at hleft'
      omega
    rw [Fin.succAbove_of_le_castSucc _ _ hleft',
      Fin.succAbove_of_le_castSucc _ _ hright]
    simp only [Fin.val_succ]
    omega

private theorem gapTen_castLE_succAbove_val_exactSeventeen
    (gap : Fin 10) (p : Fin 16) (j : Fin 9) (hp : p.val = j.val) :
    ((Fin.castLE (by omega) gap : Fin 17).succAbove p).val =
      (gap.succAbove j).val := by
  let gap17 : Fin 17 := Fin.castLE (by omega) gap
  by_cases hleft : p.castSucc < gap17
  · have hright : j.castSucc < gap := by
      change j.val < gap.val
      change p.val < gap.val at hleft
      omega
    rw [Fin.succAbove_of_castSucc_lt _ _ hleft,
      Fin.succAbove_of_castSucc_lt _ _ hright]
    simp only [Fin.val_castSucc]
    exact hp
  · have hleft' : gap17 ≤ p.castSucc := le_of_not_gt hleft
    have hright : gap ≤ j.castSucc := by
      change gap.val ≤ j.val
      change gap.val ≤ p.val at hleft'
      omega
    rw [Fin.succAbove_of_le_castSucc _ _ hleft',
      Fin.succAbove_of_le_castSucc _ _ hright]
    simp only [Fin.val_succ]
    omega

private theorem gapEleven_castLE_succAbove_val
    (gap : Fin 11) (p : Fin 16) (j : Fin 10) (hp : p.val = j.val) :
    ((Fin.castLE (by omega) gap : Fin 17).succAbove p).val =
      (gap.succAbove j).val := by
  let gap17 : Fin 17 := Fin.castLE (by omega) gap
  by_cases hleft : p.castSucc < gap17
  · have hright : j.castSucc < gap := by
      change j.val < gap.val
      change p.val < gap.val at hleft
      omega
    rw [Fin.succAbove_of_castSucc_lt _ _ hleft,
      Fin.succAbove_of_castSucc_lt _ _ hright]
    simp only [Fin.val_castSucc]
    exact hp
  · have hleft' : gap17 ≤ p.castSucc := le_of_not_gt hleft
    have hright : gap ≤ j.castSucc := by
      change gap.val ≤ j.val
      change gap.val ≤ p.val at hleft'
      omega
    rw [Fin.succAbove_of_le_castSucc _ _ hleft',
      Fin.succAbove_of_le_castSucc _ _ hright]
    simp only [Fin.val_succ]
    omega

private theorem reverseGapTen_castLE_succAbove_sum
    (gap : Fin 10) (p : Fin 15) (j : Fin 9) (hsum : p.val + j.val = 8) :
    ((Fin.castLE (by omega) (reverseGapTen gap) : Fin 16).succAbove p).val +
        (gap.succAbove j).val = 9 := by
  have hpLt : p.val < 9 := by omega
  let p9 : Fin 9 := ⟨p.val, hpLt⟩
  have hcast := gapTen_castLE_succAbove_val (reverseGapTen gap) p p9 rfl
  have hrev := reverse_gap_succAbove_sum gap j p9 (by simpa [p9] using hsum)
  omega

private theorem reverseGapTen_castLE_succAbove_sum_exactSeventeen
    (gap : Fin 10) (p : Fin 16) (j : Fin 9) (hsum : p.val + j.val = 8) :
    ((Fin.castLE (by omega) (reverseGapTen gap) : Fin 17).succAbove p).val +
        (gap.succAbove j).val = 9 := by
  have hpLt : p.val < 9 := by omega
  let p9 : Fin 9 := ⟨p.val, hpLt⟩
  have hcast := gapTen_castLE_succAbove_val_exactSeventeen
    (reverseGapTen gap) p p9 rfl
  have hrev := reverse_gap_succAbove_sum gap j p9 (by simpa [p9] using hsum)
  omega

private theorem reverse_gap_eleven_succAbove_sum
    (gap : Fin 11) (j p : Fin 10) (hsum : p.val + j.val = 9) :
    ((Fin.rev gap).succAbove p).val + (gap.succAbove j).val = 10 := by
  by_cases hj : j.castSucc < gap
  · change j.val < gap.val at hj
    have hp : Fin.rev gap ≤ p.castSucc := by
      change (Fin.rev gap).val ≤ p.val
      rw [Fin.val_rev]
      omega
    rw [Fin.succAbove_of_le_castSucc _ _ hp,
      Fin.succAbove_of_castSucc_lt _ _ hj]
    simp only [Fin.val_succ, Fin.val_castSucc]
    omega
  · have hj' : gap ≤ j.castSucc := le_of_not_gt hj
    change gap.val ≤ j.val at hj'
    have hp : p.castSucc < Fin.rev gap := by
      change p.val < (Fin.rev gap).val
      rw [Fin.val_rev]
      omega
    rw [Fin.succAbove_of_castSucc_lt _ _ hp,
      Fin.succAbove_of_le_castSucc _ _ hj']
    simp only [Fin.val_succ, Fin.val_castSucc]
    omega

private theorem reverseGapEleven_castLE_succAbove_sum_exactSeventeen
    (gap : Fin 11) (p : Fin 16) (j : Fin 10)
    (hsum : p.val + j.val = 9) :
    ((Fin.castLE (by omega) (Fin.rev gap) : Fin 17).succAbove p).val +
        (gap.succAbove j).val = 10 := by
  have hpLt : p.val < 10 := by omega
  let p10 : Fin 10 := ⟨p.val, hpLt⟩
  have hcast := gapEleven_castLE_succAbove_val (Fin.rev gap) p p10 rfl
  have hrev := reverse_gap_eleven_succAbove_sum gap j p10
    (by simpa [p10] using hsum)
  omega

private theorem seven_index_order_classification
    {m : ℕ} (hm : m = 9)
    (iu iv ic id ixv ie ixu : Fin m)
    (hu0 : 0 < iu.val) (hu8 : iu.val < m - 1)
    (hv0 : 0 < iv.val) (hv8 : iv.val < m - 1)
    (hc0 : 0 < ic.val) (hc8 : ic.val < m - 1)
    (hd0 : 0 < id.val) (hd8 : id.val < m - 1)
    (hxv0 : 0 < ixv.val) (hxv8 : ixv.val < m - 1)
    (he0 : 0 < ie.val) (he8 : ie.val < m - 1)
    (hxu0 : 0 < ixu.val) (hxu8 : ixu.val < m - 1)
    (he_ne_xv : ie ≠ ixv)
    (hXv : (iu < ixv ∧ ixv < ixu) ∨ (ixu < ixv ∧ ixv < iu))
    (hV : (iu < iv ∧ iv < ixv) ∨ (ixv < iv ∧ iv < iu))
    (hD : (iv < id ∧ id < ixv) ∨ (ixv < id ∧ id < iv))
    (hC : (iv < ic ∧ ic < id) ∨ (id < ic ∧ ic < iv))
    (hE : (id < ie ∧ ie < ixu) ∨ (ixu < ie ∧ ie < id)) :
    (iu.val = 1 ∧ iv.val = 2 ∧ ic.val = 3 ∧ id.val = 4 ∧
      ixv.val = 5 ∧ ie.val = 6 ∧ ixu.val = 7) ∨
    (iu.val = 1 ∧ iv.val = 2 ∧ ic.val = 3 ∧ id.val = 4 ∧
      ie.val = 5 ∧ ixv.val = 6 ∧ ixu.val = 7) ∨
    (ixu.val = 1 ∧ ie.val = 2 ∧ ixv.val = 3 ∧ id.val = 4 ∧
      ic.val = 5 ∧ iv.val = 6 ∧ iu.val = 7) ∨
    (ixu.val = 1 ∧ ixv.val = 2 ∧ ie.val = 3 ∧ id.val = 4 ∧
      ic.val = 5 ∧ iv.val = 6 ∧ iu.val = 7) := by
  rcases hXv with hXv | hXv
  · have hV' : iu < iv ∧ iv < ixv := by
      rcases hV with hV | hV
      · exact hV
      · omega
    have hD' : iv < id ∧ id < ixv := by
      rcases hD with hD | hD
      · exact hD
      · omega
    have hC' : iv < ic ∧ ic < id := by
      rcases hC with hC | hC
      · exact hC
      · omega
    have hE' : id < ie ∧ ie < ixu := by
      rcases hE with hE | hE
      · exact hE
      · omega
    rcases lt_or_gt_of_ne he_ne_xv with hlt | hgt
    · right; left; omega
    · left; omega
  · have hV' : ixv < iv ∧ iv < iu := by
      rcases hV with hV | hV
      · omega
      · exact hV
    have hD' : ixv < id ∧ id < iv := by
      rcases hD with hD | hD
      · omega
      · exact hD
    have hC' : id < ic ∧ ic < iv := by
      rcases hC with hC | hC
      · omega
      · exact hC
    have hE' : ixu < ie ∧ ie < id := by
      rcases hE with hE | hE
      · omega
      · exact hE
    rcases lt_or_gt_of_ne he_ne_xv with hlt | hgt
    · right; right; left; omega
    · right; right; right; omega

private theorem false_of_blockerVExactFifteen_bank_of_covered_source_rows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (boundary : Fin D.A.card → ℝ²)
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = D.A)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (orientation : BlockerVExactFifteenFourRowCoverage.Orientation)
    (order : Fin 2) (labelIndex : Fin 15 → Fin D.A.card)
    (hposition :
      BlockerVExactFifteenFourRowCoverage.PositionEmbedding
        orientation order labelIndex)
    (hKxvCovered :
      ((lateFirstApexSystem R).selectedAt packet.xv Q.hxvA).toCriticalFourShell.support ⊆
        Finset.univ.image (fun point : Fin 15 => boundary (labelIndex point)))
    (hKuCovered :
      ((lateFirstApexSystem R).selectedAt P.u.1 P.u.2).toCriticalFourShell.support ⊆
        Finset.univ.image (fun point : Fin 15 => boundary (labelIndex point)))
    (hKvCovered :
      ((lateFirstApexSystem R).selectedAt P.v.1 P.v.2).toCriticalFourShell.support ⊆
        Finset.univ.image (fun point : Fin 15 => boundary (labelIndex point)))
    (hKdelCovered :
      ((lateFirstApexSystem R).selectedAt P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2).toCriticalFourShell.support ⊆
        Finset.univ.image (fun point : Fin 15 => boundary (labelIndex point)))
    (hvInterior : P.v.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hxvInterior : packet.xv ∈ S.capInteriorByIndex S.oppIndex2)
    (hdeletedInterior :
      P.jointDeletion.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hcInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2 ∈ S.capInteriorByIndex S.oppIndex2)
    (huPoint : boundary (labelIndex 6) = P.u.1)
    (hxuPoint : boundary (labelIndex 7) = packet.xu)
    (hvPoint : boundary (labelIndex 8) = P.v.1)
    (hxvPoint : boundary (labelIndex 9) = packet.xv)
    (hdeletedPoint :
      boundary (labelIndex 10) = P.jointDeletion.deleted.1)
    (hcPoint :
      boundary (labelIndex 11) =
        (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2)
    (hePoint :
      boundary (labelIndex 12) =
        (lateFirstApexSystem R).centerAt packet.xu Q.hxuA)
    (hlongPoint : ∀ point,
      BlockerVExactFifteenFourRowCoverage.longLabelBool point = true →
        boundary (labelIndex point) ∈ S.capByIndex S.oppIndex2) : False := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ku := (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  let Kv := (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
  let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let Kdel :=
    (Hlate.selectedAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2).toCriticalFourShell
  let c := Hlate.centerAt P.jointDeletion.deleted.1
    P.jointDeletion.deleted.2
  have hxuInter : packet.xu ∈ Ku.support ∩
      SelectedClass D.A S.oppApex2 P.rho := by
    simpa only [Ku, Hlate] using (show
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
      rw [packet.source_row_trace]
      simp)
  have hxuURow : packet.xu ∈ Ku.support := (Finset.mem_inter.mp hxuInter).1
  have hxvInter : packet.xv ∈ Kv.support ∩
      SelectedClass D.A S.oppApex2 P.rho := by
    simpa only [Kv, Hlate] using (show
      packet.xv ∈
        ((lateFirstApexSystem R).selectedAt
          P.v.1 P.v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
      rw [packet.opposite_row_trace]
      simp)
  have hxvVRow : packet.xv ∈ Kv.support := (Finset.mem_inter.mp hxvInter).1
  have hcenterU : Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [Hlate, P.huSource] using packet.blocker_eq_xv
  let rowSupport : Fin 4 → Finset (ℝ²) := fun row =>
    match row.1 with
    | 0 => Kxv.support
    | 1 => Ku.support
    | 2 => Kv.support
    | _ => Kdel.support
  let f : Fin 15 → ℝ² := fun point => boundary (labelIndex point)
  let membership : Fin 4 → Fin 15 → Bool := fun row point =>
    decide (f point ∈ rowSupport row)
  have hlabelInjective : Function.Injective labelIndex :=
    BlockerVExactFifteenFourRowCoverage.labelIndex_injective_of_positionEmbedding
      orientation order labelIndex hposition
  have hfInjective : Function.Injective f :=
    hboundaryInjective.comp hlabelInjective
  have hrowCovered : ∀ row,
      rowSupport row ⊆ Finset.univ.image f := by
    intro row
    fin_cases row
    · simpa only [rowSupport, f, Kxv, Hlate] using hKxvCovered
    · simpa only [rowSupport, f, Ku, Hlate] using hKuCovered
    · simpa only [rowSupport, f, Kv, Hlate] using hKvCovered
    · simpa only [rowSupport, f, Kdel, Hlate] using hKdelCovered
  have hrowCard : ∀ row, (rowSupport row).card = 4 := by
    intro row
    fin_cases row
    · exact Kxv.support_card
    · exact Ku.support_card
    · exact Kv.support_card
    · exact Kdel.support_card
  have htotal : ∀ row,
      (Finset.univ.filter fun point => membership row point).card = 4 := by
    intro row
    change (Finset.univ.filter fun point =>
      decide (f point ∈ rowSupport row)).card = 4
    calc
      _ = (rowSupport row).card :=
        filter_decide_mem_card_eq f hfInjective rfl (hrowCovered row)
      _ = 4 := hrowCard row
  have hfixed₁ : ∀ row,
      membership row
        (BlockerVExactFifteenFourRowCoverage.fixedHit₁ row) = true := by
    intro row
    fin_cases row
    · simpa [membership, f, rowSupport,
        BlockerVExactFifteenFourRowCoverage.fixedHit₁, huPoint] using
        Q.huXvRow
    · simpa [membership, f, rowSupport,
        BlockerVExactFifteenFourRowCoverage.fixedHit₁, huPoint] using
        Ku.q_mem_support
    · simpa [membership, f, rowSupport,
        BlockerVExactFifteenFourRowCoverage.fixedHit₁, hvPoint] using
        Kv.q_mem_support
    · simpa [membership, f, rowSupport,
        BlockerVExactFifteenFourRowCoverage.fixedHit₁, hvPoint] using
        Q.hvDeletedRow
  have hfixed₂ : ∀ row,
      membership row
        (BlockerVExactFifteenFourRowCoverage.fixedHit₂ row) = true := by
    intro row
    fin_cases row <;>
      simp [membership, f, rowSupport,
        BlockerVExactFifteenFourRowCoverage.fixedHit₂,
        hxuPoint, hxvPoint, hdeletedPoint,
        Kxv.q_mem_support, hxuURow, hxvVRow, Kdel.q_mem_support]
  have interiorCap {x : ℝ²}
      (hx : x ∈ S.capInteriorByIndex S.oppIndex2) :
      x ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hx
  have hrowCap : ∀ row,
      (rowSupport row ∩ S.capByIndex S.oppIndex2).card ≤ 2 := by
    intro row
    fin_cases row
    · exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 Kxv.toSelectedFourClass
        (by simpa only [Hlate, Q.hblockerEqV] using interiorCap hvInterior)
    · exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 Ku.toSelectedFourClass
        (by simpa only [Hlate, hcenterU] using interiorCap hxvInterior)
    · exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 Kv.toSelectedFourClass
        (by simpa only [Hlate, hcenterV] using interiorCap hdeletedInterior)
    · exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 Kdel.toSelectedFourClass
        (by simpa only [Hlate, c] using interiorCap hcInterior)
  have hlong : ∀ row,
      (Finset.univ.filter fun point =>
        membership row point &&
          BlockerVExactFifteenFourRowCoverage.longLabelBool point).card ≤ 2 := by
    intro row
    exact filter_decide_mem_and_mask_card_le f hfInjective
      (rowSupport row) (S.capByIndex S.oppIndex2)
      BlockerVExactFifteenFourRowCoverage.longLabelBool hlongPoint
      (hrowCap row)
  have hshell : ∀ row point₁ point₂,
      membership row point₁ = true → membership row point₂ = true →
        dist
            (boundary (labelIndex
              (BlockerVExactFifteenFourRowCoverage.centerLabel row)))
            (boundary (labelIndex point₁)) =
          dist
            (boundary (labelIndex
              (BlockerVExactFifteenFourRowCoverage.centerLabel row)))
            (boundary (labelIndex point₂)) := by
    intro row point₁ point₂ hpoint₁ hpoint₂
    have hmem₁ : f point₁ ∈ rowSupport row :=
      of_decide_eq_true (by simpa only [membership] using hpoint₁)
    have hmem₂ : f point₂ ∈ rowSupport row :=
      of_decide_eq_true (by simpa only [membership] using hpoint₂)
    fin_cases row
    · have hdist := (Kxv.support_eq_radius _ hmem₁).trans
        (Kxv.support_eq_radius _ hmem₂).symm
      simpa only [f, rowSupport,
        BlockerVExactFifteenFourRowCoverage.centerLabel,
        hvPoint, Hlate, Q.hblockerEqV] using hdist
    · have hdist := (Ku.support_eq_radius _ hmem₁).trans
        (Ku.support_eq_radius _ hmem₂).symm
      simpa only [f, rowSupport,
        BlockerVExactFifteenFourRowCoverage.centerLabel,
        hxvPoint, Hlate, hcenterU] using hdist
    · have hdist := (Kv.support_eq_radius _ hmem₁).trans
        (Kv.support_eq_radius _ hmem₂).symm
      simpa only [f, rowSupport,
        BlockerVExactFifteenFourRowCoverage.centerLabel,
        hdeletedPoint, Hlate, hcenterV] using hdist
    · have hdist := (Kdel.support_eq_radius _ hmem₁).trans
        (Kdel.support_eq_radius _ hmem₂).symm
      simpa only [f, rowSupport,
        BlockerVExactFifteenFourRowCoverage.centerLabel,
        hcPoint, c, Hlate] using hdist
  exact
    BlockerVExactFifteenFourRowCoverage.false_of_positionEmbedding_membershipRows
      D.convex hboundaryInjective hboundaryImage hboundaryCcw
      orientation order labelIndex membership hposition htotal hfixed₁
      hfixed₂ hlong hshell

private theorem false_of_blockerVExactSixteen_bank_of_covered_source_rows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (boundary : Fin D.A.card → ℝ²)
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = D.A)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (orientation : BlockerVExactSixteenFourRowCoverage.Orientation)
    (order : Fin 2) (insertion : Fin 7)
    (labelIndex : Fin 16 → Fin D.A.card)
    (hposition :
      BlockerVExactSixteenFourRowCoverage.PositionEmbedding
        orientation order insertion labelIndex)
    (hKxvCovered :
      ((lateFirstApexSystem R).selectedAt packet.xv Q.hxvA).toCriticalFourShell.support ⊆
        Finset.univ.image (fun point : Fin 16 => boundary (labelIndex point)))
    (hKuCovered :
      ((lateFirstApexSystem R).selectedAt P.u.1 P.u.2).toCriticalFourShell.support ⊆
        Finset.univ.image (fun point : Fin 16 => boundary (labelIndex point)))
    (hKvCovered :
      ((lateFirstApexSystem R).selectedAt P.v.1 P.v.2).toCriticalFourShell.support ⊆
        Finset.univ.image (fun point : Fin 16 => boundary (labelIndex point)))
    (hKdelCovered :
      ((lateFirstApexSystem R).selectedAt P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2).toCriticalFourShell.support ⊆
        Finset.univ.image (fun point : Fin 16 => boundary (labelIndex point)))
    (hvInterior : P.v.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hxvInterior : packet.xv ∈ S.capInteriorByIndex S.oppIndex2)
    (hdeletedInterior :
      P.jointDeletion.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hcInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2 ∈ S.capInteriorByIndex S.oppIndex2)
    (huPoint : boundary (labelIndex 6) = P.u.1)
    (hxuPoint : boundary (labelIndex 7) = packet.xu)
    (hvPoint : boundary (labelIndex 8) = P.v.1)
    (hxvPoint : boundary (labelIndex 9) = packet.xv)
    (hdeletedPoint :
      boundary (labelIndex 10) = P.jointDeletion.deleted.1)
    (hcPoint :
      boundary (labelIndex 11) =
        (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2)
    (hePoint :
      boundary (labelIndex 12) =
        (lateFirstApexSystem R).centerAt packet.xu Q.hxuA)
    (hlongPoint : ∀ point,
      BlockerVExactSixteenFourRowCoverage.longLabelBool point = true →
        boundary (labelIndex point) ∈ S.capByIndex S.oppIndex2) : False := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ku := (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  let Kv := (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
  let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let Kdel :=
    (Hlate.selectedAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2).toCriticalFourShell
  let c := Hlate.centerAt P.jointDeletion.deleted.1
    P.jointDeletion.deleted.2
  have hxuInter : packet.xu ∈ Ku.support ∩
      SelectedClass D.A S.oppApex2 P.rho := by
    simpa only [Ku, Hlate] using (show
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
      rw [packet.source_row_trace]
      simp)
  have hxuURow : packet.xu ∈ Ku.support := (Finset.mem_inter.mp hxuInter).1
  have hxvInter : packet.xv ∈ Kv.support ∩
      SelectedClass D.A S.oppApex2 P.rho := by
    simpa only [Kv, Hlate] using (show
      packet.xv ∈
        ((lateFirstApexSystem R).selectedAt
          P.v.1 P.v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
      rw [packet.opposite_row_trace]
      simp)
  have hxvVRow : packet.xv ∈ Kv.support := (Finset.mem_inter.mp hxvInter).1
  have hcenterU : Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [Hlate, P.huSource] using packet.blocker_eq_xv
  let rowSupport : Fin 4 → Finset (ℝ²) := fun row =>
    match row.1 with
    | 0 => Kxv.support
    | 1 => Ku.support
    | 2 => Kv.support
    | _ => Kdel.support
  let f : Fin 16 → ℝ² := fun point => boundary (labelIndex point)
  let membership : Fin 4 → Fin 16 → Bool := fun row point =>
    decide (f point ∈ rowSupport row)
  have hlabelInjective : Function.Injective labelIndex :=
    BlockerVExactSixteenFourRowCoverage.labelIndex_injective_of_positionEmbedding
      orientation order insertion labelIndex hposition
  have hfInjective : Function.Injective f :=
    hboundaryInjective.comp hlabelInjective
  have hrowCovered : ∀ row,
      rowSupport row ⊆ Finset.univ.image f := by
    intro row
    fin_cases row
    · simpa only [rowSupport, f, Kxv, Hlate] using hKxvCovered
    · simpa only [rowSupport, f, Ku, Hlate] using hKuCovered
    · simpa only [rowSupport, f, Kv, Hlate] using hKvCovered
    · simpa only [rowSupport, f, Kdel, Hlate] using hKdelCovered
  have hrowCard : ∀ row, (rowSupport row).card = 4 := by
    intro row
    fin_cases row
    · exact Kxv.support_card
    · exact Ku.support_card
    · exact Kv.support_card
    · exact Kdel.support_card
  have htotal : ∀ row,
      (Finset.univ.filter fun point => membership row point).card = 4 := by
    intro row
    change (Finset.univ.filter fun point =>
      decide (f point ∈ rowSupport row)).card = 4
    calc
      _ = (rowSupport row).card :=
        filter_decide_mem_card_eq f hfInjective rfl (hrowCovered row)
      _ = 4 := hrowCard row
  have hfixed₁ : ∀ row,
      membership row
        (BlockerVExactSixteenFourRowCoverage.fixedHit₁ row) = true := by
    intro row
    fin_cases row
    · simpa [membership, f, rowSupport,
        BlockerVExactSixteenFourRowCoverage.fixedHit₁, huPoint] using
        Q.huXvRow
    · simpa [membership, f, rowSupport,
        BlockerVExactSixteenFourRowCoverage.fixedHit₁, huPoint] using
        Ku.q_mem_support
    · simpa [membership, f, rowSupport,
        BlockerVExactSixteenFourRowCoverage.fixedHit₁, hvPoint] using
        Kv.q_mem_support
    · simpa [membership, f, rowSupport,
        BlockerVExactSixteenFourRowCoverage.fixedHit₁, hvPoint] using
        Q.hvDeletedRow
  have hfixed₂ : ∀ row,
      membership row
        (BlockerVExactSixteenFourRowCoverage.fixedHit₂ row) = true := by
    intro row
    fin_cases row <;>
      simp [membership, f, rowSupport,
        BlockerVExactSixteenFourRowCoverage.fixedHit₂,
        hxuPoint, hxvPoint, hdeletedPoint,
        Kxv.q_mem_support, hxuURow, hxvVRow, Kdel.q_mem_support]
  have interiorCap {x : ℝ²}
      (hx : x ∈ S.capInteriorByIndex S.oppIndex2) :
      x ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hx
  have hrowCap : ∀ row,
      (rowSupport row ∩ S.capByIndex S.oppIndex2).card ≤ 2 := by
    intro row
    fin_cases row
    · exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 Kxv.toSelectedFourClass
        (by simpa only [Hlate, Q.hblockerEqV] using interiorCap hvInterior)
    · exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 Ku.toSelectedFourClass
        (by simpa only [Hlate, hcenterU] using interiorCap hxvInterior)
    · exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 Kv.toSelectedFourClass
        (by simpa only [Hlate, hcenterV] using interiorCap hdeletedInterior)
    · exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 Kdel.toSelectedFourClass
        (by simpa only [Hlate, c] using interiorCap hcInterior)
  have hlong : ∀ row,
      (Finset.univ.filter fun point =>
        membership row point &&
          BlockerVExactSixteenFourRowCoverage.longLabelBool point).card ≤ 2 := by
    intro row
    exact filter_decide_mem_and_mask_card_le f hfInjective
      (rowSupport row) (S.capByIndex S.oppIndex2)
      BlockerVExactSixteenFourRowCoverage.longLabelBool hlongPoint
      (hrowCap row)
  have hshell : ∀ row point₁ point₂,
      membership row point₁ = true → membership row point₂ = true →
        dist
            (boundary (labelIndex
              (BlockerVExactSixteenFourRowCoverage.centerLabel row)))
            (boundary (labelIndex point₁)) =
          dist
            (boundary (labelIndex
              (BlockerVExactSixteenFourRowCoverage.centerLabel row)))
            (boundary (labelIndex point₂)) := by
    intro row point₁ point₂ hpoint₁ hpoint₂
    have hmem₁ : f point₁ ∈ rowSupport row :=
      of_decide_eq_true (by simpa only [membership] using hpoint₁)
    have hmem₂ : f point₂ ∈ rowSupport row :=
      of_decide_eq_true (by simpa only [membership] using hpoint₂)
    fin_cases row
    · have hdist := (Kxv.support_eq_radius _ hmem₁).trans
        (Kxv.support_eq_radius _ hmem₂).symm
      simpa only [f, rowSupport,
        BlockerVExactSixteenFourRowCoverage.centerLabel,
        hvPoint, Hlate, Q.hblockerEqV] using hdist
    · have hdist := (Ku.support_eq_radius _ hmem₁).trans
        (Ku.support_eq_radius _ hmem₂).symm
      simpa only [f, rowSupport,
        BlockerVExactSixteenFourRowCoverage.centerLabel,
        hxvPoint, Hlate, hcenterU] using hdist
    · have hdist := (Kv.support_eq_radius _ hmem₁).trans
        (Kv.support_eq_radius _ hmem₂).symm
      simpa only [f, rowSupport,
        BlockerVExactSixteenFourRowCoverage.centerLabel,
        hdeletedPoint, Hlate, hcenterV] using hdist
    · have hdist := (Kdel.support_eq_radius _ hmem₁).trans
        (Kdel.support_eq_radius _ hmem₂).symm
      simpa only [f, rowSupport,
        BlockerVExactSixteenFourRowCoverage.centerLabel,
        hcPoint, c, Hlate] using hdist
  exact
    BlockerVExactSixteenFourRowCoverage.false_of_positionEmbedding_membershipRows
      D.convex hboundaryInjective hboundaryImage hboundaryCcw
      orientation order insertion labelIndex membership hposition htotal hfixed₁
      hfixed₂ hlong hshell

/-- Exact-fifteen child of the sole surviving deleted-row `BlockerV` arm.
The seven named strict-cap points exhaust the nine-point cap, and the four
source rows feed the exhaustive exact-fifteen coverage certificate. -/
theorem
    false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_eq_fifteen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (hcenterDeletedInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (hcenterDeletedOffClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∉
        SelectedClass D.A S.oppApex2 P.rho)
    (hcard : D.A.card = 15) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ku := (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  let Kv := (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
  let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let Kdel :=
    (Hlate.selectedAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2).toCriticalFourShell
  let Kxu := (Hlate.selectedAt packet.xu Q.hxuA).toCriticalFourShell
  let C := SelectedClass D.A S.oppApex2 P.rho
  let I := S.capInteriorByIndex S.oppIndex2
  let c :=
    Hlate.centerAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2
  let e := Hlate.centerAt packet.xu Q.hxuA
  have hprofile :=
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_exact_fifteen_profile
      Q hcenterV hcenterDeletedInterior hcenterDeletedOffClass hcard
  have hcapCard : (S.capByIndex S.oppIndex2).card = 9 := by
    rw [capByIndex_oppIndex2_eq_oppCap2_sourceHeavy S]
    exact hprofile.2.2.1
  have hnamed : insert e (insert c C) = I := by
    simpa only [blockerVSecondCapNamedSeven, Hlate, e, c, C, I] using hprofile.2.2.2
  have hxuInter : packet.xu ∈ Ku.support ∩ C := by
    simpa only [Ku, C, Hlate] using (show
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
      rw [packet.source_row_trace]
      simp)
  have hxuURow : packet.xu ∈ Ku.support := (Finset.mem_inter.mp hxuInter).1
  have hxuClass : packet.xu ∈ C := (Finset.mem_inter.mp hxuInter).2
  have hxvInter : packet.xv ∈ Kv.support ∩ C := by
    simpa only [C] using (show
      packet.xv ∈ Kv.support ∩ SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.opposite_row_trace]
        simp)
  have hxvVRow : packet.xv ∈ Kv.support := (Finset.mem_inter.mp hxvInter).1
  have hxvClass : packet.xv ∈ C := (Finset.mem_inter.mp hxvInter).2
  have hcenterU : Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [Hlate, P.huSource] using packet.blocker_eq_xv
  have hE : dist packet.xv P.u.1 = dist packet.xv packet.xu := by
    rw [← hcenterU]
    exact (Ku.support_eq_radius _ Ku.q_mem_support).trans
      (Ku.support_eq_radius _ hxuURow).symm
  have hD : dist P.v.1 packet.xv = dist P.v.1 P.u.1 := by
    rw [← Q.hblockerEqV]
    exact (Kxv.support_eq_radius _ Kxv.q_mem_support).trans
      (Kxv.support_eq_radius _ Q.huXvRow).symm
  have hC :
      dist P.jointDeletion.deleted.1 P.v.1 =
        dist P.jointDeletion.deleted.1 packet.xv := by
    have hraw :=
      (Kv.support_eq_radius _ Kv.q_mem_support).trans
        (Kv.support_eq_radius _ hxvVRow).symm
    simpa only [Hlate, hcenterV] using hraw
  have hB : dist e packet.xu = dist e P.jointDeletion.deleted.1 := by
    simpa only [e, Kxu] using
      (Kxu.support_eq_radius _ Kxu.q_mem_support).trans
        (Kxu.support_eq_radius _ Q.hdeletedXuRow).symm
  have hA : dist c P.jointDeletion.deleted.1 = dist c P.v.1 := by
    simpa only [c, Kdel] using
      (Kdel.support_eq_radius _ Kdel.q_mem_support).trans
        (Kdel.support_eq_radius _ Q.hvDeletedRow).symm
  have hclassInterior : C ⊆ I := by
    intro x hx
    rw [← hnamed]
    simp [hx]
  have heInterior : e ∈ I := by rw [← hnamed]; simp
  have hcInterior : c ∈ I := by rw [← hnamed]; simp
  have huInterior : P.u.1 ∈ I := hclassInterior P.huClass
  have hxuInterior : packet.xu ∈ I := hclassInterior hxuClass
  have hvInterior : P.v.1 ∈ I := hclassInterior P.hvClass
  have hxvInterior : packet.xv ∈ I := hclassInterior hxvClass
  have hdeletedInterior : P.jointDeletion.deleted.1 ∈ I :=
    hclassInterior P.jointDeletion.deleted_mem_class
  have huNeXu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have hvNeXv : P.v.1 ≠ packet.xv := packet.xv_ne_v.symm
  have huNeV : P.u.1 ≠ P.v.1 := by
    intro h
    exact P.huNeV (Subtype.ext h)
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply Ku.center_not_mem_support
    simpa only [hcenterU, ← h] using Ku.q_mem_support
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply Ku.center_not_mem_support
    simpa only [hcenterU, ← h] using hxuURow
  have hdelNeV : P.jointDeletion.deleted.1 ≠ P.v.1 := by
    intro h
    apply Kv.center_not_mem_support
    simpa only [Hlate, hcenterV, h] using Kv.q_mem_support
  have hdelNeXv : P.jointDeletion.deleted.1 ≠ packet.xv := by
    intro h
    apply Q.hxvNotDeletedRow
    simpa only [← h] using Kdel.q_mem_support
  have hcNeDeleted : c ≠ P.jointDeletion.deleted.1 := by
    simpa only [c, Hlate] using
      centerAt_ne_source Hlate P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2
  have hcNeV : c ≠ P.v.1 := by
    intro h
    exact hcenterDeletedOffClass (by simpa only [c, Hlate, h] using P.hvClass)
  have heNeXu : e ≠ packet.xu := by
    simpa only [e] using centerAt_ne_source Hlate packet.xu Q.hxuA
  have heNeDeleted : e ≠ P.jointDeletion.deleted.1 := by
    intro h
    apply Kxu.center_not_mem_support
    simpa only [e, h] using Q.hdeletedXuRow
  have hdelNeXu : P.jointDeletion.deleted.1 ≠ packet.xu := by
    intro h
    apply Q.hxuNotDeletedRow
    simpa only [← h] using Kdel.q_mem_support
  have hcOff : c ∉ C := by
    simpa only [c, C, Hlate] using hcenterDeletedOffClass
  have hnamedInfo :=
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_namedSeven
      Q hcenterV hcenterDeletedInterior hcenterDeletedOffClass
  have hnamedCard : (insert e (insert c C)).card = 7 := by
    simpa only [blockerVSecondCapNamedSeven, Hlate, e, c, C] using hnamedInfo.2
  have heOff : e ∉ C := by
    intro heClass
    have heInsert : e ∈ insert c C := Finset.mem_insert_of_mem heClass
    have hsmall : (insert e (insert c C)).card = 6 := by
      rw [Finset.insert_eq_self.mpr heInsert,
        Finset.card_insert_of_notMem hcOff]
      have hCcard : C.card = 5 := by
        simpa only [C] using P.hclassFive
      omega
    omega
  have heNeXv : e ≠ packet.xv := by
    intro h
    exact heOff (by simpa only [h] using hxvClass)
  rcases S.capByIndex_cgn4g_strictCapBlockData_oriented D.convex S.oppIndex2 with
    ⟨B, hBorient⟩
  have hm : B.m = 9 := B.cap_card_eq.trans hcapCard
  have interiorCap {x : ℝ²} (hx : x ∈ I) : x ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hx
  rcases B.exists_index_of_mem_cap (interiorCap huInterior) with ⟨iu, hiu⟩
  rcases B.exists_index_of_mem_cap (interiorCap hvInterior) with ⟨iv, hiv⟩
  rcases B.exists_index_of_mem_cap (interiorCap hcInterior) with ⟨ic, hic⟩
  rcases B.exists_index_of_mem_cap (interiorCap hdeletedInterior) with ⟨id, hid⟩
  rcases B.exists_index_of_mem_cap (interiorCap hxvInterior) with ⟨ixv, hixv⟩
  rcases B.exists_index_of_mem_cap (interiorCap heInterior) with ⟨ie, hie⟩
  rcases B.exists_index_of_mem_cap (interiorCap hxuInterior) with ⟨ixu, hixu⟩
  have indexBounds {x : ℝ²} (hx : x ∈ I) (i : Fin B.m)
      (hi : B.L.points i = x) : 0 < i.val ∧ i.val < B.m - 1 := by
    have hfirst : i ≠ CGN.firstIndex B.Packet.hm := by
      intro hifirst
      have hxEndpoint :
          x = (S.triangleByIndex S.oppIndex2).v2 ∨
            x = (S.triangleByIndex S.oppIndex2).v3 := by
        rcases hBorient with hb | hb
        · exact Or.inl (hi.symm.trans (by simpa only [hifirst] using hb.1))
        · exact Or.inr (hi.symm.trans (by simpa only [hifirst] using hb.1))
      rcases hxEndpoint with hxEndpoint | hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v2 hx hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v3 hx hxEndpoint
    have hlast : i ≠ CGN.lastIndex B.Packet.hm := by
      intro hilast
      have hxEndpoint :
          x = (S.triangleByIndex S.oppIndex2).v2 ∨
            x = (S.triangleByIndex S.oppIndex2).v3 := by
        rcases hBorient with hb | hb
        · exact Or.inr (hi.symm.trans (by simpa only [hilast] using hb.2))
        · exact Or.inl (hi.symm.trans (by simpa only [hilast] using hb.2))
      rcases hxEndpoint with hxEndpoint | hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v2 hx hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v3 hx hxEndpoint
    have hfirstVal : i.val ≠ 0 := by
      intro hi
      apply hfirst
      apply Fin.ext
      simpa only [CGN.firstIndex_val] using hi
    have hlastVal : i.val ≠ B.m - 1 := by
      intro hi
      apply hlast
      apply Fin.ext
      simpa only [CGN.lastIndex_val] using hi
    constructor <;> omega
  have hiuBounds := indexBounds huInterior iu hiu
  have hivBounds := indexBounds hvInterior iv hiv
  have hicBounds := indexBounds hcInterior ic hic
  have hidBounds := indexBounds hdeletedInterior id hid
  have hixvBounds := indexBounds hxvInterior ixv hixv
  have hieBounds := indexBounds heInterior ie hie
  have hixuBounds := indexBounds hxuInterior ixu hixu
  have between {j r s : Fin B.m} (hjr : B.L.points j ≠ B.L.points r)
      (hjs : B.L.points j ≠ B.L.points s)
      (hrs : B.L.points r ≠ B.L.points s)
      (heq : dist (B.L.points j) (B.L.points r) =
        dist (B.L.points j) (B.L.points s)) :
      (r < j ∧ j < s) ∨ (s < j ∧ j < r) := by
    have hjrIndex : j ≠ r := by
      intro h
      exact hjr (congrArg B.L.points h)
    have hjsIndex : j ≠ s := by
      intro h
      exact hjs (congrArg B.L.points h)
    have hrsIndex : r ≠ s := by
      intro h
      exact hrs (congrArg B.L.points h)
    rcases lt_or_gt_of_ne hrsIndex with hrs | hsr
    · exact Or.inl (CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord hrs hjrIndex hjsIndex heq)
    · exact Or.inr (CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord hsr hjsIndex hjrIndex heq.symm)
  have hXv : (iu < ixv ∧ ixv < ixu) ∨ (ixu < ixv ∧ ixv < iu) :=
    between (by simpa only [hixv, hiu] using huNeXv.symm)
      (by simpa only [hixv, hixu] using hxuNeXv.symm)
      (by simpa only [hiu, hixu] using huNeXu)
      (by simpa only [hixv, hiu, hixu] using hE)
  have hV : (iu < iv ∧ iv < ixv) ∨ (ixv < iv ∧ iv < iu) :=
    between (by simpa only [hiv, hiu] using huNeV.symm)
      (by simpa only [hiv, hixv] using hvNeXv)
      (by simpa only [hiu, hixv] using huNeXv)
      (by simpa only [hiv, hiu, hixv] using hD.symm)
  have hDel : (iv < id ∧ id < ixv) ∨ (ixv < id ∧ id < iv) :=
    between (by simpa only [hid, hiv] using hdelNeV)
      (by simpa only [hid, hixv] using hdelNeXv)
      (by simpa only [hiv, hixv] using hvNeXv)
      (by simpa only [hid, hiv, hixv] using hC)
  have hCenter : (iv < ic ∧ ic < id) ∨ (id < ic ∧ ic < iv) :=
    between (by simpa only [hic, hiv] using hcNeV)
      (by simpa only [hic, hid] using hcNeDeleted)
      (by simpa only [hiv, hid] using hdelNeV.symm)
      (by simpa only [hic, hiv, hid] using hA.symm)
  have hXuCenter : (id < ie ∧ ie < ixu) ∨ (ixu < ie ∧ ie < id) :=
    between (by simpa only [hie, hid] using heNeDeleted)
      (by simpa only [hie, hixu] using heNeXu)
      (by simpa only [hid, hixu] using hdelNeXu)
      (by simpa only [hie, hid, hixu] using hB.symm)
  have hieNeIxv : ie ≠ ixv := by
    intro h
    apply heNeXv
    calc
      e = B.L.points ie := hie.symm
      _ = B.L.points ixv := congrArg B.L.points h
      _ = packet.xv := hixv
  have horders := seven_index_order_classification hm iu iv ic id ixv ie ixu
    hiuBounds.1 hiuBounds.2 hivBounds.1 hivBounds.2 hicBounds.1 hicBounds.2
    hidBounds.1 hidBounds.2 hixvBounds.1 hixvBounds.2 hieBounds.1 hieBounds.2
    hixuBounds.1 hixuBounds.2
    hieNeIxv
    hXv hV hDel hCenter hXuCenter
  let rowSupport : Fin 4 → Finset (ℝ²) := fun row =>
    match row.1 with
    | 0 => Kxv.support
    | 1 => Ku.support
    | 2 => Kv.support
    | _ => Kdel.support
  have close
      (orientation : BlockerVExactFifteenFourRowCoverage.Orientation)
      (order : Fin 2) (boundary : Fin D.A.card → ℝ²)
      (hboundaryInjective : Function.Injective boundary)
      (hboundaryImage : Finset.univ.image boundary = D.A)
      (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
      (labelIndex : Fin 15 → Fin D.A.card)
      (hposition :
        BlockerVExactFifteenFourRowCoverage.PositionEmbedding
          orientation order labelIndex)
      (huPoint : boundary (labelIndex 6) = P.u.1)
      (hxuPoint : boundary (labelIndex 7) = packet.xu)
      (hvPoint : boundary (labelIndex 8) = P.v.1)
      (hxvPoint : boundary (labelIndex 9) = packet.xv)
      (hdeletedPoint :
        boundary (labelIndex 10) = P.jointDeletion.deleted.1)
      (hcPoint : boundary (labelIndex 11) = c)
      (hePoint : boundary (labelIndex 12) = e)
      (hlongPoint : ∀ point,
        BlockerVExactFifteenFourRowCoverage.longLabelBool point = true →
          boundary (labelIndex point) ∈ S.capByIndex S.oppIndex2) : False := by
    let f : Fin 15 → ℝ² := fun point => boundary (labelIndex point)
    let membership : Fin 4 → Fin 15 → Bool := fun row point =>
      decide (f point ∈ rowSupport row)
    have hlabelInjective : Function.Injective labelIndex :=
      BlockerVExactFifteenFourRowCoverage.labelIndex_injective_of_positionEmbedding
        orientation order labelIndex hposition
    have hfInjective : Function.Injective f :=
      hboundaryInjective.comp hlabelInjective
    have hfImageSubset : Finset.univ.image f ⊆ D.A := by
      intro x hx
      rcases Finset.mem_image.mp hx with ⟨point, _hpoint, rfl⟩
      rw [← hboundaryImage]
      exact Finset.mem_image.mpr
        ⟨labelIndex point, Finset.mem_univ _, rfl⟩
    have hfImageCard : (Finset.univ.image f).card = 15 := by
      rw [Finset.card_image_of_injective _ hfInjective]
      simp
    have hfImage : Finset.univ.image f = D.A := by
      apply Finset.eq_of_subset_of_card_le hfImageSubset
      rw [hfImageCard, hcard]
    have hrowSubset : ∀ row, rowSupport row ⊆ D.A := by
      intro row
      fin_cases row
      · exact Kxv.support_subset_A
      · exact Ku.support_subset_A
      · exact Kv.support_subset_A
      · exact Kdel.support_subset_A
    have hrowCard : ∀ row, (rowSupport row).card = 4 := by
      intro row
      fin_cases row
      · exact Kxv.support_card
      · exact Ku.support_card
      · exact Kv.support_card
      · exact Kdel.support_card
    have htotal : ∀ row,
        (Finset.univ.filter fun point => membership row point).card = 4 := by
      intro row
      change (Finset.univ.filter fun point => decide (f point ∈ rowSupport row)).card = 4
      calc
        _ = (rowSupport row).card :=
          filter_decide_mem_card_eq f hfInjective hfImage (hrowSubset row)
        _ = 4 := hrowCard row
    have hfixed₁ : ∀ row,
        membership row
          (BlockerVExactFifteenFourRowCoverage.fixedHit₁ row) = true := by
      intro row
      fin_cases row
      · simpa [membership, f, rowSupport,
          BlockerVExactFifteenFourRowCoverage.fixedHit₁, huPoint] using
          Q.huXvRow
      · simpa [membership, f, rowSupport,
          BlockerVExactFifteenFourRowCoverage.fixedHit₁, huPoint] using
          Ku.q_mem_support
      · simpa [membership, f, rowSupport,
          BlockerVExactFifteenFourRowCoverage.fixedHit₁, hvPoint] using
          Kv.q_mem_support
      · simpa [membership, f, rowSupport,
          BlockerVExactFifteenFourRowCoverage.fixedHit₁, hvPoint] using
          Q.hvDeletedRow
    have hfixed₂ : ∀ row,
        membership row
          (BlockerVExactFifteenFourRowCoverage.fixedHit₂ row) = true := by
      intro row
      fin_cases row <;>
        simp [membership, f, rowSupport,
          BlockerVExactFifteenFourRowCoverage.fixedHit₂,
          hxuPoint, hxvPoint, hdeletedPoint,
          Kxv.q_mem_support, hxuURow, hxvVRow, Kdel.q_mem_support]
    have hrowCap : ∀ row,
        (rowSupport row ∩ S.capByIndex S.oppIndex2).card ≤ 2 := by
      intro row
      fin_cases row
      · exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
          S D.convex S.oppIndex2 Kxv.toSelectedFourClass
          (by simpa only [Hlate, Q.hblockerEqV] using interiorCap hvInterior)
      · exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
          S D.convex S.oppIndex2 Ku.toSelectedFourClass
          (by simpa only [Hlate, hcenterU] using interiorCap hxvInterior)
      · exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
          S D.convex S.oppIndex2 Kv.toSelectedFourClass
          (by simpa only [Hlate, hcenterV] using interiorCap hdeletedInterior)
      · exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
          S D.convex S.oppIndex2 Kdel.toSelectedFourClass
          (by simpa only [Hlate, c] using interiorCap hcInterior)
    have hlong : ∀ row,
        (Finset.univ.filter fun point =>
          membership row point &&
            BlockerVExactFifteenFourRowCoverage.longLabelBool point).card ≤ 2 := by
      intro row
      exact filter_decide_mem_and_mask_card_le f hfInjective
        (rowSupport row) (S.capByIndex S.oppIndex2)
        BlockerVExactFifteenFourRowCoverage.longLabelBool hlongPoint
        (hrowCap row)
    have hshell : ∀ row point₁ point₂,
        membership row point₁ = true → membership row point₂ = true →
          dist
              (boundary (labelIndex
                (BlockerVExactFifteenFourRowCoverage.centerLabel row)))
              (boundary (labelIndex point₁)) =
            dist
              (boundary (labelIndex
                (BlockerVExactFifteenFourRowCoverage.centerLabel row)))
              (boundary (labelIndex point₂)) := by
      intro row point₁ point₂ hpoint₁ hpoint₂
      have hmem₁ : f point₁ ∈ rowSupport row :=
        of_decide_eq_true (by simpa only [membership] using hpoint₁)
      have hmem₂ : f point₂ ∈ rowSupport row :=
        of_decide_eq_true (by simpa only [membership] using hpoint₂)
      fin_cases row
      · have hdist := (Kxv.support_eq_radius _ hmem₁).trans
          (Kxv.support_eq_radius _ hmem₂).symm
        simpa only [f, rowSupport,
          BlockerVExactFifteenFourRowCoverage.centerLabel,
          hvPoint, Hlate, Q.hblockerEqV] using hdist
      · have hdist := (Ku.support_eq_radius _ hmem₁).trans
          (Ku.support_eq_radius _ hmem₂).symm
        simpa only [f, rowSupport,
          BlockerVExactFifteenFourRowCoverage.centerLabel,
          hxvPoint, Hlate, hcenterU] using hdist
      · have hdist := (Kv.support_eq_radius _ hmem₁).trans
          (Kv.support_eq_radius _ hmem₂).symm
        simpa only [f, rowSupport,
          BlockerVExactFifteenFourRowCoverage.centerLabel,
          hdeletedPoint, Hlate, hcenterV] using hdist
      · have hdist := (Kdel.support_eq_radius _ hmem₁).trans
          (Kdel.support_eq_radius _ hmem₂).symm
        simpa only [f, rowSupport,
          BlockerVExactFifteenFourRowCoverage.centerLabel,
          hcPoint, c, Hlate] using hdist
    exact
      BlockerVExactFifteenFourRowCoverage.false_of_positionEmbedding_membershipRows
        D.convex hboundaryInjective hboundaryImage hboundaryCcw
        orientation order labelIndex membership hposition htotal hfixed₁
        hfixed₂ hlong hshell
  have closeForward
      (order : Fin 2)
      (huPos :
        (BlockerVExactFifteenFourRowCoverage.position order 6).val = iu.val)
      (hxuPos :
        (BlockerVExactFifteenFourRowCoverage.position order 7).val = ixu.val)
      (hvPos :
        (BlockerVExactFifteenFourRowCoverage.position order 8).val = iv.val)
      (hxvPos :
        (BlockerVExactFifteenFourRowCoverage.position order 9).val = ixv.val)
      (hdeletedPos :
        (BlockerVExactFifteenFourRowCoverage.position order 10).val = id.val)
      (hcPos :
        (BlockerVExactFifteenFourRowCoverage.position order 11).val = ic.val)
      (hePos :
        (BlockerVExactFifteenFourRowCoverage.position order 12).val = ie.val) :
      False := by
    let shifted : Fin B.n → ℝ² := fun point => B.phi (point + B.Block.lo)
    let boundary : Fin D.A.card → ℝ² := fun point =>
      shifted (Fin.cast B.ambient_card_eq.symm point)
    let labelIndex : Fin 15 → Fin D.A.card := fun point =>
      Fin.cast hcard.symm
        (BlockerVExactFifteenFourRowCoverage.position order point)
    have hshiftedInjective : Function.Injective shifted := by
      simpa only [shifted] using
        injective_cyclicShift B.phi_injective B.Block.lo
    have hboundaryInjective : Function.Injective boundary := by
      simpa only [boundary] using
        injective_finCast_domain B.ambient_card_eq hshiftedInjective
    have hshiftedImage : Finset.univ.image shifted = D.A := by
      calc
        Finset.univ.image shifted = Finset.univ.image B.phi := by
          simpa only [shifted] using
            image_univ_cyclicShift B.phi B.Block.lo
        _ = D.A := B.Block.phi_image
    have hboundaryImage : Finset.univ.image boundary = D.A := by
      simpa only [boundary] using
        (image_univ_finCast_domain B.ambient_card_eq shifted).trans
          hshiftedImage
    have hshiftedCcw : EuclideanGeometry.IsCcwConvexPolygon shifted := by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift B.phi_injective B.phi_ccw B.Block.lo
    have hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
      simpa only [boundary] using
        ccw_finCast_domain B.ambient_card_eq hshiftedCcw
    have hposition :
        BlockerVExactFifteenFourRowCoverage.PositionEmbedding
          .forward order labelIndex := by
      intro point₁ point₂ hlt
      change labelIndex point₁ < labelIndex point₂
      change
        (BlockerVExactFifteenFourRowCoverage.position order point₁).val <
          (BlockerVExactFifteenFourRowCoverage.position order point₂).val
      exact hlt
    have pointAt (point : Fin 15) (t : Fin B.m)
        (hpoint :
          (BlockerVExactFifteenFourRowCoverage.position order point).val =
            t.val) :
        boundary (labelIndex point) = B.L.points t := by
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm
                (BlockerVExactFifteenFourRowCoverage.position order point)) =
            Fin.castLE (by have hspan := B.block_span; omega) t := by
        apply Fin.ext
        exact hpoint
      simpa only [boundary, shifted, labelIndex, hcast] using
        B.shifted_phi_cast_eq_points t
    have hlongPosition : ∀ point,
        BlockerVExactFifteenFourRowCoverage.longLabelBool point = true →
          (BlockerVExactFifteenFourRowCoverage.position order point).val < 9 := by
      fin_cases order <;> decide
    have hlongPoint : ∀ point,
        BlockerVExactFifteenFourRowCoverage.longLabelBool point = true →
          boundary (labelIndex point) ∈ S.capByIndex S.oppIndex2 := by
      intro point hlong
      have hlt := hlongPosition point hlong
      change B.phi
        (Fin.cast B.ambient_card_eq.symm
            (Fin.cast hcard.symm
              (BlockerVExactFifteenFourRowCoverage.position order point)) +
          B.Block.lo) ∈ S.capByIndex S.oppIndex2
      rw [B.shifted_phi_mem_cap_iff]
      change
        (BlockerVExactFifteenFourRowCoverage.position order point).val < B.m
      omega
    exact close .forward order boundary hboundaryInjective hboundaryImage
      hboundaryCcw labelIndex hposition
      ((pointAt 6 iu huPos).trans hiu) ((pointAt 7 ixu hxuPos).trans hixu)
      ((pointAt 8 iv hvPos).trans hiv) ((pointAt 9 ixv hxvPos).trans hixv)
      ((pointAt 10 id hdeletedPos).trans hid) ((pointAt 11 ic hcPos).trans hic)
      ((pointAt 12 ie hePos).trans hie) hlongPoint
  have closeReverse
      (order : Fin 2)
      (huPos :
        (BlockerVExactFifteenFourRowCoverage.position order 6).val + iu.val = 8)
      (hxuPos :
        (BlockerVExactFifteenFourRowCoverage.position order 7).val + ixu.val = 8)
      (hvPos :
        (BlockerVExactFifteenFourRowCoverage.position order 8).val + iv.val = 8)
      (hxvPos :
        (BlockerVExactFifteenFourRowCoverage.position order 9).val + ixv.val = 8)
      (hdeletedPos :
        (BlockerVExactFifteenFourRowCoverage.position order 10).val + id.val = 8)
      (hcPos :
        (BlockerVExactFifteenFourRowCoverage.position order 11).val + ic.val = 8)
      (hePos :
        (BlockerVExactFifteenFourRowCoverage.position order 12).val + ie.val = 8) :
      False := by
    letI : NeZero B.n := ⟨by have hspan := B.block_span; omega⟩
    let cut : Fin B.n := ⟨(B.Block.hi.val + 1) % B.n,
      Nat.mod_lt _ (by have := B.Block.hi.isLt; omega)⟩
    let shifted : Fin B.n → ℝ² := fun point => B.phi (point + cut)
    let boundary : Fin D.A.card → ℝ² := fun point =>
      shifted (Fin.cast B.ambient_card_eq.symm point)
    let labelIndex : Fin 15 → Fin D.A.card := fun point =>
      Fin.cast hcard.symm
        (Fin.rev (BlockerVExactFifteenFourRowCoverage.position order point))
    have hshiftedInjective : Function.Injective shifted := by
      simpa only [shifted] using injective_cyclicShift B.phi_injective cut
    have hboundaryInjective : Function.Injective boundary := by
      simpa only [boundary] using
        injective_finCast_domain B.ambient_card_eq hshiftedInjective
    have hshiftedImage : Finset.univ.image shifted = D.A := by
      calc
        Finset.univ.image shifted = Finset.univ.image B.phi := by
          simpa only [shifted] using image_univ_cyclicShift B.phi cut
        _ = D.A := B.Block.phi_image
    have hboundaryImage : Finset.univ.image boundary = D.A := by
      simpa only [boundary] using
        (image_univ_finCast_domain B.ambient_card_eq shifted).trans
          hshiftedImage
    have hshiftedCcw : EuclideanGeometry.IsCcwConvexPolygon shifted := by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift B.phi_injective B.phi_ccw cut
    have hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
      simpa only [boundary] using
        ccw_finCast_domain B.ambient_card_eq hshiftedCcw
    have hposition :
        BlockerVExactFifteenFourRowCoverage.PositionEmbedding
          .reverse order labelIndex := by
      intro point₁ point₂ hlt
      change labelIndex point₂ < labelIndex point₁
      change
        (Fin.rev
            (BlockerVExactFifteenFourRowCoverage.position order point₂)).val <
          (Fin.rev
            (BlockerVExactFifteenFourRowCoverage.position order point₁)).val
      rw [Fin.val_rev, Fin.val_rev]
      omega
    have pointAt (point : Fin 15) (t : Fin B.m)
        (hpoint :
          (BlockerVExactFifteenFourRowCoverage.position order point).val +
              t.val = 8) :
        boundary (labelIndex point) = B.L.points t := by
      let offset : Fin B.n := ⟨B.n - B.m + t.val, by
        have hspan := B.block_span
        have hmpos := B.Block.hm
        omega⟩
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm
                (Fin.rev
                  (BlockerVExactFifteenFourRowCoverage.position order point))) =
            offset := by
        apply Fin.ext
        simp only [Fin.val_cast, Fin.val_rev]
        dsimp only [offset]
        have hn : B.n = 15 := B.ambient_card_eq.trans hcard
        omega
      simpa only [boundary, shifted, labelIndex, cut, hcast, offset] using
        B.shifted_after_block_phi_cast_eq_points t
    have hlongPosition : ∀ point,
        BlockerVExactFifteenFourRowCoverage.longLabelBool point = true →
          (BlockerVExactFifteenFourRowCoverage.position order point).val < 9 := by
      fin_cases order <;> decide
    have hlongPoint : ∀ point,
        BlockerVExactFifteenFourRowCoverage.longLabelBool point = true →
          boundary (labelIndex point) ∈ S.capByIndex S.oppIndex2 := by
      intro point hlong
      have hlt := hlongPosition point hlong
      let t : Fin B.m := ⟨B.m - 1 -
          (BlockerVExactFifteenFourRowCoverage.position order point).val, by
        omega⟩
      have hsum :
          (BlockerVExactFifteenFourRowCoverage.position order point).val +
              t.val = 8 := by
        change
          (BlockerVExactFifteenFourRowCoverage.position order point).val +
              (B.m - 1 -
                (BlockerVExactFifteenFourRowCoverage.position order point).val) = 8
        omega
      exact (pointAt point t hsum) ▸ B.points_mem_cap t
    exact close .reverse order boundary hboundaryInjective hboundaryImage
      hboundaryCcw labelIndex hposition
      ((pointAt 6 iu huPos).trans hiu) ((pointAt 7 ixu hxuPos).trans hixu)
      ((pointAt 8 iv hvPos).trans hiv) ((pointAt 9 ixv hxvPos).trans hixv)
      ((pointAt 10 id hdeletedPos).trans hid) ((pointAt 11 ic hcPos).trans hic)
      ((pointAt 12 ie hePos).trans hie) hlongPoint
  rcases horders with horder | horder | horder | horder
  · exact closeForward 0 (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
  · exact closeForward 1 (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
  · exact closeReverse 0 (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
  · exact closeReverse 1 (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)

/-- Exact-sixteen cap-nine child of the sole surviving deleted-row `BlockerV`
arm.  The seven named strict-cap points exhaust the nine-point cap, while the
anonymous sixteenth carrier point is inserted into the seven-point outside
arc consumed by the exact-sixteen four-row certificate. -/
theorem
    false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_eq_sixteen_secondCapNine
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (hcenterDeletedInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (hcenterDeletedOffClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∉
        SelectedClass D.A S.oppApex2 P.rho)
    (hcard : D.A.card = 16)
    (hcapCard : (S.capByIndex S.oppIndex2).card = 9) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ku := (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  let Kv := (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
  let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let Kdel :=
    (Hlate.selectedAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2).toCriticalFourShell
  let Kxu := (Hlate.selectedAt packet.xu Q.hxuA).toCriticalFourShell
  let C := SelectedClass D.A S.oppApex2 P.rho
  let I := S.capInteriorByIndex S.oppIndex2
  let c :=
    Hlate.centerAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2
  let e := Hlate.centerAt packet.xu Q.hxuA
  have hnamedInfo :=
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_namedSeven
      Q hcenterV hcenterDeletedInterior hcenterDeletedOffClass
  have hcapAdd :=
    ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
      S S.oppIndex2
  have hIcard : I.card = 7 := by
    have hcapAdd' : I.card + 2 =
        (S.capByIndex S.oppIndex2).card := by
      simpa only [I] using hcapAdd
    omega
  have hnamedSet : blockerVSecondCapNamedSeven Q = I := by
    apply Finset.eq_of_subset_of_card_le hnamedInfo.1
    rw [hnamedInfo.2, hIcard]
  have hnamed : insert e (insert c C) = I := by
    simpa only [blockerVSecondCapNamedSeven, Hlate, e, c, C, I] using hnamedSet
  have hxuInter : packet.xu ∈ Ku.support ∩ C := by
    simpa only [Ku, C, Hlate] using (show
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
      rw [packet.source_row_trace]
      simp)
  have hxuURow : packet.xu ∈ Ku.support := (Finset.mem_inter.mp hxuInter).1
  have hxuClass : packet.xu ∈ C := (Finset.mem_inter.mp hxuInter).2
  have hxvInter : packet.xv ∈ Kv.support ∩ C := by
    simpa only [C] using (show
      packet.xv ∈ Kv.support ∩ SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.opposite_row_trace]
        simp)
  have hxvVRow : packet.xv ∈ Kv.support := (Finset.mem_inter.mp hxvInter).1
  have hxvClass : packet.xv ∈ C := (Finset.mem_inter.mp hxvInter).2
  have hcenterU : Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [Hlate, P.huSource] using packet.blocker_eq_xv
  have hE : dist packet.xv P.u.1 = dist packet.xv packet.xu := by
    rw [← hcenterU]
    exact (Ku.support_eq_radius _ Ku.q_mem_support).trans
      (Ku.support_eq_radius _ hxuURow).symm
  have hD : dist P.v.1 packet.xv = dist P.v.1 P.u.1 := by
    rw [← Q.hblockerEqV]
    exact (Kxv.support_eq_radius _ Kxv.q_mem_support).trans
      (Kxv.support_eq_radius _ Q.huXvRow).symm
  have hC :
      dist P.jointDeletion.deleted.1 P.v.1 =
        dist P.jointDeletion.deleted.1 packet.xv := by
    have hraw :=
      (Kv.support_eq_radius _ Kv.q_mem_support).trans
        (Kv.support_eq_radius _ hxvVRow).symm
    simpa only [Hlate, hcenterV] using hraw
  have hB : dist e packet.xu = dist e P.jointDeletion.deleted.1 := by
    simpa only [e, Kxu] using
      (Kxu.support_eq_radius _ Kxu.q_mem_support).trans
        (Kxu.support_eq_radius _ Q.hdeletedXuRow).symm
  have hA : dist c P.jointDeletion.deleted.1 = dist c P.v.1 := by
    simpa only [c, Kdel] using
      (Kdel.support_eq_radius _ Kdel.q_mem_support).trans
        (Kdel.support_eq_radius _ Q.hvDeletedRow).symm
  have hclassInterior : C ⊆ I := by
    intro x hx
    rw [← hnamed]
    simp [hx]
  have heInterior : e ∈ I := by rw [← hnamed]; simp
  have hcInterior : c ∈ I := by rw [← hnamed]; simp
  have huInterior : P.u.1 ∈ I := hclassInterior P.huClass
  have hxuInterior : packet.xu ∈ I := hclassInterior hxuClass
  have hvInterior : P.v.1 ∈ I := hclassInterior P.hvClass
  have hxvInterior : packet.xv ∈ I := hclassInterior hxvClass
  have hdeletedInterior : P.jointDeletion.deleted.1 ∈ I :=
    hclassInterior P.jointDeletion.deleted_mem_class
  have huNeXu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have hvNeXv : P.v.1 ≠ packet.xv := packet.xv_ne_v.symm
  have huNeV : P.u.1 ≠ P.v.1 := by
    intro h
    exact P.huNeV (Subtype.ext h)
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply Ku.center_not_mem_support
    simpa only [hcenterU, ← h] using Ku.q_mem_support
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply Ku.center_not_mem_support
    simpa only [hcenterU, ← h] using hxuURow
  have hdelNeV : P.jointDeletion.deleted.1 ≠ P.v.1 := by
    intro h
    apply Kv.center_not_mem_support
    simpa only [Hlate, hcenterV, h] using Kv.q_mem_support
  have hdelNeXv : P.jointDeletion.deleted.1 ≠ packet.xv := by
    intro h
    apply Q.hxvNotDeletedRow
    simpa only [← h] using Kdel.q_mem_support
  have hcNeDeleted : c ≠ P.jointDeletion.deleted.1 := by
    simpa only [c, Hlate] using
      centerAt_ne_source Hlate P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2
  have hcNeV : c ≠ P.v.1 := by
    intro h
    exact hcenterDeletedOffClass (by simpa only [c, Hlate, h] using P.hvClass)
  have heNeXu : e ≠ packet.xu := by
    simpa only [e] using centerAt_ne_source Hlate packet.xu Q.hxuA
  have heNeDeleted : e ≠ P.jointDeletion.deleted.1 := by
    intro h
    apply Kxu.center_not_mem_support
    simpa only [e, h] using Q.hdeletedXuRow
  have hdelNeXu : P.jointDeletion.deleted.1 ≠ packet.xu := by
    intro h
    apply Q.hxuNotDeletedRow
    simpa only [← h] using Kdel.q_mem_support
  have hcOff : c ∉ C := by
    simpa only [c, C, Hlate] using hcenterDeletedOffClass
  have hnamedInfo :=
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_namedSeven
      Q hcenterV hcenterDeletedInterior hcenterDeletedOffClass
  have hnamedCard : (insert e (insert c C)).card = 7 := by
    simpa only [blockerVSecondCapNamedSeven, Hlate, e, c, C] using hnamedInfo.2
  have heOff : e ∉ C := by
    intro heClass
    have heInsert : e ∈ insert c C := Finset.mem_insert_of_mem heClass
    have hsmall : (insert e (insert c C)).card = 6 := by
      rw [Finset.insert_eq_self.mpr heInsert,
        Finset.card_insert_of_notMem hcOff]
      have hCcard : C.card = 5 := by
        simpa only [C] using P.hclassFive
      omega
    omega
  have heNeXv : e ≠ packet.xv := by
    intro h
    exact heOff (by simpa only [h] using hxvClass)
  rcases S.capByIndex_cgn4g_strictCapBlockData_oriented D.convex S.oppIndex2 with
    ⟨B, hBorient⟩
  have hm : B.m = 9 := B.cap_card_eq.trans hcapCard
  have interiorCap {x : ℝ²} (hx : x ∈ I) : x ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hx
  rcases B.exists_index_of_mem_cap (interiorCap huInterior) with ⟨iu, hiu⟩
  rcases B.exists_index_of_mem_cap (interiorCap hvInterior) with ⟨iv, hiv⟩
  rcases B.exists_index_of_mem_cap (interiorCap hcInterior) with ⟨ic, hic⟩
  rcases B.exists_index_of_mem_cap (interiorCap hdeletedInterior) with ⟨id, hid⟩
  rcases B.exists_index_of_mem_cap (interiorCap hxvInterior) with ⟨ixv, hixv⟩
  rcases B.exists_index_of_mem_cap (interiorCap heInterior) with ⟨ie, hie⟩
  rcases B.exists_index_of_mem_cap (interiorCap hxuInterior) with ⟨ixu, hixu⟩
  have indexBounds {x : ℝ²} (hx : x ∈ I) (i : Fin B.m)
      (hi : B.L.points i = x) : 0 < i.val ∧ i.val < B.m - 1 := by
    have hfirst : i ≠ CGN.firstIndex B.Packet.hm := by
      intro hifirst
      have hxEndpoint :
          x = (S.triangleByIndex S.oppIndex2).v2 ∨
            x = (S.triangleByIndex S.oppIndex2).v3 := by
        rcases hBorient with hb | hb
        · exact Or.inl (hi.symm.trans (by simpa only [hifirst] using hb.1))
        · exact Or.inr (hi.symm.trans (by simpa only [hifirst] using hb.1))
      rcases hxEndpoint with hxEndpoint | hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v2 hx hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v3 hx hxEndpoint
    have hlast : i ≠ CGN.lastIndex B.Packet.hm := by
      intro hilast
      have hxEndpoint :
          x = (S.triangleByIndex S.oppIndex2).v2 ∨
            x = (S.triangleByIndex S.oppIndex2).v3 := by
        rcases hBorient with hb | hb
        · exact Or.inr (hi.symm.trans (by simpa only [hilast] using hb.2))
        · exact Or.inl (hi.symm.trans (by simpa only [hilast] using hb.2))
      rcases hxEndpoint with hxEndpoint | hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v2 hx hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v3 hx hxEndpoint
    have hfirstVal : i.val ≠ 0 := by
      intro hi
      apply hfirst
      apply Fin.ext
      simpa only [CGN.firstIndex_val] using hi
    have hlastVal : i.val ≠ B.m - 1 := by
      intro hi
      apply hlast
      apply Fin.ext
      simpa only [CGN.lastIndex_val] using hi
    constructor <;> omega
  have hiuBounds := indexBounds huInterior iu hiu
  have hivBounds := indexBounds hvInterior iv hiv
  have hicBounds := indexBounds hcInterior ic hic
  have hidBounds := indexBounds hdeletedInterior id hid
  have hixvBounds := indexBounds hxvInterior ixv hixv
  have hieBounds := indexBounds heInterior ie hie
  have hixuBounds := indexBounds hxuInterior ixu hixu
  have between {j r s : Fin B.m} (hjr : B.L.points j ≠ B.L.points r)
      (hjs : B.L.points j ≠ B.L.points s)
      (hrs : B.L.points r ≠ B.L.points s)
      (heq : dist (B.L.points j) (B.L.points r) =
        dist (B.L.points j) (B.L.points s)) :
      (r < j ∧ j < s) ∨ (s < j ∧ j < r) := by
    have hjrIndex : j ≠ r := by
      intro h
      exact hjr (congrArg B.L.points h)
    have hjsIndex : j ≠ s := by
      intro h
      exact hjs (congrArg B.L.points h)
    have hrsIndex : r ≠ s := by
      intro h
      exact hrs (congrArg B.L.points h)
    rcases lt_or_gt_of_ne hrsIndex with hrs | hsr
    · exact Or.inl (CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord hrs hjrIndex hjsIndex heq)
    · exact Or.inr (CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord hsr hjsIndex hjrIndex heq.symm)
  have hXv : (iu < ixv ∧ ixv < ixu) ∨ (ixu < ixv ∧ ixv < iu) :=
    between (by simpa only [hixv, hiu] using huNeXv.symm)
      (by simpa only [hixv, hixu] using hxuNeXv.symm)
      (by simpa only [hiu, hixu] using huNeXu)
      (by simpa only [hixv, hiu, hixu] using hE)
  have hV : (iu < iv ∧ iv < ixv) ∨ (ixv < iv ∧ iv < iu) :=
    between (by simpa only [hiv, hiu] using huNeV.symm)
      (by simpa only [hiv, hixv] using hvNeXv)
      (by simpa only [hiu, hixv] using huNeXv)
      (by simpa only [hiv, hiu, hixv] using hD.symm)
  have hDel : (iv < id ∧ id < ixv) ∨ (ixv < id ∧ id < iv) :=
    between (by simpa only [hid, hiv] using hdelNeV)
      (by simpa only [hid, hixv] using hdelNeXv)
      (by simpa only [hiv, hixv] using hvNeXv)
      (by simpa only [hid, hiv, hixv] using hC)
  have hCenter : (iv < ic ∧ ic < id) ∨ (id < ic ∧ ic < iv) :=
    between (by simpa only [hic, hiv] using hcNeV)
      (by simpa only [hic, hid] using hcNeDeleted)
      (by simpa only [hiv, hid] using hdelNeV.symm)
      (by simpa only [hic, hiv, hid] using hA.symm)
  have hXuCenter : (id < ie ∧ ie < ixu) ∨ (ixu < ie ∧ ie < id) :=
    between (by simpa only [hie, hid] using heNeDeleted)
      (by simpa only [hie, hixu] using heNeXu)
      (by simpa only [hid, hixu] using hdelNeXu)
      (by simpa only [hie, hid, hixu] using hB.symm)
  have hieNeIxv : ie ≠ ixv := by
    intro h
    apply heNeXv
    calc
      e = B.L.points ie := hie.symm
      _ = B.L.points ixv := congrArg B.L.points h
      _ = packet.xv := hixv
  have horders := seven_index_order_classification hm iu iv ic id ixv ie ixu
    hiuBounds.1 hiuBounds.2 hivBounds.1 hivBounds.2 hicBounds.1 hicBounds.2
    hidBounds.1 hidBounds.2 hixvBounds.1 hixvBounds.2 hieBounds.1 hieBounds.2
    hixuBounds.1 hixuBounds.2
    hieNeIxv
    hXv hV hDel hCenter hXuCenter
  have close
      (orientation : BlockerVExactSixteenFourRowCoverage.Orientation)
      (order : Fin 2) (insertion : Fin 7)
      (boundary : Fin D.A.card → ℝ²)
      (hboundaryInjective : Function.Injective boundary)
      (hboundaryImage : Finset.univ.image boundary = D.A)
      (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
      (labelIndex : Fin 16 → Fin D.A.card)
      (hposition :
        BlockerVExactSixteenFourRowCoverage.PositionEmbedding
          orientation order insertion labelIndex)
      (huPoint : boundary (labelIndex 6) = P.u.1)
      (hxuPoint : boundary (labelIndex 7) = packet.xu)
      (hvPoint : boundary (labelIndex 8) = P.v.1)
      (hxvPoint : boundary (labelIndex 9) = packet.xv)
      (hdeletedPoint :
        boundary (labelIndex 10) = P.jointDeletion.deleted.1)
      (hcPoint : boundary (labelIndex 11) = c)
      (hePoint : boundary (labelIndex 12) = e)
      (hlongPoint : ∀ point,
        BlockerVExactSixteenFourRowCoverage.longLabelBool point = true →
          boundary (labelIndex point) ∈ S.capByIndex S.oppIndex2) : False := by
    let f : Fin 16 → ℝ² := fun point => boundary (labelIndex point)
    have hlabelInjective : Function.Injective labelIndex :=
      BlockerVExactSixteenFourRowCoverage.labelIndex_injective_of_positionEmbedding
        orientation order insertion labelIndex hposition
    have hfInjective : Function.Injective f :=
      hboundaryInjective.comp hlabelInjective
    have hfImageSubset : Finset.univ.image f ⊆ D.A := by
      intro x hx
      rcases Finset.mem_image.mp hx with ⟨point, _hpoint, rfl⟩
      rw [← hboundaryImage]
      exact Finset.mem_image.mpr
        ⟨labelIndex point, Finset.mem_univ _, rfl⟩
    have hfImageCard : (Finset.univ.image f).card = 16 := by
      rw [Finset.card_image_of_injective _ hfInjective]
      simp
    have hfImage : Finset.univ.image f = D.A := by
      apply Finset.eq_of_subset_of_card_le hfImageSubset
      rw [hfImageCard, hcard]
    have hKxvCovered : Kxv.support ⊆ Finset.univ.image f := by
      rw [hfImage]
      exact Kxv.support_subset_A
    have hKuCovered : Ku.support ⊆ Finset.univ.image f := by
      rw [hfImage]
      exact Ku.support_subset_A
    have hKvCovered : Kv.support ⊆ Finset.univ.image f := by
      rw [hfImage]
      exact Kv.support_subset_A
    have hKdelCovered : Kdel.support ⊆ Finset.univ.image f := by
      rw [hfImage]
      exact Kdel.support_subset_A
    exact false_of_blockerVExactSixteen_bank_of_covered_source_rows
      Q hcenterV boundary hboundaryInjective hboundaryImage hboundaryCcw
      orientation order insertion labelIndex hposition
      (by simpa only [f, Kxv, Hlate] using hKxvCovered)
      (by simpa only [f, Ku, Hlate] using hKuCovered)
      (by simpa only [f, Kv, Hlate] using hKvCovered)
      (by simpa only [f, Kdel, Hlate] using hKdelCovered)
      hvInterior hxvInterior
      hdeletedInterior hcInterior huPoint hxuPoint hvPoint hxvPoint
      hdeletedPoint
      (by simpa only [c, Hlate] using hcPoint)
      (by simpa only [e, Hlate] using hePoint)
      hlongPoint
  have closeForward
      (order : Fin 2)
      (huPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 6).val = iu.val)
      (hxuPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 7).val = ixu.val)
      (hvPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 8).val = iv.val)
      (hxvPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 9).val = ixv.val)
      (hdeletedPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 10).val = id.val)
      (hcPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 11).val = ic.val)
      (hePos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 12).val = ie.val) :
      False := by
    let shifted : Fin B.n → ℝ² := fun point => B.phi (point + B.Block.lo)
    let boundary : Fin D.A.card → ℝ² := fun point =>
      shifted (Fin.cast B.ambient_card_eq.symm point)
    let labelIndex : Fin 16 → Fin D.A.card := fun point =>
      Fin.cast hcard.symm
        (BlockerVExactSixteenFourRowCoverage.position order 0 point)
    have hshiftedInjective : Function.Injective shifted := by
      simpa only [shifted] using
        injective_cyclicShift B.phi_injective B.Block.lo
    have hboundaryInjective : Function.Injective boundary := by
      simpa only [boundary] using
        injective_finCast_domain B.ambient_card_eq hshiftedInjective
    have hshiftedImage : Finset.univ.image shifted = D.A := by
      calc
        Finset.univ.image shifted = Finset.univ.image B.phi := by
          simpa only [shifted] using
            image_univ_cyclicShift B.phi B.Block.lo
        _ = D.A := B.Block.phi_image
    have hboundaryImage : Finset.univ.image boundary = D.A := by
      simpa only [boundary] using
        (image_univ_finCast_domain B.ambient_card_eq shifted).trans
          hshiftedImage
    have hshiftedCcw : EuclideanGeometry.IsCcwConvexPolygon shifted := by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift B.phi_injective B.phi_ccw B.Block.lo
    have hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
      simpa only [boundary] using
        ccw_finCast_domain B.ambient_card_eq hshiftedCcw
    have hposition :
        BlockerVExactSixteenFourRowCoverage.PositionEmbedding
          .forward order 0 labelIndex := by
      intro point₁ point₂ hlt
      change labelIndex point₁ < labelIndex point₂
      change
        (BlockerVExactSixteenFourRowCoverage.position order 0 point₁).val <
          (BlockerVExactSixteenFourRowCoverage.position order 0 point₂).val
      exact hlt
    have pointAt (point : Fin 16) (t : Fin B.m)
        (hpoint :
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).val =
            t.val) :
        boundary (labelIndex point) = B.L.points t := by
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm
                (BlockerVExactSixteenFourRowCoverage.position order 0 point)) =
            Fin.castLE (by have hspan := B.block_span; omega) t := by
        apply Fin.ext
        exact hpoint
      simpa only [boundary, shifted, labelIndex, hcast] using
        B.shifted_phi_cast_eq_points t
    have hlongPosition : ∀ point,
        BlockerVExactSixteenFourRowCoverage.longLabelBool point = true →
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).val < 9 := by
      fin_cases order <;> decide
    have hlongPoint : ∀ point,
        BlockerVExactSixteenFourRowCoverage.longLabelBool point = true →
          boundary (labelIndex point) ∈ S.capByIndex S.oppIndex2 := by
      intro point hlong
      have hlt := hlongPosition point hlong
      change B.phi
        (Fin.cast B.ambient_card_eq.symm
            (Fin.cast hcard.symm
              (BlockerVExactSixteenFourRowCoverage.position order 0 point)) +
          B.Block.lo) ∈ S.capByIndex S.oppIndex2
      rw [B.shifted_phi_mem_cap_iff]
      change
        (BlockerVExactSixteenFourRowCoverage.position order 0 point).val < B.m
      omega
    exact close .forward order 0 boundary hboundaryInjective hboundaryImage
      hboundaryCcw labelIndex hposition
      ((pointAt 6 iu huPos).trans hiu) ((pointAt 7 ixu hxuPos).trans hixu)
      ((pointAt 8 iv hvPos).trans hiv) ((pointAt 9 ixv hxvPos).trans hixv)
      ((pointAt 10 id hdeletedPos).trans hid) ((pointAt 11 ic hcPos).trans hic)
      ((pointAt 12 ie hePos).trans hie) hlongPoint
  have closeReverse
      (order : Fin 2)
      (huPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 6).val + iu.val = 8)
      (hxuPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 7).val + ixu.val = 8)
      (hvPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 8).val + iv.val = 8)
      (hxvPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 9).val + ixv.val = 8)
      (hdeletedPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 10).val + id.val = 8)
      (hcPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 11).val + ic.val = 8)
      (hePos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 12).val + ie.val = 8) :
      False := by
    letI : NeZero B.n := ⟨by have hspan := B.block_span; omega⟩
    let cut : Fin B.n := ⟨(B.Block.hi.val + 1) % B.n,
      Nat.mod_lt _ (by have := B.Block.hi.isLt; omega)⟩
    let shifted : Fin B.n → ℝ² := fun point => B.phi (point + cut)
    let boundary : Fin D.A.card → ℝ² := fun point =>
      shifted (Fin.cast B.ambient_card_eq.symm point)
    let labelIndex : Fin 16 → Fin D.A.card := fun point =>
      Fin.cast hcard.symm
        (Fin.rev (BlockerVExactSixteenFourRowCoverage.position order 0 point))
    have hshiftedInjective : Function.Injective shifted := by
      simpa only [shifted] using injective_cyclicShift B.phi_injective cut
    have hboundaryInjective : Function.Injective boundary := by
      simpa only [boundary] using
        injective_finCast_domain B.ambient_card_eq hshiftedInjective
    have hshiftedImage : Finset.univ.image shifted = D.A := by
      calc
        Finset.univ.image shifted = Finset.univ.image B.phi := by
          simpa only [shifted] using image_univ_cyclicShift B.phi cut
        _ = D.A := B.Block.phi_image
    have hboundaryImage : Finset.univ.image boundary = D.A := by
      simpa only [boundary] using
        (image_univ_finCast_domain B.ambient_card_eq shifted).trans
          hshiftedImage
    have hshiftedCcw : EuclideanGeometry.IsCcwConvexPolygon shifted := by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift B.phi_injective B.phi_ccw cut
    have hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
      simpa only [boundary] using
        ccw_finCast_domain B.ambient_card_eq hshiftedCcw
    have hposition :
        BlockerVExactSixteenFourRowCoverage.PositionEmbedding
          .reverse order 0 labelIndex := by
      intro point₁ point₂ hlt
      change labelIndex point₂ < labelIndex point₁
      change
        (Fin.rev
            (BlockerVExactSixteenFourRowCoverage.position order 0 point₂)).val <
          (Fin.rev
            (BlockerVExactSixteenFourRowCoverage.position order 0 point₁)).val
      rw [Fin.val_rev, Fin.val_rev]
      omega
    have pointAt (point : Fin 16) (t : Fin B.m)
        (hpoint :
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).val +
              t.val = 8) :
        boundary (labelIndex point) = B.L.points t := by
      let offset : Fin B.n := ⟨B.n - B.m + t.val, by
        have hspan := B.block_span
        have hmpos := B.Block.hm
        omega⟩
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm
                (Fin.rev
                  (BlockerVExactSixteenFourRowCoverage.position order 0 point))) =
            offset := by
        apply Fin.ext
        simp only [Fin.val_cast, Fin.val_rev]
        dsimp only [offset]
        have hn : B.n = 16 := B.ambient_card_eq.trans hcard
        omega
      simpa only [boundary, shifted, labelIndex, cut, hcast, offset] using
        B.shifted_after_block_phi_cast_eq_points t
    have hlongPosition : ∀ point,
        BlockerVExactSixteenFourRowCoverage.longLabelBool point = true →
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).val < 9 := by
      fin_cases order <;> decide
    have hlongPoint : ∀ point,
        BlockerVExactSixteenFourRowCoverage.longLabelBool point = true →
          boundary (labelIndex point) ∈ S.capByIndex S.oppIndex2 := by
      intro point hlong
      have hlt := hlongPosition point hlong
      let t : Fin B.m := ⟨B.m - 1 -
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).val, by
        omega⟩
      have hsum :
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).val +
              t.val = 8 := by
        change
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).val +
              (B.m - 1 -
                (BlockerVExactSixteenFourRowCoverage.position order 0 point).val) = 8
        omega
      exact (pointAt point t hsum) ▸ B.points_mem_cap t
    exact close .reverse order 0 boundary hboundaryInjective hboundaryImage
      hboundaryCcw labelIndex hposition
      ((pointAt 6 iu huPos).trans hiu) ((pointAt 7 ixu hxuPos).trans hixu)
      ((pointAt 8 iv hvPos).trans hiv) ((pointAt 9 ixv hxvPos).trans hixv)
      ((pointAt 10 id hdeletedPos).trans hid) ((pointAt 11 ic hcPos).trans hic)
      ((pointAt 12 ie hePos).trans hie) hlongPoint
  rcases horders with horder | horder | horder | horder
  · exact closeForward 0 (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
  · exact closeForward 1 (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
  · exact closeReverse 0 (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
  · exact closeReverse 1 (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)

/-- Exact-sixteen child with cap profile `(5,4,10)`.  The second strict cap
has eight points: the seven named points plus one extra point.  Every source
row already has two named hits in that cap and at most two cap hits, so the
extra point lies on none of the four rows.  Skipping it embeds those complete
rows in the exact-fifteen certificate bank. -/
theorem
    false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_eq_sixteen_secondCapTen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (hcenterDeletedInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (hcenterDeletedOffClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∉
        SelectedClass D.A S.oppApex2 P.rho)
    (hcard : D.A.card = 16)
    (hcapCard : (S.capByIndex S.oppIndex2).card = 10) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ku := (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  let Kv := (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
  let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let Kdel :=
    (Hlate.selectedAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2).toCriticalFourShell
  let Kxu := (Hlate.selectedAt packet.xu Q.hxuA).toCriticalFourShell
  let C := SelectedClass D.A S.oppApex2 P.rho
  let I := S.capInteriorByIndex S.oppIndex2
  let c :=
    Hlate.centerAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2
  let e := Hlate.centerAt packet.xu Q.hxuA
  have hnamedInfo :=
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_namedSeven
      Q hcenterV hcenterDeletedInterior hcenterDeletedOffClass
  have hnamedSubset : insert e (insert c C) ⊆ I := by
    simpa only [blockerVSecondCapNamedSeven, Hlate, e, c, C, I] using
      hnamedInfo.1
  have hnamedCard : (insert e (insert c C)).card = 7 := by
    simpa only [blockerVSecondCapNamedSeven, Hlate, e, c, C] using
      hnamedInfo.2
  have hxuInter : packet.xu ∈ Ku.support ∩ C := by
    simpa only [Ku, C, Hlate] using (show
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
      rw [packet.source_row_trace]
      simp)
  have hxuURow : packet.xu ∈ Ku.support := (Finset.mem_inter.mp hxuInter).1
  have hxuClass : packet.xu ∈ C := (Finset.mem_inter.mp hxuInter).2
  have hxvInter : packet.xv ∈ Kv.support ∩ C := by
    simpa only [C] using (show
      packet.xv ∈ Kv.support ∩ SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.opposite_row_trace]
        simp)
  have hxvVRow : packet.xv ∈ Kv.support := (Finset.mem_inter.mp hxvInter).1
  have hxvClass : packet.xv ∈ C := (Finset.mem_inter.mp hxvInter).2
  have hcenterU : Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [Hlate, P.huSource] using packet.blocker_eq_xv
  have hE : dist packet.xv P.u.1 = dist packet.xv packet.xu := by
    rw [← hcenterU]
    exact (Ku.support_eq_radius _ Ku.q_mem_support).trans
      (Ku.support_eq_radius _ hxuURow).symm
  have hD : dist P.v.1 packet.xv = dist P.v.1 P.u.1 := by
    rw [← Q.hblockerEqV]
    exact (Kxv.support_eq_radius _ Kxv.q_mem_support).trans
      (Kxv.support_eq_radius _ Q.huXvRow).symm
  have hC :
      dist P.jointDeletion.deleted.1 P.v.1 =
        dist P.jointDeletion.deleted.1 packet.xv := by
    have hraw :=
      (Kv.support_eq_radius _ Kv.q_mem_support).trans
        (Kv.support_eq_radius _ hxvVRow).symm
    simpa only [Hlate, hcenterV] using hraw
  have hB : dist e packet.xu = dist e P.jointDeletion.deleted.1 := by
    simpa only [e, Kxu] using
      (Kxu.support_eq_radius _ Kxu.q_mem_support).trans
        (Kxu.support_eq_radius _ Q.hdeletedXuRow).symm
  have hA : dist c P.jointDeletion.deleted.1 = dist c P.v.1 := by
    simpa only [c, Kdel] using
      (Kdel.support_eq_radius _ Kdel.q_mem_support).trans
        (Kdel.support_eq_radius _ Q.hvDeletedRow).symm
  have hclassInterior : C ⊆ I := by
    intro x hx
    exact hnamedSubset (by simp [hx])
  have heInterior : e ∈ I := hnamedSubset (by simp)
  have hcInterior : c ∈ I := hnamedSubset (by simp)
  have huInterior : P.u.1 ∈ I := hclassInterior P.huClass
  have hxuInterior : packet.xu ∈ I := hclassInterior hxuClass
  have hvInterior : P.v.1 ∈ I := hclassInterior P.hvClass
  have hxvInterior : packet.xv ∈ I := hclassInterior hxvClass
  have hdeletedInterior : P.jointDeletion.deleted.1 ∈ I :=
    hclassInterior P.jointDeletion.deleted_mem_class
  have huNeXu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have hvNeXv : P.v.1 ≠ packet.xv := packet.xv_ne_v.symm
  have huNeV : P.u.1 ≠ P.v.1 := by
    intro h
    exact P.huNeV (Subtype.ext h)
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply Ku.center_not_mem_support
    simpa only [hcenterU, ← h] using Ku.q_mem_support
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply Ku.center_not_mem_support
    simpa only [hcenterU, ← h] using hxuURow
  have hdelNeV : P.jointDeletion.deleted.1 ≠ P.v.1 := by
    intro h
    apply Kv.center_not_mem_support
    simpa only [Hlate, hcenterV, h] using Kv.q_mem_support
  have hdelNeXv : P.jointDeletion.deleted.1 ≠ packet.xv := by
    intro h
    apply Q.hxvNotDeletedRow
    simpa only [← h] using Kdel.q_mem_support
  have hcNeDeleted : c ≠ P.jointDeletion.deleted.1 := by
    simpa only [c, Hlate] using
      centerAt_ne_source Hlate P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2
  have hcNeV : c ≠ P.v.1 := by
    intro h
    exact hcenterDeletedOffClass (by simpa only [c, Hlate, h] using P.hvClass)
  have heNeXu : e ≠ packet.xu := by
    simpa only [e] using centerAt_ne_source Hlate packet.xu Q.hxuA
  have heNeDeleted : e ≠ P.jointDeletion.deleted.1 := by
    intro h
    apply Kxu.center_not_mem_support
    simpa only [e, h] using Q.hdeletedXuRow
  have hdelNeXu : P.jointDeletion.deleted.1 ≠ packet.xu := by
    intro h
    apply Q.hxuNotDeletedRow
    simpa only [← h] using Kdel.q_mem_support
  have hcOff : c ∉ C := by
    simpa only [c, C, Hlate] using hcenterDeletedOffClass
  have heOff : e ∉ C := by
    intro heClass
    have heInsert : e ∈ insert c C := Finset.mem_insert_of_mem heClass
    have hsmall : (insert e (insert c C)).card = 6 := by
      rw [Finset.insert_eq_self.mpr heInsert,
        Finset.card_insert_of_notMem hcOff]
      have hCcard : C.card = 5 := by
        simpa only [C] using P.hclassFive
      omega
    omega
  have heNeXv : e ≠ packet.xv := by
    intro h
    exact heOff (by simpa only [h] using hxvClass)
  rcases S.capByIndex_cgn4g_strictCapBlockData_oriented D.convex S.oppIndex2 with
    ⟨B, hBorient⟩
  have hm : B.m = 10 := B.cap_card_eq.trans hcapCard
  have interiorCap {x : ℝ²} (hx : x ∈ I) : x ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hx
  rcases B.exists_index_of_mem_cap (interiorCap huInterior) with ⟨iu, hiu⟩
  rcases B.exists_index_of_mem_cap (interiorCap hvInterior) with ⟨iv, hiv⟩
  rcases B.exists_index_of_mem_cap (interiorCap hcInterior) with ⟨ic, hic⟩
  rcases B.exists_index_of_mem_cap (interiorCap hdeletedInterior) with ⟨id, hid⟩
  rcases B.exists_index_of_mem_cap (interiorCap hxvInterior) with ⟨ixv, hixv⟩
  rcases B.exists_index_of_mem_cap (interiorCap heInterior) with ⟨ie, hie⟩
  rcases B.exists_index_of_mem_cap (interiorCap hxuInterior) with ⟨ixu, hixu⟩
  have indexBounds {x : ℝ²} (hx : x ∈ I) (i : Fin B.m)
      (hi : B.L.points i = x) : 0 < i.val ∧ i.val < B.m - 1 := by
    have hfirst : i ≠ CGN.firstIndex B.Packet.hm := by
      intro hifirst
      have hxEndpoint :
          x = (S.triangleByIndex S.oppIndex2).v2 ∨
            x = (S.triangleByIndex S.oppIndex2).v3 := by
        rcases hBorient with hb | hb
        · exact Or.inl (hi.symm.trans (by simpa only [hifirst] using hb.1))
        · exact Or.inr (hi.symm.trans (by simpa only [hifirst] using hb.1))
      rcases hxEndpoint with hxEndpoint | hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v2 hx hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v3 hx hxEndpoint
    have hlast : i ≠ CGN.lastIndex B.Packet.hm := by
      intro hilast
      have hxEndpoint :
          x = (S.triangleByIndex S.oppIndex2).v2 ∨
            x = (S.triangleByIndex S.oppIndex2).v3 := by
        rcases hBorient with hb | hb
        · exact Or.inr (hi.symm.trans (by simpa only [hilast] using hb.2))
        · exact Or.inl (hi.symm.trans (by simpa only [hilast] using hb.2))
      rcases hxEndpoint with hxEndpoint | hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v2 hx hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v3 hx hxEndpoint
    have hfirstVal : i.val ≠ 0 := by
      intro hi
      apply hfirst
      apply Fin.ext
      simpa only [CGN.firstIndex_val] using hi
    have hlastVal : i.val ≠ B.m - 1 := by
      intro hi
      apply hlast
      apply Fin.ext
      simpa only [CGN.lastIndex_val] using hi
    constructor <;> omega
  have hiuBounds := indexBounds huInterior iu hiu
  have hivBounds := indexBounds hvInterior iv hiv
  have hicBounds := indexBounds hcInterior ic hic
  have hidBounds := indexBounds hdeletedInterior id hid
  have hixvBounds := indexBounds hxvInterior ixv hixv
  have hieBounds := indexBounds heInterior ie hie
  have hixuBounds := indexBounds hxuInterior ixu hixu
  have between {j r s : Fin B.m} (hjr : B.L.points j ≠ B.L.points r)
      (hjs : B.L.points j ≠ B.L.points s)
      (hrs : B.L.points r ≠ B.L.points s)
      (heq : dist (B.L.points j) (B.L.points r) =
        dist (B.L.points j) (B.L.points s)) :
      (r < j ∧ j < s) ∨ (s < j ∧ j < r) := by
    have hjrIndex : j ≠ r := by
      intro h
      exact hjr (congrArg B.L.points h)
    have hjsIndex : j ≠ s := by
      intro h
      exact hjs (congrArg B.L.points h)
    have hrsIndex : r ≠ s := by
      intro h
      exact hrs (congrArg B.L.points h)
    rcases lt_or_gt_of_ne hrsIndex with hrs | hsr
    · exact Or.inl (CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord hrs hjrIndex hjsIndex heq)
    · exact Or.inr (CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord hsr hjsIndex hjrIndex heq.symm)
  have hXv : (iu < ixv ∧ ixv < ixu) ∨ (ixu < ixv ∧ ixv < iu) :=
    between (by simpa only [hixv, hiu] using huNeXv.symm)
      (by simpa only [hixv, hixu] using hxuNeXv.symm)
      (by simpa only [hiu, hixu] using huNeXu)
      (by simpa only [hixv, hiu, hixu] using hE)
  have hV : (iu < iv ∧ iv < ixv) ∨ (ixv < iv ∧ iv < iu) :=
    between (by simpa only [hiv, hiu] using huNeV.symm)
      (by simpa only [hiv, hixv] using hvNeXv)
      (by simpa only [hiu, hixv] using huNeXv)
      (by simpa only [hiv, hiu, hixv] using hD.symm)
  have hDel : (iv < id ∧ id < ixv) ∨ (ixv < id ∧ id < iv) :=
    between (by simpa only [hid, hiv] using hdelNeV)
      (by simpa only [hid, hixv] using hdelNeXv)
      (by simpa only [hiv, hixv] using hvNeXv)
      (by simpa only [hid, hiv, hixv] using hC)
  have hCenter : (iv < ic ∧ ic < id) ∨ (id < ic ∧ ic < iv) :=
    between (by simpa only [hic, hiv] using hcNeV)
      (by simpa only [hic, hid] using hcNeDeleted)
      (by simpa only [hiv, hid] using hdelNeV.symm)
      (by simpa only [hic, hiv, hid] using hA.symm)
  have hXuCenter : (id < ie ∧ ie < ixu) ∨ (ixu < ie ∧ ie < id) :=
    between (by simpa only [hie, hid] using heNeDeleted)
      (by simpa only [hie, hixu] using heNeXu)
      (by simpa only [hid, hixu] using hdelNeXu)
      (by simpa only [hie, hid, hixu] using hB.symm)
  have hieNeIxv : ie ≠ ixv := by
    intro h
    apply heNeXv
    calc
      e = B.L.points ie := hie.symm
      _ = B.L.points ixv := congrArg B.L.points h
      _ = packet.xv := hixv
  have horders := seven_index_order_classification_ten_of_eq hm
    iu iv ic id ixv ie ixu
    hiuBounds.1 hiuBounds.2 hivBounds.1 hivBounds.2 hicBounds.1 hicBounds.2
    hidBounds.1 hidBounds.2 hixvBounds.1 hixvBounds.2 hieBounds.1 hieBounds.2
    hixuBounds.1 hixuBounds.2 hieNeIxv hXv hV hDel hCenter hXuCenter
  have hKxvCap :
      (Kxv.support ∩ S.capByIndex S.oppIndex2).card ≤ 2 :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.oppIndex2 Kxv.toSelectedFourClass
      (by simpa only [Hlate, Q.hblockerEqV] using interiorCap hvInterior)
  have hKuCap :
      (Ku.support ∩ S.capByIndex S.oppIndex2).card ≤ 2 :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.oppIndex2 Ku.toSelectedFourClass
      (by simpa only [Hlate, hcenterU] using interiorCap hxvInterior)
  have hKvCap :
      (Kv.support ∩ S.capByIndex S.oppIndex2).card ≤ 2 :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.oppIndex2 Kv.toSelectedFourClass
      (by simpa only [Hlate, hcenterV] using interiorCap hdeletedInterior)
  have hKdelCap :
      (Kdel.support ∩ S.capByIndex S.oppIndex2).card ≤ 2 :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.oppIndex2 Kdel.toSelectedFourClass
      (by simpa only [Hlate, c] using interiorCap hcInterior)
  have closeForward
      (order : Fin 2) (gap : Fin 10)
      (ju jv jc jd jxv je jxu : Fin 9)
      (huGap : Fin.cast hm iu = gap.succAbove ju)
      (hvGap : Fin.cast hm iv = gap.succAbove jv)
      (hcGap : Fin.cast hm ic = gap.succAbove jc)
      (hdGap : Fin.cast hm id = gap.succAbove jd)
      (hxvGap : Fin.cast hm ixv = gap.succAbove jxv)
      (heGap : Fin.cast hm ie = gap.succAbove je)
      (hxuGap : Fin.cast hm ixu = gap.succAbove jxu)
      (huPos :
        (BlockerVExactFifteenFourRowCoverage.position order 6).val = ju.val)
      (hvPos :
        (BlockerVExactFifteenFourRowCoverage.position order 8).val = jv.val)
      (hcPos :
        (BlockerVExactFifteenFourRowCoverage.position order 11).val = jc.val)
      (hdPos :
        (BlockerVExactFifteenFourRowCoverage.position order 10).val = jd.val)
      (hxvPos :
        (BlockerVExactFifteenFourRowCoverage.position order 9).val = jxv.val)
      (hePos :
        (BlockerVExactFifteenFourRowCoverage.position order 12).val = je.val)
      (hxuPos :
        (BlockerVExactFifteenFourRowCoverage.position order 7).val = jxu.val) :
      False := by
    let shifted : Fin B.n → ℝ² := fun point => B.phi (point + B.Block.lo)
    let boundary : Fin D.A.card → ℝ² := fun point =>
      shifted (Fin.cast B.ambient_card_eq.symm point)
    let gap16 : Fin 16 := Fin.castLE (by omega) gap
    let boundary16 : Fin 16 → ℝ² := fun point =>
      boundary (Fin.cast hcard.symm point)
    let labelIndex : Fin 15 → Fin D.A.card := fun point =>
      Fin.cast hcard.symm
        (gap16.succAbove
          (BlockerVExactFifteenFourRowCoverage.position order point))
    have hshiftedInjective : Function.Injective shifted := by
      simpa only [shifted] using
        injective_cyclicShift B.phi_injective B.Block.lo
    have hboundaryInjective : Function.Injective boundary := by
      simpa only [boundary] using
        injective_finCast_domain B.ambient_card_eq hshiftedInjective
    have hboundary16Injective : Function.Injective boundary16 := by
      intro x y hxy
      apply Fin.cast_injective hcard.symm
      exact hboundaryInjective hxy
    have hshiftedImage : Finset.univ.image shifted = D.A := by
      calc
        Finset.univ.image shifted = Finset.univ.image B.phi := by
          simpa only [shifted] using
            image_univ_cyclicShift B.phi B.Block.lo
        _ = D.A := B.Block.phi_image
    have hboundaryImage : Finset.univ.image boundary = D.A := by
      simpa only [boundary] using
        (image_univ_finCast_domain B.ambient_card_eq shifted).trans
          hshiftedImage
    have hboundary16Image : Finset.univ.image boundary16 = D.A := by
      simpa only [boundary16] using
        (image_univ_finCast_domain hcard boundary).trans hboundaryImage
    have hshiftedCcw : EuclideanGeometry.IsCcwConvexPolygon shifted := by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift B.phi_injective B.phi_ccw B.Block.lo
    have hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
      simpa only [boundary] using
        ccw_finCast_domain B.ambient_card_eq hshiftedCcw
    have hposition :
        BlockerVExactFifteenFourRowCoverage.PositionEmbedding
          .forward order labelIndex := by
      simpa only [labelIndex, Fin.val_cast] using
        skip_position_embedding_forward gap16 order
    have pointAt (point : Fin 15) (t : Fin B.m) (j : Fin 9)
        (hpoint :
          (BlockerVExactFifteenFourRowCoverage.position order point).val = j.val)
        (ht : Fin.cast hm t = gap.succAbove j) :
        boundary (labelIndex point) = B.L.points t := by
      have hskip := gapTen_castLE_succAbove_val gap
        (BlockerVExactFifteenFourRowCoverage.position order point) j hpoint
      have htVal : t.val = (gap.succAbove j).val := by
        simpa only [Fin.val_cast] using congrArg Fin.val ht
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm
                (gap16.succAbove
                  (BlockerVExactFifteenFourRowCoverage.position order point))) =
            Fin.castLE (by have hspan := B.block_span; omega) t := by
        apply Fin.ext
        simpa only [Fin.val_cast, Fin.val_castLE, gap16] using
          (show
            (gap16.succAbove
                (BlockerVExactFifteenFourRowCoverage.position order point)).val =
              t.val from hskip.trans htVal.symm)
      simpa only [boundary, shifted, labelIndex, hcast] using
        B.shifted_phi_cast_eq_points t
    let gapB : Fin B.m := Fin.cast hm.symm gap
    have hgapPoint : boundary16 gap16 = B.L.points gapB := by
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm gap16) =
            Fin.castLE (by have hspan := B.block_span; omega) gapB := by
        apply Fin.ext
        simp only [Fin.val_cast, Fin.val_castLE, gap16, gapB]
      simpa only [boundary16, boundary, shifted, hcast] using
        B.shifted_phi_cast_eq_points gapB
    have hgapCap : boundary16 gap16 ∈ S.capByIndex S.oppIndex2 := by
      rw [hgapPoint]
      exact B.points_mem_cap gapB
    have hgapNeLabel (point : Fin 15) :
        boundary16 gap16 ≠ boundary (labelIndex point) := by
      intro h
      have hindex := hboundary16Injective (by
        simpa only [boundary16, labelIndex] using h)
      exact (gap16.succAbove_ne
        (BlockerVExactFifteenFourRowCoverage.position order point)) hindex.symm
    have huPoint := (pointAt 6 iu ju huPos huGap).trans hiu
    have hvPoint := (pointAt 8 iv jv hvPos hvGap).trans hiv
    have hcPoint := (pointAt 11 ic jc hcPos hcGap).trans hic
    have hdeletedPoint := (pointAt 10 id jd hdPos hdGap).trans hid
    have hxvPoint := (pointAt 9 ixv jxv hxvPos hxvGap).trans hixv
    have hePoint := (pointAt 12 ie je hePos heGap).trans hie
    have hxuPoint := (pointAt 7 ixu jxu hxuPos hxuGap).trans hixu
    have hgapNeU : boundary16 gap16 ≠ P.u.1 := by
      intro h
      exact hgapNeLabel 6 (h.trans huPoint.symm)
    have hgapNeV : boundary16 gap16 ≠ P.v.1 := by
      intro h
      exact hgapNeLabel 8 (h.trans hvPoint.symm)
    have hgapNeDeleted :
        boundary16 gap16 ≠ P.jointDeletion.deleted.1 := by
      intro h
      exact hgapNeLabel 10 (h.trans hdeletedPoint.symm)
    have hgapNeXv : boundary16 gap16 ≠ packet.xv := by
      intro h
      exact hgapNeLabel 9 (h.trans hxvPoint.symm)
    have hgapNeXu : boundary16 gap16 ≠ packet.xu := by
      intro h
      exact hgapNeLabel 7 (h.trans hxuPoint.symm)
    have hgapNotKxv : boundary16 gap16 ∉ Kxv.support :=
      not_mem_of_inter_card_le_two_of_three_cap_points
        hgapCap (interiorCap huInterior) (interiorCap hxvInterior)
        Q.huXvRow Kxv.q_mem_support hgapNeU hgapNeXv huNeXv hKxvCap
    have hgapNotKu : boundary16 gap16 ∉ Ku.support :=
      not_mem_of_inter_card_le_two_of_three_cap_points
        hgapCap (interiorCap huInterior) (interiorCap hxuInterior)
        Ku.q_mem_support hxuURow hgapNeU hgapNeXu huNeXu hKuCap
    have hgapNotKv : boundary16 gap16 ∉ Kv.support :=
      not_mem_of_inter_card_le_two_of_three_cap_points
        hgapCap (interiorCap hvInterior) (interiorCap hxvInterior)
        Kv.q_mem_support hxvVRow hgapNeV hgapNeXv hvNeXv hKvCap
    have hgapNotKdel : boundary16 gap16 ∉ Kdel.support :=
      not_mem_of_inter_card_le_two_of_three_cap_points
        hgapCap (interiorCap hdeletedInterior) (interiorCap hvInterior)
        Kdel.q_mem_support Q.hvDeletedRow hgapNeDeleted hgapNeV
        hdelNeV hKdelCap
    have hpositionSurjective : Function.Surjective
        (BlockerVExactFifteenFourRowCoverage.position order) :=
      Finite.injective_iff_surjective.mp
        (BlockerVExactFifteenFourRowCoverage.position_injective order)
    have hKxvCovered :
        Kxv.support ⊆ Finset.univ.image
          (fun point : Fin 15 => boundary (labelIndex point)) := by
      change Kxv.support ⊆ Finset.univ.image
        (fun point : Fin 15 => boundary16
          (gap16.succAbove
            (BlockerVExactFifteenFourRowCoverage.position order point)))
      exact support_subset_image_skip_reindex hboundary16Image
        Kxv.support_subset_A gap16 hgapNotKxv _ hpositionSurjective
    have hKuCovered :
        Ku.support ⊆ Finset.univ.image
          (fun point : Fin 15 => boundary (labelIndex point)) := by
      change Ku.support ⊆ Finset.univ.image
        (fun point : Fin 15 => boundary16
          (gap16.succAbove
            (BlockerVExactFifteenFourRowCoverage.position order point)))
      exact support_subset_image_skip_reindex hboundary16Image
        Ku.support_subset_A gap16 hgapNotKu _ hpositionSurjective
    have hKvCovered :
        Kv.support ⊆ Finset.univ.image
          (fun point : Fin 15 => boundary (labelIndex point)) := by
      change Kv.support ⊆ Finset.univ.image
        (fun point : Fin 15 => boundary16
          (gap16.succAbove
            (BlockerVExactFifteenFourRowCoverage.position order point)))
      exact support_subset_image_skip_reindex hboundary16Image
        Kv.support_subset_A gap16 hgapNotKv _ hpositionSurjective
    have hKdelCovered :
        Kdel.support ⊆ Finset.univ.image
          (fun point : Fin 15 => boundary (labelIndex point)) := by
      change Kdel.support ⊆ Finset.univ.image
        (fun point : Fin 15 => boundary16
          (gap16.succAbove
            (BlockerVExactFifteenFourRowCoverage.position order point)))
      exact support_subset_image_skip_reindex hboundary16Image
        Kdel.support_subset_A gap16 hgapNotKdel _ hpositionSurjective
    have hlongPosition : ∀ point,
        BlockerVExactFifteenFourRowCoverage.longLabelBool point = true →
          (BlockerVExactFifteenFourRowCoverage.position order point).val < 9 := by
      fin_cases order <;> decide
    have hlongPoint : ∀ point,
        BlockerVExactFifteenFourRowCoverage.longLabelBool point = true →
          boundary (labelIndex point) ∈ S.capByIndex S.oppIndex2 := by
      intro point hlong
      have hlt := hlongPosition point hlong
      change B.phi
        (Fin.cast B.ambient_card_eq.symm
            (Fin.cast hcard.symm
              (gap16.succAbove
                (BlockerVExactFifteenFourRowCoverage.position order point))) +
          B.Block.lo) ∈ S.capByIndex S.oppIndex2
      rw [B.shifted_phi_mem_cap_iff]
      change
        (gap16.succAbove
          (BlockerVExactFifteenFourRowCoverage.position order point)).val < B.m
      have hgapLt : gap.val < 10 := gap.isLt
      simp only [gap16]
      by_cases hp :
          (BlockerVExactFifteenFourRowCoverage.position order point).castSucc <
            Fin.castLE (by omega) gap
      · rw [Fin.succAbove_of_castSucc_lt _ _ hp]
        simp only [Fin.val_castSucc]
        omega
      · rw [Fin.succAbove_of_le_castSucc _ _ (le_of_not_gt hp)]
        simp only [Fin.val_succ]
        omega
    exact false_of_blockerVExactFifteen_bank_of_covered_source_rows
      Q hcenterV boundary hboundaryInjective hboundaryImage hboundaryCcw
      .forward order labelIndex hposition hKxvCovered hKuCovered hKvCovered
      hKdelCovered hvInterior hxvInterior hdeletedInterior hcInterior
      huPoint hxuPoint hvPoint hxvPoint hdeletedPoint hcPoint hePoint hlongPoint
  have closeReverse
      (order : Fin 2) (gap : Fin 10)
      (ju jv jc jd jxv je jxu : Fin 9)
      (huGap : Fin.cast hm iu = gap.succAbove ju)
      (hvGap : Fin.cast hm iv = gap.succAbove jv)
      (hcGap : Fin.cast hm ic = gap.succAbove jc)
      (hdGap : Fin.cast hm id = gap.succAbove jd)
      (hxvGap : Fin.cast hm ixv = gap.succAbove jxv)
      (heGap : Fin.cast hm ie = gap.succAbove je)
      (hxuGap : Fin.cast hm ixu = gap.succAbove jxu)
      (huPos :
        (BlockerVExactFifteenFourRowCoverage.position order 6).val + ju.val = 8)
      (hvPos :
        (BlockerVExactFifteenFourRowCoverage.position order 8).val + jv.val = 8)
      (hcPos :
        (BlockerVExactFifteenFourRowCoverage.position order 11).val + jc.val = 8)
      (hdPos :
        (BlockerVExactFifteenFourRowCoverage.position order 10).val + jd.val = 8)
      (hxvPos :
        (BlockerVExactFifteenFourRowCoverage.position order 9).val + jxv.val = 8)
      (hePos :
        (BlockerVExactFifteenFourRowCoverage.position order 12).val + je.val = 8)
      (hxuPos :
        (BlockerVExactFifteenFourRowCoverage.position order 7).val + jxu.val = 8) :
      False := by
    letI : NeZero B.n := ⟨by have hspan := B.block_span; omega⟩
    let cut : Fin B.n := ⟨(B.Block.hi.val + 1) % B.n,
      Nat.mod_lt _ (by have := B.Block.hi.isLt; omega)⟩
    let shifted : Fin B.n → ℝ² := fun point => B.phi (point + cut)
    let boundary : Fin D.A.card → ℝ² := fun point =>
      shifted (Fin.cast B.ambient_card_eq.symm point)
    let boundary16 : Fin 16 → ℝ² := fun point =>
      boundary (Fin.cast hcard.symm point)
    let gapR : Fin 10 := reverseGapTen gap
    let gap16 : Fin 16 := Fin.castLE (by omega) gapR
    let hole16 : Fin 16 := Fin.rev gap16
    let labelIndex : Fin 15 → Fin D.A.card := fun point =>
      Fin.cast hcard.symm
        (Fin.rev
          (gap16.succAbove
            (BlockerVExactFifteenFourRowCoverage.position order point)))
    have hshiftedInjective : Function.Injective shifted := by
      simpa only [shifted] using injective_cyclicShift B.phi_injective cut
    have hboundaryInjective : Function.Injective boundary := by
      simpa only [boundary] using
        injective_finCast_domain B.ambient_card_eq hshiftedInjective
    have hboundary16Injective : Function.Injective boundary16 := by
      intro x y hxy
      apply Fin.cast_injective hcard.symm
      exact hboundaryInjective hxy
    have hshiftedImage : Finset.univ.image shifted = D.A := by
      calc
        Finset.univ.image shifted = Finset.univ.image B.phi := by
          simpa only [shifted] using image_univ_cyclicShift B.phi cut
        _ = D.A := B.Block.phi_image
    have hboundaryImage : Finset.univ.image boundary = D.A := by
      simpa only [boundary] using
        (image_univ_finCast_domain B.ambient_card_eq shifted).trans
          hshiftedImage
    have hboundary16Image : Finset.univ.image boundary16 = D.A := by
      simpa only [boundary16] using
        (image_univ_finCast_domain hcard boundary).trans hboundaryImage
    have hshiftedCcw : EuclideanGeometry.IsCcwConvexPolygon shifted := by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift B.phi_injective B.phi_ccw cut
    have hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
      simpa only [boundary] using
        ccw_finCast_domain B.ambient_card_eq hshiftedCcw
    have hposition :
        BlockerVExactFifteenFourRowCoverage.PositionEmbedding
          .reverse order labelIndex := by
      simpa only [labelIndex, Fin.val_cast] using
        skip_position_embedding_reverse gap16 order
    have pointAt (point : Fin 15) (t : Fin B.m) (j : Fin 9)
        (hsum :
          (BlockerVExactFifteenFourRowCoverage.position order point).val +
            j.val = 8)
        (ht : Fin.cast hm t = gap.succAbove j) :
        boundary (labelIndex point) = B.L.points t := by
      have htVal : t.val = (gap.succAbove j).val := by
        simpa only [Fin.val_cast] using congrArg Fin.val ht
      have hsum9 :
          (gap16.succAbove
              (BlockerVExactFifteenFourRowCoverage.position order point)).val +
            t.val = 9 := by
        have hrev := reverseGapTen_castLE_succAbove_sum gap
          (BlockerVExactFifteenFourRowCoverage.position order point) j hsum
        simpa only [gap16, htVal] using hrev
      let offset : Fin B.n := ⟨B.n - B.m + t.val, by
        have hspan := B.block_span
        have hmpos := B.Block.hm
        omega⟩
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm
                (Fin.rev
                  (gap16.succAbove
                    (BlockerVExactFifteenFourRowCoverage.position order point)))) =
            offset := by
        apply Fin.ext
        simp only [Fin.val_cast, Fin.val_rev]
        dsimp only [offset]
        have hn : B.n = 16 := B.ambient_card_eq.trans hcard
        omega
      simpa only [boundary, shifted, labelIndex, cut, hcast, offset] using
        B.shifted_after_block_phi_cast_eq_points t
    let gapB : Fin B.m := Fin.cast hm.symm gap
    have hgapPoint : boundary16 hole16 = B.L.points gapB := by
      have hgapBVal : gapB.val = gap.val := by
        simp only [gapB, Fin.val_cast]
      have hgap16Val : gap16.val = 9 - gap.val := by
        simp only [gap16, Fin.val_castLE, gapR, reverseGapTen]
      let offset : Fin B.n := ⟨B.n - B.m + gapB.val, by
        have hspan := B.block_span
        have hmpos := B.Block.hm
        omega⟩
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm hole16) = offset := by
        apply Fin.ext
        simp only [Fin.val_cast, hole16, Fin.val_rev]
        dsimp only [offset]
        have hn : B.n = 16 := B.ambient_card_eq.trans hcard
        rw [hgap16Val, hgapBVal, hn, hm]
        omega
      simpa only [boundary16, boundary, shifted, hole16, cut, hcast, offset] using
        B.shifted_after_block_phi_cast_eq_points gapB
    have hgapCap : boundary16 hole16 ∈ S.capByIndex S.oppIndex2 := by
      rw [hgapPoint]
      exact B.points_mem_cap gapB
    have hgapNeLabel (point : Fin 15) :
        boundary16 hole16 ≠ boundary (labelIndex point) := by
      intro h
      have hindex :
          hole16 = Fin.rev
            (gap16.succAbove
              (BlockerVExactFifteenFourRowCoverage.position order point)) :=
        hboundary16Injective (by
          simpa only [boundary16, labelIndex] using h)
      have hrevIndex := Fin.rev_injective hindex
      exact (gap16.succAbove_ne
        (BlockerVExactFifteenFourRowCoverage.position order point))
          hrevIndex.symm
    have huPoint := (pointAt 6 iu ju huPos huGap).trans hiu
    have hvPoint := (pointAt 8 iv jv hvPos hvGap).trans hiv
    have hcPoint := (pointAt 11 ic jc hcPos hcGap).trans hic
    have hdeletedPoint := (pointAt 10 id jd hdPos hdGap).trans hid
    have hxvPoint := (pointAt 9 ixv jxv hxvPos hxvGap).trans hixv
    have hePoint := (pointAt 12 ie je hePos heGap).trans hie
    have hxuPoint := (pointAt 7 ixu jxu hxuPos hxuGap).trans hixu
    have hgapNeU : boundary16 hole16 ≠ P.u.1 := by
      intro h
      exact hgapNeLabel 6 (h.trans huPoint.symm)
    have hgapNeV : boundary16 hole16 ≠ P.v.1 := by
      intro h
      exact hgapNeLabel 8 (h.trans hvPoint.symm)
    have hgapNeDeleted :
        boundary16 hole16 ≠ P.jointDeletion.deleted.1 := by
      intro h
      exact hgapNeLabel 10 (h.trans hdeletedPoint.symm)
    have hgapNeXv : boundary16 hole16 ≠ packet.xv := by
      intro h
      exact hgapNeLabel 9 (h.trans hxvPoint.symm)
    have hgapNeXu : boundary16 hole16 ≠ packet.xu := by
      intro h
      exact hgapNeLabel 7 (h.trans hxuPoint.symm)
    have hgapNotKxv : boundary16 hole16 ∉ Kxv.support :=
      not_mem_of_inter_card_le_two_of_three_cap_points
        hgapCap (interiorCap huInterior) (interiorCap hxvInterior)
        Q.huXvRow Kxv.q_mem_support hgapNeU hgapNeXv huNeXv hKxvCap
    have hgapNotKu : boundary16 hole16 ∉ Ku.support :=
      not_mem_of_inter_card_le_two_of_three_cap_points
        hgapCap (interiorCap huInterior) (interiorCap hxuInterior)
        Ku.q_mem_support hxuURow hgapNeU hgapNeXu huNeXu hKuCap
    have hgapNotKv : boundary16 hole16 ∉ Kv.support :=
      not_mem_of_inter_card_le_two_of_three_cap_points
        hgapCap (interiorCap hvInterior) (interiorCap hxvInterior)
        Kv.q_mem_support hxvVRow hgapNeV hgapNeXv hvNeXv hKvCap
    have hgapNotKdel : boundary16 hole16 ∉ Kdel.support :=
      not_mem_of_inter_card_le_two_of_three_cap_points
        hgapCap (interiorCap hdeletedInterior) (interiorCap hvInterior)
        Kdel.q_mem_support Q.hvDeletedRow hgapNeDeleted hgapNeV
        hdelNeV hKdelCap
    let boundaryRev : Fin 16 → ℝ² := fun point => boundary16 (Fin.rev point)
    have hboundaryRevImage : Finset.univ.image boundaryRev = D.A := by
      rw [← hboundary16Image]
      ext point
      constructor
      · intro hpoint
        rcases Finset.mem_image.mp hpoint with ⟨index, _hindex, rfl⟩
        exact Finset.mem_image.mpr
          ⟨Fin.rev index, Finset.mem_univ _, by simp only [boundaryRev]⟩
      · intro hpoint
        rcases Finset.mem_image.mp hpoint with ⟨index, _hindex, rfl⟩
        exact Finset.mem_image.mpr
          ⟨Fin.rev index, Finset.mem_univ _, by
            simp only [boundaryRev, Fin.rev_rev]⟩
    have hpositionSurjective : Function.Surjective
        (BlockerVExactFifteenFourRowCoverage.position order) :=
      Finite.injective_iff_surjective.mp
        (BlockerVExactFifteenFourRowCoverage.position_injective order)
    have hKxvCovered :
        Kxv.support ⊆ Finset.univ.image
          (fun point : Fin 15 => boundary (labelIndex point)) := by
      change Kxv.support ⊆ Finset.univ.image
        (fun point : Fin 15 => boundaryRev
          (gap16.succAbove
            (BlockerVExactFifteenFourRowCoverage.position order point)))
      exact support_subset_image_skip_reindex hboundaryRevImage
        Kxv.support_subset_A gap16 (by simpa only [boundaryRev, hole16])
          _ hpositionSurjective
    have hKuCovered :
        Ku.support ⊆ Finset.univ.image
          (fun point : Fin 15 => boundary (labelIndex point)) := by
      change Ku.support ⊆ Finset.univ.image
        (fun point : Fin 15 => boundaryRev
          (gap16.succAbove
            (BlockerVExactFifteenFourRowCoverage.position order point)))
      exact support_subset_image_skip_reindex hboundaryRevImage
        Ku.support_subset_A gap16 (by simpa only [boundaryRev, hole16])
          _ hpositionSurjective
    have hKvCovered :
        Kv.support ⊆ Finset.univ.image
          (fun point : Fin 15 => boundary (labelIndex point)) := by
      change Kv.support ⊆ Finset.univ.image
        (fun point : Fin 15 => boundaryRev
          (gap16.succAbove
            (BlockerVExactFifteenFourRowCoverage.position order point)))
      exact support_subset_image_skip_reindex hboundaryRevImage
        Kv.support_subset_A gap16 (by simpa only [boundaryRev, hole16])
          _ hpositionSurjective
    have hKdelCovered :
        Kdel.support ⊆ Finset.univ.image
          (fun point : Fin 15 => boundary (labelIndex point)) := by
      change Kdel.support ⊆ Finset.univ.image
        (fun point : Fin 15 => boundaryRev
          (gap16.succAbove
            (BlockerVExactFifteenFourRowCoverage.position order point)))
      exact support_subset_image_skip_reindex hboundaryRevImage
        Kdel.support_subset_A gap16 (by simpa only [boundaryRev, hole16])
          _ hpositionSurjective
    have hlongPosition : ∀ point,
        BlockerVExactFifteenFourRowCoverage.longLabelBool point = true →
          (BlockerVExactFifteenFourRowCoverage.position order point).val < 9 := by
      fin_cases order <;> decide
    have hlongPoint : ∀ point,
        BlockerVExactFifteenFourRowCoverage.longLabelBool point = true →
          boundary (labelIndex point) ∈ S.capByIndex S.oppIndex2 := by
      intro point hlong
      have hlt := hlongPosition point hlong
      let j : Fin 9 := ⟨8 -
        (BlockerVExactFifteenFourRowCoverage.position order point).val, by omega⟩
      let t : Fin B.m := Fin.cast hm.symm (gap.succAbove j)
      have hsum :
          (BlockerVExactFifteenFourRowCoverage.position order point).val +
            j.val = 8 := by
        dsimp only [j]
        omega
      have ht : Fin.cast hm t = gap.succAbove j := by
        simp only [t, Fin.cast_cast, Fin.cast_eq_self]
      exact (pointAt point t j hsum ht) ▸ B.points_mem_cap t
    exact false_of_blockerVExactFifteen_bank_of_covered_source_rows
      Q hcenterV boundary hboundaryInjective hboundaryImage hboundaryCcw
      .reverse order labelIndex hposition hKxvCovered hKuCovered hKvCovered
      hKdelCovered hvInterior hxvInterior hdeletedInterior hcInterior
      huPoint hxuPoint hvPoint hxvPoint hdeletedPoint hcPoint hePoint hlongPoint
  rcases horders with horder | horder | horder | horder
  · rcases horder with ⟨gap, _hgap0, _hgap9, huGap, hvGap, hcGap, hdGap,
      hxvGap, heGap, hxuGap⟩
    exact closeForward 0 gap 1 2 3 4 5 6 7
      huGap hvGap hcGap hdGap hxvGap heGap hxuGap
      (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
      (by decide)
  · rcases horder with ⟨gap, _hgap0, _hgap9, huGap, hvGap, hcGap, hdGap,
      heGap, hxvGap, hxuGap⟩
    exact closeForward 1 gap 1 2 3 4 6 5 7
      huGap hvGap hcGap hdGap hxvGap heGap hxuGap
      (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
      (by decide)
  · rcases horder with ⟨gap, _hgap0, _hgap9, hxuGap, heGap, hxvGap, hdGap,
      hcGap, hvGap, huGap⟩
    exact closeReverse 0 gap 7 6 5 4 3 2 1
      huGap hvGap hcGap hdGap hxvGap heGap hxuGap
      (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
      (by decide)
  · rcases horder with ⟨gap, _hgap0, _hgap9, hxuGap, hxvGap, heGap, hdGap,
      hcGap, hvGap, huGap⟩
    exact closeReverse 1 gap 7 6 5 4 2 3 1
      huGap hvGap hcGap hdGap hxvGap heGap hxuGap
      (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
      (by decide)

/-- Exact-seventeen child with cap profile `(5,4,11)`.  The second strict cap
has nine points: the seven named points plus two extra points.  Every source
row already has two named hits in that cap and at most two cap hits, so the
extra points lie on none of the four rows.  Skipping them embeds those complete
rows in the exact-fifteen certificate bank. -/
theorem
    false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_eq_seventeen_secondCapEleven
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (hcenterDeletedInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (hcenterDeletedOffClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∉
        SelectedClass D.A S.oppApex2 P.rho)
    (hcard : D.A.card = 17)
    (hcapCard : (S.capByIndex S.oppIndex2).card = 11) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ku := (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  let Kv := (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
  let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let Kdel :=
    (Hlate.selectedAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2).toCriticalFourShell
  let Kxu := (Hlate.selectedAt packet.xu Q.hxuA).toCriticalFourShell
  let C := SelectedClass D.A S.oppApex2 P.rho
  let I := S.capInteriorByIndex S.oppIndex2
  let c :=
    Hlate.centerAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2
  let e := Hlate.centerAt packet.xu Q.hxuA
  have hnamedInfo :=
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_namedSeven
      Q hcenterV hcenterDeletedInterior hcenterDeletedOffClass
  have hnamedSubset : insert e (insert c C) ⊆ I := by
    simpa only [blockerVSecondCapNamedSeven, Hlate, e, c, C, I] using
      hnamedInfo.1
  have hnamedCard : (insert e (insert c C)).card = 7 := by
    simpa only [blockerVSecondCapNamedSeven, Hlate, e, c, C] using
      hnamedInfo.2
  have hxuInter : packet.xu ∈ Ku.support ∩ C := by
    simpa only [Ku, C, Hlate] using (show
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
      rw [packet.source_row_trace]
      simp)
  have hxuURow : packet.xu ∈ Ku.support := (Finset.mem_inter.mp hxuInter).1
  have hxuClass : packet.xu ∈ C := (Finset.mem_inter.mp hxuInter).2
  have hxvInter : packet.xv ∈ Kv.support ∩ C := by
    simpa only [C] using (show
      packet.xv ∈ Kv.support ∩ SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.opposite_row_trace]
        simp)
  have hxvVRow : packet.xv ∈ Kv.support := (Finset.mem_inter.mp hxvInter).1
  have hxvClass : packet.xv ∈ C := (Finset.mem_inter.mp hxvInter).2
  have hcenterU : Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [Hlate, P.huSource] using packet.blocker_eq_xv
  have hE : dist packet.xv P.u.1 = dist packet.xv packet.xu := by
    rw [← hcenterU]
    exact (Ku.support_eq_radius _ Ku.q_mem_support).trans
      (Ku.support_eq_radius _ hxuURow).symm
  have hD : dist P.v.1 packet.xv = dist P.v.1 P.u.1 := by
    rw [← Q.hblockerEqV]
    exact (Kxv.support_eq_radius _ Kxv.q_mem_support).trans
      (Kxv.support_eq_radius _ Q.huXvRow).symm
  have hC :
      dist P.jointDeletion.deleted.1 P.v.1 =
        dist P.jointDeletion.deleted.1 packet.xv := by
    have hraw :=
      (Kv.support_eq_radius _ Kv.q_mem_support).trans
        (Kv.support_eq_radius _ hxvVRow).symm
    simpa only [Hlate, hcenterV] using hraw
  have hB : dist e packet.xu = dist e P.jointDeletion.deleted.1 := by
    simpa only [e, Kxu] using
      (Kxu.support_eq_radius _ Kxu.q_mem_support).trans
        (Kxu.support_eq_radius _ Q.hdeletedXuRow).symm
  have hA : dist c P.jointDeletion.deleted.1 = dist c P.v.1 := by
    simpa only [c, Kdel] using
      (Kdel.support_eq_radius _ Kdel.q_mem_support).trans
        (Kdel.support_eq_radius _ Q.hvDeletedRow).symm
  have hclassInterior : C ⊆ I := by
    intro x hx
    exact hnamedSubset (by simp [hx])
  have heInterior : e ∈ I := hnamedSubset (by simp)
  have hcInterior : c ∈ I := hnamedSubset (by simp)
  have huInterior : P.u.1 ∈ I := hclassInterior P.huClass
  have hxuInterior : packet.xu ∈ I := hclassInterior hxuClass
  have hvInterior : P.v.1 ∈ I := hclassInterior P.hvClass
  have hxvInterior : packet.xv ∈ I := hclassInterior hxvClass
  have hdeletedInterior : P.jointDeletion.deleted.1 ∈ I :=
    hclassInterior P.jointDeletion.deleted_mem_class
  have huNeXu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have hvNeXv : P.v.1 ≠ packet.xv := packet.xv_ne_v.symm
  have huNeV : P.u.1 ≠ P.v.1 := by
    intro h
    exact P.huNeV (Subtype.ext h)
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply Ku.center_not_mem_support
    simpa only [hcenterU, ← h] using Ku.q_mem_support
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply Ku.center_not_mem_support
    simpa only [hcenterU, ← h] using hxuURow
  have hdelNeV : P.jointDeletion.deleted.1 ≠ P.v.1 := by
    intro h
    apply Kv.center_not_mem_support
    simpa only [Hlate, hcenterV, h] using Kv.q_mem_support
  have hdelNeXv : P.jointDeletion.deleted.1 ≠ packet.xv := by
    intro h
    apply Q.hxvNotDeletedRow
    simpa only [← h] using Kdel.q_mem_support
  have hcNeDeleted : c ≠ P.jointDeletion.deleted.1 := by
    simpa only [c, Hlate] using
      centerAt_ne_source Hlate P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2
  have hcNeV : c ≠ P.v.1 := by
    intro h
    exact hcenterDeletedOffClass (by simpa only [c, Hlate, h] using P.hvClass)
  have heNeXu : e ≠ packet.xu := by
    simpa only [e] using centerAt_ne_source Hlate packet.xu Q.hxuA
  have heNeDeleted : e ≠ P.jointDeletion.deleted.1 := by
    intro h
    apply Kxu.center_not_mem_support
    simpa only [e, h] using Q.hdeletedXuRow
  have hdelNeXu : P.jointDeletion.deleted.1 ≠ packet.xu := by
    intro h
    apply Q.hxuNotDeletedRow
    simpa only [← h] using Kdel.q_mem_support
  have hcOff : c ∉ C := by
    simpa only [c, C, Hlate] using hcenterDeletedOffClass
  have heOff : e ∉ C := by
    intro heClass
    have heInsert : e ∈ insert c C := Finset.mem_insert_of_mem heClass
    have hsmall : (insert e (insert c C)).card = 6 := by
      rw [Finset.insert_eq_self.mpr heInsert,
        Finset.card_insert_of_notMem hcOff]
      have hCcard : C.card = 5 := by
        simpa only [C] using P.hclassFive
      omega
    omega
  have heNeXv : e ≠ packet.xv := by
    intro h
    exact heOff (by simpa only [h] using hxvClass)
  rcases S.capByIndex_cgn4g_strictCapBlockData_oriented D.convex S.oppIndex2 with
    ⟨B, hBorient⟩
  have hm : B.m = 11 := B.cap_card_eq.trans hcapCard
  have interiorCap {x : ℝ²} (hx : x ∈ I) : x ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hx
  rcases B.exists_index_of_mem_cap (interiorCap huInterior) with ⟨iu, hiu⟩
  rcases B.exists_index_of_mem_cap (interiorCap hvInterior) with ⟨iv, hiv⟩
  rcases B.exists_index_of_mem_cap (interiorCap hcInterior) with ⟨ic, hic⟩
  rcases B.exists_index_of_mem_cap (interiorCap hdeletedInterior) with ⟨id, hid⟩
  rcases B.exists_index_of_mem_cap (interiorCap hxvInterior) with ⟨ixv, hixv⟩
  rcases B.exists_index_of_mem_cap (interiorCap heInterior) with ⟨ie, hie⟩
  rcases B.exists_index_of_mem_cap (interiorCap hxuInterior) with ⟨ixu, hixu⟩
  have indexBounds {x : ℝ²} (hx : x ∈ I) (i : Fin B.m)
      (hi : B.L.points i = x) : 0 < i.val ∧ i.val < B.m - 1 := by
    have hfirst : i ≠ CGN.firstIndex B.Packet.hm := by
      intro hifirst
      have hxEndpoint :
          x = (S.triangleByIndex S.oppIndex2).v2 ∨
            x = (S.triangleByIndex S.oppIndex2).v3 := by
        rcases hBorient with hb | hb
        · exact Or.inl (hi.symm.trans (by simpa only [hifirst] using hb.1))
        · exact Or.inr (hi.symm.trans (by simpa only [hifirst] using hb.1))
      rcases hxEndpoint with hxEndpoint | hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v2 hx hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v3 hx hxEndpoint
    have hlast : i ≠ CGN.lastIndex B.Packet.hm := by
      intro hilast
      have hxEndpoint :
          x = (S.triangleByIndex S.oppIndex2).v2 ∨
            x = (S.triangleByIndex S.oppIndex2).v3 := by
        rcases hBorient with hb | hb
        · exact Or.inr (hi.symm.trans (by simpa only [hilast] using hb.2))
        · exact Or.inl (hi.symm.trans (by simpa only [hilast] using hb.2))
      rcases hxEndpoint with hxEndpoint | hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v2 hx hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v3 hx hxEndpoint
    have hfirstVal : i.val ≠ 0 := by
      intro hi
      apply hfirst
      apply Fin.ext
      simpa only [CGN.firstIndex_val] using hi
    have hlastVal : i.val ≠ B.m - 1 := by
      intro hi
      apply hlast
      apply Fin.ext
      simpa only [CGN.lastIndex_val] using hi
    constructor <;> omega
  have hiuBounds := indexBounds huInterior iu hiu
  have hivBounds := indexBounds hvInterior iv hiv
  have hicBounds := indexBounds hcInterior ic hic
  have hidBounds := indexBounds hdeletedInterior id hid
  have hixvBounds := indexBounds hxvInterior ixv hixv
  have hieBounds := indexBounds heInterior ie hie
  have hixuBounds := indexBounds hxuInterior ixu hixu
  have between {j r s : Fin B.m} (hjr : B.L.points j ≠ B.L.points r)
      (hjs : B.L.points j ≠ B.L.points s)
      (hrs : B.L.points r ≠ B.L.points s)
      (heq : dist (B.L.points j) (B.L.points r) =
        dist (B.L.points j) (B.L.points s)) :
      (r < j ∧ j < s) ∨ (s < j ∧ j < r) := by
    have hjrIndex : j ≠ r := by
      intro h
      exact hjr (congrArg B.L.points h)
    have hjsIndex : j ≠ s := by
      intro h
      exact hjs (congrArg B.L.points h)
    have hrsIndex : r ≠ s := by
      intro h
      exact hrs (congrArg B.L.points h)
    rcases lt_or_gt_of_ne hrsIndex with hrs | hsr
    · exact Or.inl (CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord hrs hjrIndex hjsIndex heq)
    · exact Or.inr (CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord hsr hjsIndex hjrIndex heq.symm)
  have hXv : (iu < ixv ∧ ixv < ixu) ∨ (ixu < ixv ∧ ixv < iu) :=
    between (by simpa only [hixv, hiu] using huNeXv.symm)
      (by simpa only [hixv, hixu] using hxuNeXv.symm)
      (by simpa only [hiu, hixu] using huNeXu)
      (by simpa only [hixv, hiu, hixu] using hE)
  have hV : (iu < iv ∧ iv < ixv) ∨ (ixv < iv ∧ iv < iu) :=
    between (by simpa only [hiv, hiu] using huNeV.symm)
      (by simpa only [hiv, hixv] using hvNeXv)
      (by simpa only [hiu, hixv] using huNeXv)
      (by simpa only [hiv, hiu, hixv] using hD.symm)
  have hDel : (iv < id ∧ id < ixv) ∨ (ixv < id ∧ id < iv) :=
    between (by simpa only [hid, hiv] using hdelNeV)
      (by simpa only [hid, hixv] using hdelNeXv)
      (by simpa only [hiv, hixv] using hvNeXv)
      (by simpa only [hid, hiv, hixv] using hC)
  have hCenter : (iv < ic ∧ ic < id) ∨ (id < ic ∧ ic < iv) :=
    between (by simpa only [hic, hiv] using hcNeV)
      (by simpa only [hic, hid] using hcNeDeleted)
      (by simpa only [hiv, hid] using hdelNeV.symm)
      (by simpa only [hic, hiv, hid] using hA.symm)
  have hXuCenter : (id < ie ∧ ie < ixu) ∨ (ixu < ie ∧ ie < id) :=
    between (by simpa only [hie, hid] using heNeDeleted)
      (by simpa only [hie, hixu] using heNeXu)
      (by simpa only [hid, hixu] using hdelNeXu)
      (by simpa only [hie, hid, hixu] using hB.symm)
  have hieNeIxv : ie ≠ ixv := by
    intro h
    apply heNeXv
    calc
      e = B.L.points ie := hie.symm
      _ = B.L.points ixv := congrArg B.L.points h
      _ = packet.xv := hixv

  have horders := seven_index_order_classification_eleven_of_eq hm
    iu iv ic id ixv ie ixu
    hiuBounds.1 hiuBounds.2 hivBounds.1 hivBounds.2 hicBounds.1 hicBounds.2
    hidBounds.1 hidBounds.2 hixvBounds.1 hixvBounds.2 hieBounds.1 hieBounds.2
    hixuBounds.1 hixuBounds.2 hieNeIxv hXv hV hDel hCenter hXuCenter
  have hKxvCap :
      (Kxv.support ∩ S.capByIndex S.oppIndex2).card ≤ 2 :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.oppIndex2 Kxv.toSelectedFourClass
      (by simpa only [Hlate, Q.hblockerEqV] using interiorCap hvInterior)
  have hKuCap :
      (Ku.support ∩ S.capByIndex S.oppIndex2).card ≤ 2 :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.oppIndex2 Ku.toSelectedFourClass
      (by simpa only [Hlate, hcenterU] using interiorCap hxvInterior)
  have hKvCap :
      (Kv.support ∩ S.capByIndex S.oppIndex2).card ≤ 2 :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.oppIndex2 Kv.toSelectedFourClass
      (by simpa only [Hlate, hcenterV] using interiorCap hdeletedInterior)
  have hKdelCap :
      (Kdel.support ∩ S.capByIndex S.oppIndex2).card ≤ 2 :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.oppIndex2 Kdel.toSelectedFourClass
      (by simpa only [Hlate, c] using interiorCap hcInterior)
  have closeDoubleSkip
      (boundary : Fin D.A.card → ℝ²)
      (hboundaryInjective : Function.Injective boundary)
      (hboundaryImage : Finset.univ.image boundary = D.A)
      (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
      (rawBoundary : Fin 17 → ℝ²)
      (hrawInjective : Function.Injective rawBoundary)
      (hrawImage : Finset.univ.image rawBoundary = D.A)
      (outer : Fin 17) (inner : Fin 16)
      (orientation : BlockerVExactFifteenFourRowCoverage.Orientation)
      (order : Fin 2) (labelIndex : Fin 15 → Fin D.A.card)
      (hlabel : ∀ point,
        boundary (labelIndex point) =
          rawBoundary (outer.succAbove (inner.succAbove
            (BlockerVExactFifteenFourRowCoverage.position order point))))
      (hposition :
        BlockerVExactFifteenFourRowCoverage.PositionEmbedding
          orientation order labelIndex)
      (houterCap : rawBoundary outer ∈ S.capByIndex S.oppIndex2)
      (hinnerCap :
        rawBoundary (outer.succAbove inner) ∈ S.capByIndex S.oppIndex2)
      (huPoint : boundary (labelIndex 6) = P.u.1)
      (hxuPoint : boundary (labelIndex 7) = packet.xu)
      (hvPoint : boundary (labelIndex 8) = P.v.1)
      (hxvPoint : boundary (labelIndex 9) = packet.xv)
      (hdeletedPoint :
        boundary (labelIndex 10) = P.jointDeletion.deleted.1)
      (hcPoint : boundary (labelIndex 11) = c)
      (hePoint : boundary (labelIndex 12) =
        (lateFirstApexSystem R).centerAt packet.xu Q.hxuA)
      (hlongPoint : ∀ point,
        BlockerVExactFifteenFourRowCoverage.longLabelBool point = true →
          boundary (labelIndex point) ∈ S.capByIndex S.oppIndex2) : False := by
    have houterNeLabel (point : Fin 15) :
        rawBoundary outer ≠ boundary (labelIndex point) := by
      intro h
      have hindex := hrawInjective (h.trans (hlabel point))
      exact (outer.succAbove_ne
        (inner.succAbove
          (BlockerVExactFifteenFourRowCoverage.position order point)))
        hindex.symm
    have hinnerNeLabel (point : Fin 15) :
        rawBoundary (outer.succAbove inner) ≠
          boundary (labelIndex point) := by
      intro h
      have hindex := hrawInjective (h.trans (hlabel point))
      have hindex' := Fin.succAbove_right_injective hindex
      exact (inner.succAbove_ne
        (BlockerVExactFifteenFourRowCoverage.position order point))
        hindex'.symm
    have houterNeU : rawBoundary outer ≠ P.u.1 := by
      intro h
      exact houterNeLabel 6 (h.trans huPoint.symm)
    have houterNeV : rawBoundary outer ≠ P.v.1 := by
      intro h
      exact houterNeLabel 8 (h.trans hvPoint.symm)
    have houterNeDeleted :
        rawBoundary outer ≠ P.jointDeletion.deleted.1 := by
      intro h
      exact houterNeLabel 10 (h.trans hdeletedPoint.symm)
    have houterNeXv : rawBoundary outer ≠ packet.xv := by
      intro h
      exact houterNeLabel 9 (h.trans hxvPoint.symm)
    have houterNeXu : rawBoundary outer ≠ packet.xu := by
      intro h
      exact houterNeLabel 7 (h.trans hxuPoint.symm)
    have hinnerNeU : rawBoundary (outer.succAbove inner) ≠ P.u.1 := by
      intro h
      exact hinnerNeLabel 6 (h.trans huPoint.symm)
    have hinnerNeV : rawBoundary (outer.succAbove inner) ≠ P.v.1 := by
      intro h
      exact hinnerNeLabel 8 (h.trans hvPoint.symm)
    have hinnerNeDeleted :
        rawBoundary (outer.succAbove inner) ≠
          P.jointDeletion.deleted.1 := by
      intro h
      exact hinnerNeLabel 10 (h.trans hdeletedPoint.symm)
    have hinnerNeXv :
        rawBoundary (outer.succAbove inner) ≠ packet.xv := by
      intro h
      exact hinnerNeLabel 9 (h.trans hxvPoint.symm)
    have hinnerNeXu :
        rawBoundary (outer.succAbove inner) ≠ packet.xu := by
      intro h
      exact hinnerNeLabel 7 (h.trans hxuPoint.symm)
    have houterNotKxv : rawBoundary outer ∉ Kxv.support :=
      not_mem_of_inter_card_le_two_of_three_cap_points
        houterCap (interiorCap huInterior) (interiorCap hxvInterior)
        Q.huXvRow Kxv.q_mem_support houterNeU houterNeXv huNeXv hKxvCap
    have houterNotKu : rawBoundary outer ∉ Ku.support :=
      not_mem_of_inter_card_le_two_of_three_cap_points
        houterCap (interiorCap huInterior) (interiorCap hxuInterior)
        Ku.q_mem_support hxuURow houterNeU houterNeXu huNeXu hKuCap
    have houterNotKv : rawBoundary outer ∉ Kv.support :=
      not_mem_of_inter_card_le_two_of_three_cap_points
        houterCap (interiorCap hvInterior) (interiorCap hxvInterior)
        Kv.q_mem_support hxvVRow houterNeV houterNeXv hvNeXv hKvCap
    have houterNotKdel : rawBoundary outer ∉ Kdel.support :=
      not_mem_of_inter_card_le_two_of_three_cap_points
        houterCap (interiorCap hdeletedInterior) (interiorCap hvInterior)
        Kdel.q_mem_support Q.hvDeletedRow houterNeDeleted houterNeV
        hdelNeV hKdelCap
    have hinnerNotKxv :
        rawBoundary (outer.succAbove inner) ∉ Kxv.support :=
      not_mem_of_inter_card_le_two_of_three_cap_points
        hinnerCap (interiorCap huInterior) (interiorCap hxvInterior)
        Q.huXvRow Kxv.q_mem_support hinnerNeU hinnerNeXv huNeXv hKxvCap
    have hinnerNotKu :
        rawBoundary (outer.succAbove inner) ∉ Ku.support :=
      not_mem_of_inter_card_le_two_of_three_cap_points
        hinnerCap (interiorCap huInterior) (interiorCap hxuInterior)
        Ku.q_mem_support hxuURow hinnerNeU hinnerNeXu huNeXu hKuCap
    have hinnerNotKv :
        rawBoundary (outer.succAbove inner) ∉ Kv.support :=
      not_mem_of_inter_card_le_two_of_three_cap_points
        hinnerCap (interiorCap hvInterior) (interiorCap hxvInterior)
        Kv.q_mem_support hxvVRow hinnerNeV hinnerNeXv hvNeXv hKvCap
    have hinnerNotKdel :
        rawBoundary (outer.succAbove inner) ∉ Kdel.support :=
      not_mem_of_inter_card_le_two_of_three_cap_points
        hinnerCap (interiorCap hdeletedInterior) (interiorCap hvInterior)
        Kdel.q_mem_support Q.hvDeletedRow hinnerNeDeleted hinnerNeV
        hdelNeV hKdelCap
    have hpositionSurjective : Function.Surjective
        (BlockerVExactFifteenFourRowCoverage.position order) :=
      Finite.injective_iff_surjective.mp
        (BlockerVExactFifteenFourRowCoverage.position_injective order)
    have coverRow {support : Finset ℝ²}
        (hsupport : support ⊆ D.A)
        (houter : rawBoundary outer ∉ support)
        (hinner : rawBoundary (outer.succAbove inner) ∉ support) :
        support ⊆ Finset.univ.image
          (fun point : Fin 15 => boundary (labelIndex point)) := by
      have hcovered := support_subset_image_double_skip_reindex
        hrawImage hsupport outer houter inner hinner _ hpositionSurjective
      simpa only [hlabel] using hcovered
    have hKxvCovered := coverRow Kxv.support_subset_A
      houterNotKxv hinnerNotKxv
    have hKuCovered := coverRow Ku.support_subset_A houterNotKu hinnerNotKu
    have hKvCovered := coverRow Kv.support_subset_A houterNotKv hinnerNotKv
    have hKdelCovered := coverRow Kdel.support_subset_A
      houterNotKdel hinnerNotKdel
    exact false_of_blockerVExactFifteen_bank_of_covered_source_rows
      Q hcenterV boundary hboundaryInjective hboundaryImage hboundaryCcw
      orientation order labelIndex hposition hKxvCovered hKuCovered hKvCovered
      hKdelCovered hvInterior hxvInterior hdeletedInterior hcInterior
      huPoint hxuPoint hvPoint hxvPoint hdeletedPoint hcPoint hePoint hlongPoint
  have closeForward
      (order : Fin 2) (outer inner : Fin 10)
      (ju jv jc jd jxv je jxu : Fin 9)
      (huGap : Fin.cast hm iu =
        outer.castSucc.succAbove (inner.succAbove ju))
      (hvGap : Fin.cast hm iv =
        outer.castSucc.succAbove (inner.succAbove jv))
      (hcGap : Fin.cast hm ic =
        outer.castSucc.succAbove (inner.succAbove jc))
      (hdGap : Fin.cast hm id =
        outer.castSucc.succAbove (inner.succAbove jd))
      (hxvGap : Fin.cast hm ixv =
        outer.castSucc.succAbove (inner.succAbove jxv))
      (heGap : Fin.cast hm ie =
        outer.castSucc.succAbove (inner.succAbove je))
      (hxuGap : Fin.cast hm ixu =
        outer.castSucc.succAbove (inner.succAbove jxu))
      (huPos :
        (BlockerVExactFifteenFourRowCoverage.position order 6).val = ju.val)
      (hvPos :
        (BlockerVExactFifteenFourRowCoverage.position order 8).val = jv.val)
      (hcPos :
        (BlockerVExactFifteenFourRowCoverage.position order 11).val = jc.val)
      (hdPos :
        (BlockerVExactFifteenFourRowCoverage.position order 10).val = jd.val)
      (hxvPos :
        (BlockerVExactFifteenFourRowCoverage.position order 9).val = jxv.val)
      (hePos :
        (BlockerVExactFifteenFourRowCoverage.position order 12).val = je.val)
      (hxuPos :
        (BlockerVExactFifteenFourRowCoverage.position order 7).val = jxu.val) :
      False := by
    let shifted : Fin B.n → ℝ² := fun point => B.phi (point + B.Block.lo)
    let boundary : Fin D.A.card → ℝ² := fun point =>
      shifted (Fin.cast B.ambient_card_eq.symm point)
    let boundary17 : Fin 17 → ℝ² := fun point =>
      boundary (Fin.cast hcard.symm point)
    let outerCap : Fin 11 := outer.castSucc
    let outer17 : Fin 17 := Fin.castLE (by omega) outerCap
    let inner16 : Fin 16 := Fin.castLE (by omega) inner
    let labelIndex : Fin 15 → Fin D.A.card := fun point =>
      Fin.cast hcard.symm
        (outer17.succAbove (inner16.succAbove
          (BlockerVExactFifteenFourRowCoverage.position order point)))
    have hshiftedInjective : Function.Injective shifted := by
      simpa only [shifted] using
        injective_cyclicShift B.phi_injective B.Block.lo
    have hboundaryInjective : Function.Injective boundary := by
      simpa only [boundary] using
        injective_finCast_domain B.ambient_card_eq hshiftedInjective
    have hboundary17Injective : Function.Injective boundary17 := by
      intro x y hxy
      apply Fin.cast_injective hcard.symm
      exact hboundaryInjective hxy
    have hshiftedImage : Finset.univ.image shifted = D.A := by
      calc
        Finset.univ.image shifted = Finset.univ.image B.phi := by
          simpa only [shifted] using
            image_univ_cyclicShift B.phi B.Block.lo
        _ = D.A := B.Block.phi_image
    have hboundaryImage : Finset.univ.image boundary = D.A := by
      simpa only [boundary] using
        (image_univ_finCast_domain B.ambient_card_eq shifted).trans
          hshiftedImage
    have hboundary17Image : Finset.univ.image boundary17 = D.A := by
      simpa only [boundary17] using
        (image_univ_finCast_domain hcard boundary).trans hboundaryImage
    have hshiftedCcw : EuclideanGeometry.IsCcwConvexPolygon shifted := by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift B.phi_injective B.phi_ccw B.Block.lo
    have hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
      simpa only [boundary] using
        ccw_finCast_domain B.ambient_card_eq hshiftedCcw
    have hlabel : ∀ point,
        boundary (labelIndex point) =
          boundary17 (outer17.succAbove (inner16.succAbove
            (BlockerVExactFifteenFourRowCoverage.position order point))) := by
      intro point
      rfl
    have hposition :
        BlockerVExactFifteenFourRowCoverage.PositionEmbedding
          .forward order labelIndex := by
      simpa only [labelIndex, Fin.val_cast] using
        double_skip_position_embedding_forward outer17 inner16 order
    have pointAt (point : Fin 15) (t : Fin B.m) (j : Fin 9)
        (hpoint :
          (BlockerVExactFifteenFourRowCoverage.position order point).val = j.val)
        (ht : Fin.cast hm t =
          outerCap.succAbove (inner.succAbove j)) :
        boundary (labelIndex point) = B.L.points t := by
      have hinnerSkip := gapTen_castLE_succAbove_val inner
        (BlockerVExactFifteenFourRowCoverage.position order point) j hpoint
      have houterSkip := gapEleven_castLE_succAbove_val outerCap
        (inner16.succAbove
          (BlockerVExactFifteenFourRowCoverage.position order point))
        (inner.succAbove j) hinnerSkip
      have htVal : t.val =
          (outerCap.succAbove (inner.succAbove j)).val := by
        simpa only [Fin.val_cast] using congrArg Fin.val ht
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm
                (outer17.succAbove (inner16.succAbove
                  (BlockerVExactFifteenFourRowCoverage.position order point)))) =
            Fin.castLE (by have hspan := B.block_span; omega) t := by
        apply Fin.ext
        simpa only [Fin.val_cast, Fin.val_castLE, outer17] using
          houterSkip.trans htVal.symm
      simpa only [boundary, shifted, labelIndex, hcast] using
        B.shifted_phi_cast_eq_points t
    let outerB : Fin B.m := Fin.cast hm.symm outerCap
    have houterPoint : boundary17 outer17 = B.L.points outerB := by
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm outer17) =
            Fin.castLE (by have hspan := B.block_span; omega) outerB := by
        apply Fin.ext
        simp only [Fin.val_cast, Fin.val_castLE, outer17, outerB, outerCap]
      simpa only [boundary17, boundary, shifted, hcast] using
        B.shifted_phi_cast_eq_points outerB
    have houterInCap : boundary17 outer17 ∈ S.capByIndex S.oppIndex2 := by
      rw [houterPoint]
      exact B.points_mem_cap outerB
    let innerCap : Fin 11 := outerCap.succAbove inner
    let innerB : Fin B.m := Fin.cast hm.symm innerCap
    have hinnerPoint :
        boundary17 (outer17.succAbove inner16) = B.L.points innerB := by
      have hskip := gapEleven_castLE_succAbove_val outerCap inner16 inner
        (by simp only [inner16, Fin.val_castLE])
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm (outer17.succAbove inner16)) =
            Fin.castLE (by have hspan := B.block_span; omega) innerB := by
        apply Fin.ext
        simpa only [Fin.val_cast, Fin.val_castLE, outer17, innerCap, innerB] using
          hskip
      simpa only [boundary17, boundary, shifted, hcast] using
        B.shifted_phi_cast_eq_points innerB
    have hinnerInCap :
        boundary17 (outer17.succAbove inner16) ∈
          S.capByIndex S.oppIndex2 := by
      rw [hinnerPoint]
      exact B.points_mem_cap innerB
    have huPoint := (pointAt 6 iu ju huPos huGap).trans hiu
    have hvPoint := (pointAt 8 iv jv hvPos hvGap).trans hiv
    have hcPoint := (pointAt 11 ic jc hcPos hcGap).trans hic
    have hdeletedPoint := (pointAt 10 id jd hdPos hdGap).trans hid
    have hxvPoint := (pointAt 9 ixv jxv hxvPos hxvGap).trans hixv
    have hePoint := (pointAt 12 ie je hePos heGap).trans hie
    have hxuPoint := (pointAt 7 ixu jxu hxuPos hxuGap).trans hixu
    have hlongPosition : ∀ point,
        BlockerVExactFifteenFourRowCoverage.longLabelBool point = true →
          (BlockerVExactFifteenFourRowCoverage.position order point).val < 9 := by
      fin_cases order <;> decide
    have hlongPoint : ∀ point,
        BlockerVExactFifteenFourRowCoverage.longLabelBool point = true →
          boundary (labelIndex point) ∈ S.capByIndex S.oppIndex2 := by
      intro point hlong
      have hlt := hlongPosition point hlong
      let j : Fin 9 :=
        ⟨(BlockerVExactFifteenFourRowCoverage.position order point).val, hlt⟩
      let t : Fin B.m := Fin.cast hm.symm
        (outerCap.succAbove (inner.succAbove j))
      have hpoint :
          (BlockerVExactFifteenFourRowCoverage.position order point).val =
            j.val := rfl
      have ht : Fin.cast hm t =
          outerCap.succAbove (inner.succAbove j) := by
        simp only [t, Fin.cast_cast, Fin.cast_eq_self]
      exact (pointAt point t j hpoint ht) ▸ B.points_mem_cap t
    exact closeDoubleSkip boundary hboundaryInjective hboundaryImage
      hboundaryCcw boundary17 hboundary17Injective hboundary17Image
      outer17 inner16 .forward order labelIndex hlabel hposition
      houterInCap hinnerInCap huPoint hxuPoint hvPoint hxvPoint
      hdeletedPoint hcPoint hePoint hlongPoint
  have closeReverse
      (order : Fin 2) (outer inner : Fin 10)
      (ju jv jc jd jxv je jxu : Fin 9)
      (huGap : Fin.cast hm iu =
        outer.castSucc.succAbove (inner.succAbove ju))
      (hvGap : Fin.cast hm iv =
        outer.castSucc.succAbove (inner.succAbove jv))
      (hcGap : Fin.cast hm ic =
        outer.castSucc.succAbove (inner.succAbove jc))
      (hdGap : Fin.cast hm id =
        outer.castSucc.succAbove (inner.succAbove jd))
      (hxvGap : Fin.cast hm ixv =
        outer.castSucc.succAbove (inner.succAbove jxv))
      (heGap : Fin.cast hm ie =
        outer.castSucc.succAbove (inner.succAbove je))
      (hxuGap : Fin.cast hm ixu =
        outer.castSucc.succAbove (inner.succAbove jxu))
      (huPos :
        (BlockerVExactFifteenFourRowCoverage.position order 6).val + ju.val = 8)
      (hvPos :
        (BlockerVExactFifteenFourRowCoverage.position order 8).val + jv.val = 8)
      (hcPos :
        (BlockerVExactFifteenFourRowCoverage.position order 11).val + jc.val = 8)
      (hdPos :
        (BlockerVExactFifteenFourRowCoverage.position order 10).val + jd.val = 8)
      (hxvPos :
        (BlockerVExactFifteenFourRowCoverage.position order 9).val + jxv.val = 8)
      (hePos :
        (BlockerVExactFifteenFourRowCoverage.position order 12).val + je.val = 8)
      (hxuPos :
        (BlockerVExactFifteenFourRowCoverage.position order 7).val + jxu.val = 8) :
      False := by
    letI : NeZero B.n := ⟨by have hspan := B.block_span; omega⟩
    let cut : Fin B.n := ⟨(B.Block.hi.val + 1) % B.n,
      Nat.mod_lt _ (by have := B.Block.hi.isLt; omega)⟩
    let shifted : Fin B.n → ℝ² := fun point => B.phi (point + cut)
    let boundary : Fin D.A.card → ℝ² := fun point =>
      shifted (Fin.cast B.ambient_card_eq.symm point)
    let boundary17 : Fin 17 → ℝ² := fun point =>
      boundary (Fin.cast hcard.symm point)
    let rawBoundary : Fin 17 → ℝ² := fun point => boundary17 (Fin.rev point)
    let outerCap : Fin 11 := outer.castSucc
    let outer17 : Fin 17 := Fin.castLE (by omega) (Fin.rev outerCap)
    let innerR : Fin 10 := reverseGapTen inner
    let inner16 : Fin 16 := Fin.castLE (by omega) innerR
    let labelIndex : Fin 15 → Fin D.A.card := fun point =>
      Fin.cast hcard.symm
        (Fin.rev (outer17.succAbove (inner16.succAbove
          (BlockerVExactFifteenFourRowCoverage.position order point))))
    have hshiftedInjective : Function.Injective shifted := by
      simpa only [shifted] using injective_cyclicShift B.phi_injective cut
    have hboundaryInjective : Function.Injective boundary := by
      simpa only [boundary] using
        injective_finCast_domain B.ambient_card_eq hshiftedInjective
    have hboundary17Injective : Function.Injective boundary17 := by
      intro x y hxy
      apply Fin.cast_injective hcard.symm
      exact hboundaryInjective hxy
    have hrawBoundaryInjective : Function.Injective rawBoundary := by
      intro x y hxy
      apply Fin.rev_injective
      exact hboundary17Injective hxy
    have hshiftedImage : Finset.univ.image shifted = D.A := by
      calc
        Finset.univ.image shifted = Finset.univ.image B.phi := by
          simpa only [shifted] using image_univ_cyclicShift B.phi cut
        _ = D.A := B.Block.phi_image
    have hboundaryImage : Finset.univ.image boundary = D.A := by
      simpa only [boundary] using
        (image_univ_finCast_domain B.ambient_card_eq shifted).trans
          hshiftedImage
    have hboundary17Image : Finset.univ.image boundary17 = D.A := by
      simpa only [boundary17] using
        (image_univ_finCast_domain hcard boundary).trans hboundaryImage
    have hrawBoundaryImage : Finset.univ.image rawBoundary = D.A := by
      rw [← hboundary17Image]
      ext point
      constructor
      · intro hpoint
        rcases Finset.mem_image.mp hpoint with ⟨index, _hindex, rfl⟩
        exact Finset.mem_image.mpr
          ⟨Fin.rev index, Finset.mem_univ _, by simp only [rawBoundary]⟩
      · intro hpoint
        rcases Finset.mem_image.mp hpoint with ⟨index, _hindex, rfl⟩
        exact Finset.mem_image.mpr
          ⟨Fin.rev index, Finset.mem_univ _, by
            simp only [rawBoundary, Fin.rev_rev]⟩
    have hshiftedCcw : EuclideanGeometry.IsCcwConvexPolygon shifted := by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift B.phi_injective B.phi_ccw cut
    have hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
      simpa only [boundary] using
        ccw_finCast_domain B.ambient_card_eq hshiftedCcw
    have hlabel : ∀ point,
        boundary (labelIndex point) =
          rawBoundary (outer17.succAbove (inner16.succAbove
            (BlockerVExactFifteenFourRowCoverage.position order point))) := by
      intro point
      rfl
    have hposition :
        BlockerVExactFifteenFourRowCoverage.PositionEmbedding
          .reverse order labelIndex := by
      simpa only [labelIndex, Fin.val_cast] using
        double_skip_position_embedding_reverse outer17 inner16 order
    have pointAt (point : Fin 15) (t : Fin B.m) (j : Fin 9)
        (hsum :
          (BlockerVExactFifteenFourRowCoverage.position order point).val +
            j.val = 8)
        (ht : Fin.cast hm t =
          outerCap.succAbove (inner.succAbove j)) :
        boundary (labelIndex point) = B.L.points t := by
      have hinnerSum := reverseGapTen_castLE_succAbove_sum inner
        (BlockerVExactFifteenFourRowCoverage.position order point) j hsum
      have houterSum :=
        reverseGapEleven_castLE_succAbove_sum_exactSeventeen outerCap
          (inner16.succAbove
            (BlockerVExactFifteenFourRowCoverage.position order point))
          (inner.succAbove j) (by simpa only [inner16, innerR] using hinnerSum)
      have htVal : t.val =
          (outerCap.succAbove (inner.succAbove j)).val := by
        simpa only [Fin.val_cast] using congrArg Fin.val ht
      have htotal :
          (outer17.succAbove (inner16.succAbove
              (BlockerVExactFifteenFourRowCoverage.position order point))).val +
            t.val = 10 := by
        rw [htVal]
        simpa only [outer17] using houterSum
      let offset : Fin B.n := ⟨B.n - B.m + t.val, by
        have hspan := B.block_span
        have hmpos := B.Block.hm
        omega⟩
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm
                (Fin.rev (outer17.succAbove (inner16.succAbove
                  (BlockerVExactFifteenFourRowCoverage.position order point))))) =
            offset := by
        apply Fin.ext
        simp only [Fin.val_cast, Fin.val_rev]
        dsimp only [offset]
        have hn : B.n = 17 := B.ambient_card_eq.trans hcard
        omega
      simpa only [boundary, shifted, labelIndex, cut, hcast, offset] using
        B.shifted_after_block_phi_cast_eq_points t
    let outerB : Fin B.m := Fin.cast hm.symm outerCap
    have houterPoint : rawBoundary outer17 = B.L.points outerB := by
      have houterBVal : outerB.val = outerCap.val := by
        simp only [outerB, Fin.val_cast]
      have htotal : outer17.val + outerB.val = 10 := by
        rw [houterBVal]
        simp only [outer17, Fin.val_castLE, Fin.val_rev]
        omega
      let offset : Fin B.n := ⟨B.n - B.m + outerB.val, by
        have hspan := B.block_span
        have hmpos := B.Block.hm
        omega⟩
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm (Fin.rev outer17)) = offset := by
        apply Fin.ext
        simp only [Fin.val_cast, Fin.val_rev]
        dsimp only [offset]
        have hn : B.n = 17 := B.ambient_card_eq.trans hcard
        omega
      simpa only [rawBoundary, boundary17, boundary, shifted, cut, hcast,
        offset] using B.shifted_after_block_phi_cast_eq_points outerB
    have houterInCap : rawBoundary outer17 ∈
        S.capByIndex S.oppIndex2 := by
      rw [houterPoint]
      exact B.points_mem_cap outerB
    let innerCap : Fin 11 := outerCap.succAbove inner
    let innerB : Fin B.m := Fin.cast hm.symm innerCap
    have hinnerPoint :
        rawBoundary (outer17.succAbove inner16) = B.L.points innerB := by
      have hinnerSum : inner16.val + inner.val = 9 := by
        simp only [inner16, Fin.val_castLE, innerR, reverseGapTen]
        omega
      have houterSum :=
        reverseGapEleven_castLE_succAbove_sum_exactSeventeen outerCap
          inner16 inner hinnerSum
      let offset : Fin B.n := ⟨B.n - B.m + innerB.val, by
        have hspan := B.block_span
        have hmpos := B.Block.hm
        omega⟩
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm
                (Fin.rev (outer17.succAbove inner16))) = offset := by
        apply Fin.ext
        simp only [Fin.val_cast, Fin.val_rev]
        dsimp only [offset]
        have hn : B.n = 17 := B.ambient_card_eq.trans hcard
        have hinnerBVal : innerB.val = innerCap.val := by
          simp only [innerB, Fin.val_cast]
        have htotal :
            (outer17.succAbove inner16).val + innerB.val = 10 := by
          rw [hinnerBVal]
          simpa only [innerCap, outer17] using houterSum
        omega
      simpa only [rawBoundary, boundary17, boundary, shifted, cut, hcast,
        offset] using B.shifted_after_block_phi_cast_eq_points innerB
    have hinnerInCap : rawBoundary (outer17.succAbove inner16) ∈
        S.capByIndex S.oppIndex2 := by
      rw [hinnerPoint]
      exact B.points_mem_cap innerB
    have huPoint := (pointAt 6 iu ju huPos huGap).trans hiu
    have hvPoint := (pointAt 8 iv jv hvPos hvGap).trans hiv
    have hcPoint := (pointAt 11 ic jc hcPos hcGap).trans hic
    have hdeletedPoint := (pointAt 10 id jd hdPos hdGap).trans hid
    have hxvPoint := (pointAt 9 ixv jxv hxvPos hxvGap).trans hixv
    have hePoint := (pointAt 12 ie je hePos heGap).trans hie
    have hxuPoint := (pointAt 7 ixu jxu hxuPos hxuGap).trans hixu
    have hlongPosition : ∀ point,
        BlockerVExactFifteenFourRowCoverage.longLabelBool point = true →
          (BlockerVExactFifteenFourRowCoverage.position order point).val < 9 := by
      fin_cases order <;> decide
    have hlongPoint : ∀ point,
        BlockerVExactFifteenFourRowCoverage.longLabelBool point = true →
          boundary (labelIndex point) ∈ S.capByIndex S.oppIndex2 := by
      intro point hlong
      have hlt := hlongPosition point hlong
      let j : Fin 9 := ⟨8 -
        (BlockerVExactFifteenFourRowCoverage.position order point).val, by omega⟩
      let t : Fin B.m := Fin.cast hm.symm
        (outerCap.succAbove (inner.succAbove j))
      have hsum :
          (BlockerVExactFifteenFourRowCoverage.position order point).val +
            j.val = 8 := by
        dsimp only [j]
        omega
      have ht : Fin.cast hm t =
          outerCap.succAbove (inner.succAbove j) := by
        simp only [t, Fin.cast_cast, Fin.cast_eq_self]
      exact (pointAt point t j hsum ht) ▸ B.points_mem_cap t
    exact closeDoubleSkip boundary hboundaryInjective hboundaryImage
      hboundaryCcw rawBoundary hrawBoundaryInjective hrawBoundaryImage
      outer17 inner16 .reverse order labelIndex hlabel hposition
      houterInCap hinnerInCap huPoint hxuPoint hvPoint hxvPoint
      hdeletedPoint hcPoint hePoint hlongPoint
  rcases horders with horder | horder | horder | horder
  · rcases horder with ⟨outer, inner, _houter0, _houter9, _hinner0,
      _hinner9, huGap, hvGap, hcGap, hdGap, hxvGap, heGap, hxuGap⟩
    exact closeForward 0 outer inner 1 2 3 4 5 6 7
      huGap hvGap hcGap hdGap hxvGap heGap hxuGap
      (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
      (by decide)
  · rcases horder with ⟨outer, inner, _houter0, _houter9, _hinner0,
      _hinner9, huGap, hvGap, hcGap, hdGap, heGap, hxvGap, hxuGap⟩
    exact closeForward 1 outer inner 1 2 3 4 6 5 7
      huGap hvGap hcGap hdGap hxvGap heGap hxuGap
      (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
      (by decide)
  · rcases horder with ⟨outer, inner, _houter0, _houter9, _hinner0,
      _hinner9, hxuGap, heGap, hxvGap, hdGap, hcGap, hvGap, huGap⟩
    exact closeReverse 0 outer inner 7 6 5 4 3 2 1
      huGap hvGap hcGap hdGap hxvGap heGap hxuGap
      (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
      (by decide)
  · rcases horder with ⟨outer, inner, _houter0, _houter9, _hinner0,
      _hinner9, hxuGap, hxvGap, heGap, hdGap, hcGap, hvGap, huGap⟩
    exact closeReverse 1 outer inner 7 6 5 4 2 3 1
      huGap hvGap hcGap hdGap hxvGap heGap hxuGap
      (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
      (by decide)

/-- Exact-seventeen child with second-cap cardinality ten.  The second strict
cap has eight points: the seven named points plus one extra point.  Every source
row already has two named hits in that cap and at most two cap hits, so the
extra point lies on none of the four rows.  Skipping it embeds those complete
rows in the exact-sixteen cap-nine certificate bank. -/
theorem
    false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_eq_seventeen_secondCapTen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (hcenterDeletedInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (hcenterDeletedOffClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∉
        SelectedClass D.A S.oppApex2 P.rho)
    (hcard : D.A.card = 17)
    (hcapCard : (S.capByIndex S.oppIndex2).card = 10) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ku := (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  let Kv := (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
  let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let Kdel :=
    (Hlate.selectedAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2).toCriticalFourShell
  let Kxu := (Hlate.selectedAt packet.xu Q.hxuA).toCriticalFourShell
  let C := SelectedClass D.A S.oppApex2 P.rho
  let I := S.capInteriorByIndex S.oppIndex2
  let c :=
    Hlate.centerAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2
  let e := Hlate.centerAt packet.xu Q.hxuA
  have hnamedInfo :=
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_namedSeven
      Q hcenterV hcenterDeletedInterior hcenterDeletedOffClass
  have hnamedSubset : insert e (insert c C) ⊆ I := by
    simpa only [blockerVSecondCapNamedSeven, Hlate, e, c, C, I] using
      hnamedInfo.1
  have hnamedCard : (insert e (insert c C)).card = 7 := by
    simpa only [blockerVSecondCapNamedSeven, Hlate, e, c, C] using
      hnamedInfo.2
  have hxuInter : packet.xu ∈ Ku.support ∩ C := by
    simpa only [Ku, C, Hlate] using (show
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
      rw [packet.source_row_trace]
      simp)
  have hxuURow : packet.xu ∈ Ku.support := (Finset.mem_inter.mp hxuInter).1
  have hxuClass : packet.xu ∈ C := (Finset.mem_inter.mp hxuInter).2
  have hxvInter : packet.xv ∈ Kv.support ∩ C := by
    simpa only [C] using (show
      packet.xv ∈ Kv.support ∩ SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.opposite_row_trace]
        simp)
  have hxvVRow : packet.xv ∈ Kv.support := (Finset.mem_inter.mp hxvInter).1
  have hxvClass : packet.xv ∈ C := (Finset.mem_inter.mp hxvInter).2
  have hcenterU : Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [Hlate, P.huSource] using packet.blocker_eq_xv
  have hE : dist packet.xv P.u.1 = dist packet.xv packet.xu := by
    rw [← hcenterU]
    exact (Ku.support_eq_radius _ Ku.q_mem_support).trans
      (Ku.support_eq_radius _ hxuURow).symm
  have hD : dist P.v.1 packet.xv = dist P.v.1 P.u.1 := by
    rw [← Q.hblockerEqV]
    exact (Kxv.support_eq_radius _ Kxv.q_mem_support).trans
      (Kxv.support_eq_radius _ Q.huXvRow).symm
  have hC :
      dist P.jointDeletion.deleted.1 P.v.1 =
        dist P.jointDeletion.deleted.1 packet.xv := by
    have hraw :=
      (Kv.support_eq_radius _ Kv.q_mem_support).trans
        (Kv.support_eq_radius _ hxvVRow).symm
    simpa only [Hlate, hcenterV] using hraw
  have hB : dist e packet.xu = dist e P.jointDeletion.deleted.1 := by
    simpa only [e, Kxu] using
      (Kxu.support_eq_radius _ Kxu.q_mem_support).trans
        (Kxu.support_eq_radius _ Q.hdeletedXuRow).symm
  have hA : dist c P.jointDeletion.deleted.1 = dist c P.v.1 := by
    simpa only [c, Kdel] using
      (Kdel.support_eq_radius _ Kdel.q_mem_support).trans
        (Kdel.support_eq_radius _ Q.hvDeletedRow).symm
  have hclassInterior : C ⊆ I := by
    intro x hx
    exact hnamedSubset (by simp [hx])
  have heInterior : e ∈ I := hnamedSubset (by simp)
  have hcInterior : c ∈ I := hnamedSubset (by simp)
  have huInterior : P.u.1 ∈ I := hclassInterior P.huClass
  have hxuInterior : packet.xu ∈ I := hclassInterior hxuClass
  have hvInterior : P.v.1 ∈ I := hclassInterior P.hvClass
  have hxvInterior : packet.xv ∈ I := hclassInterior hxvClass
  have hdeletedInterior : P.jointDeletion.deleted.1 ∈ I :=
    hclassInterior P.jointDeletion.deleted_mem_class
  have huNeXu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have hvNeXv : P.v.1 ≠ packet.xv := packet.xv_ne_v.symm
  have huNeV : P.u.1 ≠ P.v.1 := by
    intro h
    exact P.huNeV (Subtype.ext h)
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply Ku.center_not_mem_support
    simpa only [hcenterU, ← h] using Ku.q_mem_support
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply Ku.center_not_mem_support
    simpa only [hcenterU, ← h] using hxuURow
  have hdelNeV : P.jointDeletion.deleted.1 ≠ P.v.1 := by
    intro h
    apply Kv.center_not_mem_support
    simpa only [Hlate, hcenterV, h] using Kv.q_mem_support
  have hdelNeXv : P.jointDeletion.deleted.1 ≠ packet.xv := by
    intro h
    apply Q.hxvNotDeletedRow
    simpa only [← h] using Kdel.q_mem_support
  have hcNeDeleted : c ≠ P.jointDeletion.deleted.1 := by
    simpa only [c, Hlate] using
      centerAt_ne_source Hlate P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2
  have hcNeV : c ≠ P.v.1 := by
    intro h
    exact hcenterDeletedOffClass (by simpa only [c, Hlate, h] using P.hvClass)
  have heNeXu : e ≠ packet.xu := by
    simpa only [e] using centerAt_ne_source Hlate packet.xu Q.hxuA
  have heNeDeleted : e ≠ P.jointDeletion.deleted.1 := by
    intro h
    apply Kxu.center_not_mem_support
    simpa only [e, h] using Q.hdeletedXuRow
  have hdelNeXu : P.jointDeletion.deleted.1 ≠ packet.xu := by
    intro h
    apply Q.hxuNotDeletedRow
    simpa only [← h] using Kdel.q_mem_support
  have hcOff : c ∉ C := by
    simpa only [c, C, Hlate] using hcenterDeletedOffClass
  have heOff : e ∉ C := by
    intro heClass
    have heInsert : e ∈ insert c C := Finset.mem_insert_of_mem heClass
    have hsmall : (insert e (insert c C)).card = 6 := by
      rw [Finset.insert_eq_self.mpr heInsert,
        Finset.card_insert_of_notMem hcOff]
      have hCcard : C.card = 5 := by
        simpa only [C] using P.hclassFive
      omega
    omega
  have heNeXv : e ≠ packet.xv := by
    intro h
    exact heOff (by simpa only [h] using hxvClass)
  rcases S.capByIndex_cgn4g_strictCapBlockData_oriented D.convex S.oppIndex2 with
    ⟨B, hBorient⟩
  have hm : B.m = 10 := B.cap_card_eq.trans hcapCard
  have interiorCap {x : ℝ²} (hx : x ∈ I) : x ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hx
  rcases B.exists_index_of_mem_cap (interiorCap huInterior) with ⟨iu, hiu⟩
  rcases B.exists_index_of_mem_cap (interiorCap hvInterior) with ⟨iv, hiv⟩
  rcases B.exists_index_of_mem_cap (interiorCap hcInterior) with ⟨ic, hic⟩
  rcases B.exists_index_of_mem_cap (interiorCap hdeletedInterior) with ⟨id, hid⟩
  rcases B.exists_index_of_mem_cap (interiorCap hxvInterior) with ⟨ixv, hixv⟩
  rcases B.exists_index_of_mem_cap (interiorCap heInterior) with ⟨ie, hie⟩
  rcases B.exists_index_of_mem_cap (interiorCap hxuInterior) with ⟨ixu, hixu⟩
  have indexBounds {x : ℝ²} (hx : x ∈ I) (i : Fin B.m)
      (hi : B.L.points i = x) : 0 < i.val ∧ i.val < B.m - 1 := by
    have hfirst : i ≠ CGN.firstIndex B.Packet.hm := by
      intro hifirst
      have hxEndpoint :
          x = (S.triangleByIndex S.oppIndex2).v2 ∨
            x = (S.triangleByIndex S.oppIndex2).v3 := by
        rcases hBorient with hb | hb
        · exact Or.inl (hi.symm.trans (by simpa only [hifirst] using hb.1))
        · exact Or.inr (hi.symm.trans (by simpa only [hifirst] using hb.1))
      rcases hxEndpoint with hxEndpoint | hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v2 hx hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v3 hx hxEndpoint
    have hlast : i ≠ CGN.lastIndex B.Packet.hm := by
      intro hilast
      have hxEndpoint :
          x = (S.triangleByIndex S.oppIndex2).v2 ∨
            x = (S.triangleByIndex S.oppIndex2).v3 := by
        rcases hBorient with hb | hb
        · exact Or.inr (hi.symm.trans (by simpa only [hilast] using hb.2))
        · exact Or.inl (hi.symm.trans (by simpa only [hilast] using hb.2))
      rcases hxEndpoint with hxEndpoint | hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v2 hx hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v3 hx hxEndpoint
    have hfirstVal : i.val ≠ 0 := by
      intro hi
      apply hfirst
      apply Fin.ext
      simpa only [CGN.firstIndex_val] using hi
    have hlastVal : i.val ≠ B.m - 1 := by
      intro hi
      apply hlast
      apply Fin.ext
      simpa only [CGN.lastIndex_val] using hi
    constructor <;> omega
  have hiuBounds := indexBounds huInterior iu hiu
  have hivBounds := indexBounds hvInterior iv hiv
  have hicBounds := indexBounds hcInterior ic hic
  have hidBounds := indexBounds hdeletedInterior id hid
  have hixvBounds := indexBounds hxvInterior ixv hixv
  have hieBounds := indexBounds heInterior ie hie
  have hixuBounds := indexBounds hxuInterior ixu hixu
  have between {j r s : Fin B.m} (hjr : B.L.points j ≠ B.L.points r)
      (hjs : B.L.points j ≠ B.L.points s)
      (hrs : B.L.points r ≠ B.L.points s)
      (heq : dist (B.L.points j) (B.L.points r) =
        dist (B.L.points j) (B.L.points s)) :
      (r < j ∧ j < s) ∨ (s < j ∧ j < r) := by
    have hjrIndex : j ≠ r := by
      intro h
      exact hjr (congrArg B.L.points h)
    have hjsIndex : j ≠ s := by
      intro h
      exact hjs (congrArg B.L.points h)
    have hrsIndex : r ≠ s := by
      intro h
      exact hrs (congrArg B.L.points h)
    rcases lt_or_gt_of_ne hrsIndex with hrs | hsr
    · exact Or.inl (CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord hrs hjrIndex hjsIndex heq)
    · exact Or.inr (CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord hsr hjsIndex hjrIndex heq.symm)
  have hXv : (iu < ixv ∧ ixv < ixu) ∨ (ixu < ixv ∧ ixv < iu) :=
    between (by simpa only [hixv, hiu] using huNeXv.symm)
      (by simpa only [hixv, hixu] using hxuNeXv.symm)
      (by simpa only [hiu, hixu] using huNeXu)
      (by simpa only [hixv, hiu, hixu] using hE)
  have hV : (iu < iv ∧ iv < ixv) ∨ (ixv < iv ∧ iv < iu) :=
    between (by simpa only [hiv, hiu] using huNeV.symm)
      (by simpa only [hiv, hixv] using hvNeXv)
      (by simpa only [hiu, hixv] using huNeXv)
      (by simpa only [hiv, hiu, hixv] using hD.symm)
  have hDel : (iv < id ∧ id < ixv) ∨ (ixv < id ∧ id < iv) :=
    between (by simpa only [hid, hiv] using hdelNeV)
      (by simpa only [hid, hixv] using hdelNeXv)
      (by simpa only [hiv, hixv] using hvNeXv)
      (by simpa only [hid, hiv, hixv] using hC)
  have hCenter : (iv < ic ∧ ic < id) ∨ (id < ic ∧ ic < iv) :=
    between (by simpa only [hic, hiv] using hcNeV)
      (by simpa only [hic, hid] using hcNeDeleted)
      (by simpa only [hiv, hid] using hdelNeV.symm)
      (by simpa only [hic, hiv, hid] using hA.symm)
  have hXuCenter : (id < ie ∧ ie < ixu) ∨ (ixu < ie ∧ ie < id) :=
    between (by simpa only [hie, hid] using heNeDeleted)
      (by simpa only [hie, hixu] using heNeXu)
      (by simpa only [hid, hixu] using hdelNeXu)
      (by simpa only [hie, hid, hixu] using hB.symm)
  have hieNeIxv : ie ≠ ixv := by
    intro h
    apply heNeXv
    calc
      e = B.L.points ie := hie.symm
      _ = B.L.points ixv := congrArg B.L.points h
      _ = packet.xv := hixv
  have horders := seven_index_order_classification_ten_of_eq hm
    iu iv ic id ixv ie ixu
    hiuBounds.1 hiuBounds.2 hivBounds.1 hivBounds.2 hicBounds.1 hicBounds.2
    hidBounds.1 hidBounds.2 hixvBounds.1 hixvBounds.2 hieBounds.1 hieBounds.2
    hixuBounds.1 hixuBounds.2 hieNeIxv hXv hV hDel hCenter hXuCenter
  have hKxvCap :
      (Kxv.support ∩ S.capByIndex S.oppIndex2).card ≤ 2 :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.oppIndex2 Kxv.toSelectedFourClass
      (by simpa only [Hlate, Q.hblockerEqV] using interiorCap hvInterior)
  have hKuCap :
      (Ku.support ∩ S.capByIndex S.oppIndex2).card ≤ 2 :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.oppIndex2 Ku.toSelectedFourClass
      (by simpa only [Hlate, hcenterU] using interiorCap hxvInterior)
  have hKvCap :
      (Kv.support ∩ S.capByIndex S.oppIndex2).card ≤ 2 :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.oppIndex2 Kv.toSelectedFourClass
      (by simpa only [Hlate, hcenterV] using interiorCap hdeletedInterior)
  have hKdelCap :
      (Kdel.support ∩ S.capByIndex S.oppIndex2).card ≤ 2 :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.oppIndex2 Kdel.toSelectedFourClass
      (by simpa only [Hlate, c] using interiorCap hcInterior)
  have closeForward
      (order : Fin 2) (gap : Fin 10)
      (ju jv jc jd jxv je jxu : Fin 9)
      (huGap : Fin.cast hm iu = gap.succAbove ju)
      (hvGap : Fin.cast hm iv = gap.succAbove jv)
      (hcGap : Fin.cast hm ic = gap.succAbove jc)
      (hdGap : Fin.cast hm id = gap.succAbove jd)
      (hxvGap : Fin.cast hm ixv = gap.succAbove jxv)
      (heGap : Fin.cast hm ie = gap.succAbove je)
      (hxuGap : Fin.cast hm ixu = gap.succAbove jxu)
      (huPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 6).val = ju.val)
      (hvPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 8).val = jv.val)
      (hcPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 11).val = jc.val)
      (hdPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 10).val = jd.val)
      (hxvPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 9).val = jxv.val)
      (hePos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 12).val = je.val)
      (hxuPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 7).val = jxu.val) :
      False := by
    let shifted : Fin B.n → ℝ² := fun point => B.phi (point + B.Block.lo)
    let boundary : Fin D.A.card → ℝ² := fun point =>
      shifted (Fin.cast B.ambient_card_eq.symm point)
    let gap17 : Fin 17 := Fin.castLE (by omega) gap
    let boundary17 : Fin 17 → ℝ² := fun point =>
      boundary (Fin.cast hcard.symm point)
    let labelIndex : Fin 16 → Fin D.A.card := fun point =>
      Fin.cast hcard.symm
        (gap17.succAbove
          (BlockerVExactSixteenFourRowCoverage.position order 0 point))
    have hshiftedInjective : Function.Injective shifted := by
      simpa only [shifted] using
        injective_cyclicShift B.phi_injective B.Block.lo
    have hboundaryInjective : Function.Injective boundary := by
      simpa only [boundary] using
        injective_finCast_domain B.ambient_card_eq hshiftedInjective
    have hboundary17Injective : Function.Injective boundary17 := by
      intro x y hxy
      apply Fin.cast_injective hcard.symm
      exact hboundaryInjective hxy
    have hshiftedImage : Finset.univ.image shifted = D.A := by
      calc
        Finset.univ.image shifted = Finset.univ.image B.phi := by
          simpa only [shifted] using
            image_univ_cyclicShift B.phi B.Block.lo
        _ = D.A := B.Block.phi_image
    have hboundaryImage : Finset.univ.image boundary = D.A := by
      simpa only [boundary] using
        (image_univ_finCast_domain B.ambient_card_eq shifted).trans
          hshiftedImage
    have hboundary17Image : Finset.univ.image boundary17 = D.A := by
      simpa only [boundary17] using
        (image_univ_finCast_domain hcard boundary).trans hboundaryImage
    have hshiftedCcw : EuclideanGeometry.IsCcwConvexPolygon shifted := by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift B.phi_injective B.phi_ccw B.Block.lo
    have hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
      simpa only [boundary] using
        ccw_finCast_domain B.ambient_card_eq hshiftedCcw
    have hposition :
        BlockerVExactSixteenFourRowCoverage.PositionEmbedding
          .forward order 0 labelIndex := by
      simpa only [labelIndex, Fin.val_cast] using
        skip_exactSixteen_position_embedding_forward gap17 order
    have pointAt (point : Fin 16) (t : Fin B.m) (j : Fin 9)
        (hpoint :
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).val = j.val)
        (ht : Fin.cast hm t = gap.succAbove j) :
        boundary (labelIndex point) = B.L.points t := by
      have hskip := gapTen_castLE_succAbove_val_exactSeventeen gap
        (BlockerVExactSixteenFourRowCoverage.position order 0 point) j hpoint
      have htVal : t.val = (gap.succAbove j).val := by
        simpa only [Fin.val_cast] using congrArg Fin.val ht
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm
                (gap17.succAbove
                  (BlockerVExactSixteenFourRowCoverage.position order 0 point))) =
            Fin.castLE (by have hspan := B.block_span; omega) t := by
        apply Fin.ext
        simpa only [Fin.val_cast, Fin.val_castLE, gap17] using
          (show
            (gap17.succAbove
                (BlockerVExactSixteenFourRowCoverage.position order 0 point)).val =
              t.val from hskip.trans htVal.symm)
      simpa only [boundary, shifted, labelIndex, hcast] using
        B.shifted_phi_cast_eq_points t
    let gapB : Fin B.m := Fin.cast hm.symm gap
    have hgapPoint : boundary17 gap17 = B.L.points gapB := by
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm gap17) =
            Fin.castLE (by have hspan := B.block_span; omega) gapB := by
        apply Fin.ext
        simp only [Fin.val_cast, Fin.val_castLE, gap17, gapB]
      simpa only [boundary17, boundary, shifted, hcast] using
        B.shifted_phi_cast_eq_points gapB
    have hgapCap : boundary17 gap17 ∈ S.capByIndex S.oppIndex2 := by
      rw [hgapPoint]
      exact B.points_mem_cap gapB
    have hgapNeLabel (point : Fin 16) :
        boundary17 gap17 ≠ boundary (labelIndex point) := by
      intro h
      have hindex := hboundary17Injective (by
        simpa only [boundary17, labelIndex] using h)
      exact (gap17.succAbove_ne
        (BlockerVExactSixteenFourRowCoverage.position order 0 point)) hindex.symm
    have huPoint := (pointAt 6 iu ju huPos huGap).trans hiu
    have hvPoint := (pointAt 8 iv jv hvPos hvGap).trans hiv
    have hcPoint := (pointAt 11 ic jc hcPos hcGap).trans hic
    have hdeletedPoint := (pointAt 10 id jd hdPos hdGap).trans hid
    have hxvPoint := (pointAt 9 ixv jxv hxvPos hxvGap).trans hixv
    have hePoint := (pointAt 12 ie je hePos heGap).trans hie
    have hxuPoint := (pointAt 7 ixu jxu hxuPos hxuGap).trans hixu
    have hgapNeU : boundary17 gap17 ≠ P.u.1 := by
      intro h
      exact hgapNeLabel 6 (h.trans huPoint.symm)
    have hgapNeV : boundary17 gap17 ≠ P.v.1 := by
      intro h
      exact hgapNeLabel 8 (h.trans hvPoint.symm)
    have hgapNeDeleted :
        boundary17 gap17 ≠ P.jointDeletion.deleted.1 := by
      intro h
      exact hgapNeLabel 10 (h.trans hdeletedPoint.symm)
    have hgapNeXv : boundary17 gap17 ≠ packet.xv := by
      intro h
      exact hgapNeLabel 9 (h.trans hxvPoint.symm)
    have hgapNeXu : boundary17 gap17 ≠ packet.xu := by
      intro h
      exact hgapNeLabel 7 (h.trans hxuPoint.symm)
    have hgapNotKxv : boundary17 gap17 ∉ Kxv.support :=
      not_mem_of_inter_card_le_two_of_three_cap_points
        hgapCap (interiorCap huInterior) (interiorCap hxvInterior)
        Q.huXvRow Kxv.q_mem_support hgapNeU hgapNeXv huNeXv hKxvCap
    have hgapNotKu : boundary17 gap17 ∉ Ku.support :=
      not_mem_of_inter_card_le_two_of_three_cap_points
        hgapCap (interiorCap huInterior) (interiorCap hxuInterior)
        Ku.q_mem_support hxuURow hgapNeU hgapNeXu huNeXu hKuCap
    have hgapNotKv : boundary17 gap17 ∉ Kv.support :=
      not_mem_of_inter_card_le_two_of_three_cap_points
        hgapCap (interiorCap hvInterior) (interiorCap hxvInterior)
        Kv.q_mem_support hxvVRow hgapNeV hgapNeXv hvNeXv hKvCap
    have hgapNotKdel : boundary17 gap17 ∉ Kdel.support :=
      not_mem_of_inter_card_le_two_of_three_cap_points
        hgapCap (interiorCap hdeletedInterior) (interiorCap hvInterior)
        Kdel.q_mem_support Q.hvDeletedRow hgapNeDeleted hgapNeV
        hdelNeV hKdelCap
    have hpositionSurjective : Function.Surjective
        (BlockerVExactSixteenFourRowCoverage.position order 0) :=
      Finite.injective_iff_surjective.mp
        (BlockerVExactSixteenFourRowCoverage.position_injective order 0)
    have hKxvCovered :
        Kxv.support ⊆ Finset.univ.image
          (fun point : Fin 16 => boundary (labelIndex point)) := by
      change Kxv.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundary17
          (gap17.succAbove
            (BlockerVExactSixteenFourRowCoverage.position order 0 point)))
      exact support_subset_image_skip_reindex hboundary17Image
        Kxv.support_subset_A gap17 hgapNotKxv _ hpositionSurjective
    have hKuCovered :
        Ku.support ⊆ Finset.univ.image
          (fun point : Fin 16 => boundary (labelIndex point)) := by
      change Ku.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundary17
          (gap17.succAbove
            (BlockerVExactSixteenFourRowCoverage.position order 0 point)))
      exact support_subset_image_skip_reindex hboundary17Image
        Ku.support_subset_A gap17 hgapNotKu _ hpositionSurjective
    have hKvCovered :
        Kv.support ⊆ Finset.univ.image
          (fun point : Fin 16 => boundary (labelIndex point)) := by
      change Kv.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundary17
          (gap17.succAbove
            (BlockerVExactSixteenFourRowCoverage.position order 0 point)))
      exact support_subset_image_skip_reindex hboundary17Image
        Kv.support_subset_A gap17 hgapNotKv _ hpositionSurjective
    have hKdelCovered :
        Kdel.support ⊆ Finset.univ.image
          (fun point : Fin 16 => boundary (labelIndex point)) := by
      change Kdel.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundary17
          (gap17.succAbove
            (BlockerVExactSixteenFourRowCoverage.position order 0 point)))
      exact support_subset_image_skip_reindex hboundary17Image
        Kdel.support_subset_A gap17 hgapNotKdel _ hpositionSurjective
    have hlongPosition : ∀ point,
        BlockerVExactSixteenFourRowCoverage.longLabelBool point = true →
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).val < 9 := by
      fin_cases order <;> decide
    have hlongPoint : ∀ point,
        BlockerVExactSixteenFourRowCoverage.longLabelBool point = true →
          boundary (labelIndex point) ∈ S.capByIndex S.oppIndex2 := by
      intro point hlong
      have hlt := hlongPosition point hlong
      change B.phi
        (Fin.cast B.ambient_card_eq.symm
            (Fin.cast hcard.symm
              (gap17.succAbove
                (BlockerVExactSixteenFourRowCoverage.position order 0 point))) +
          B.Block.lo) ∈ S.capByIndex S.oppIndex2
      rw [B.shifted_phi_mem_cap_iff]
      change
        (gap17.succAbove
          (BlockerVExactSixteenFourRowCoverage.position order 0 point)).val < B.m
      have hgapLt : gap.val < 10 := gap.isLt
      simp only [gap17]
      by_cases hp :
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).castSucc <
            Fin.castLE (by omega) gap
      · rw [Fin.succAbove_of_castSucc_lt _ _ hp]
        simp only [Fin.val_castSucc]
        omega
      · rw [Fin.succAbove_of_le_castSucc _ _ (le_of_not_gt hp)]
        simp only [Fin.val_succ]
        omega
    exact false_of_blockerVExactSixteen_bank_of_covered_source_rows
      Q hcenterV boundary hboundaryInjective hboundaryImage hboundaryCcw
      .forward order 0 labelIndex hposition hKxvCovered hKuCovered hKvCovered
      hKdelCovered hvInterior hxvInterior hdeletedInterior hcInterior
      huPoint hxuPoint hvPoint hxvPoint hdeletedPoint hcPoint hePoint hlongPoint
  have closeReverse
      (order : Fin 2) (gap : Fin 10)
      (ju jv jc jd jxv je jxu : Fin 9)
      (huGap : Fin.cast hm iu = gap.succAbove ju)
      (hvGap : Fin.cast hm iv = gap.succAbove jv)
      (hcGap : Fin.cast hm ic = gap.succAbove jc)
      (hdGap : Fin.cast hm id = gap.succAbove jd)
      (hxvGap : Fin.cast hm ixv = gap.succAbove jxv)
      (heGap : Fin.cast hm ie = gap.succAbove je)
      (hxuGap : Fin.cast hm ixu = gap.succAbove jxu)
      (huPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 6).val + ju.val = 8)
      (hvPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 8).val + jv.val = 8)
      (hcPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 11).val + jc.val = 8)
      (hdPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 10).val + jd.val = 8)
      (hxvPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 9).val + jxv.val = 8)
      (hePos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 12).val + je.val = 8)
      (hxuPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 7).val + jxu.val = 8) :
      False := by
    letI : NeZero B.n := ⟨by have hspan := B.block_span; omega⟩
    let cut : Fin B.n := ⟨(B.Block.hi.val + 1) % B.n,
      Nat.mod_lt _ (by have := B.Block.hi.isLt; omega)⟩
    let shifted : Fin B.n → ℝ² := fun point => B.phi (point + cut)
    let boundary : Fin D.A.card → ℝ² := fun point =>
      shifted (Fin.cast B.ambient_card_eq.symm point)
    let boundary17 : Fin 17 → ℝ² := fun point =>
      boundary (Fin.cast hcard.symm point)
    let gapR : Fin 10 := reverseGapTen gap
    let gap17 : Fin 17 := Fin.castLE (by omega) gapR
    let hole17 : Fin 17 := Fin.rev gap17
    let labelIndex : Fin 16 → Fin D.A.card := fun point =>
      Fin.cast hcard.symm
        (Fin.rev
          (gap17.succAbove
            (BlockerVExactSixteenFourRowCoverage.position order 0 point)))
    have hshiftedInjective : Function.Injective shifted := by
      simpa only [shifted] using injective_cyclicShift B.phi_injective cut
    have hboundaryInjective : Function.Injective boundary := by
      simpa only [boundary] using
        injective_finCast_domain B.ambient_card_eq hshiftedInjective
    have hboundary17Injective : Function.Injective boundary17 := by
      intro x y hxy
      apply Fin.cast_injective hcard.symm
      exact hboundaryInjective hxy
    have hshiftedImage : Finset.univ.image shifted = D.A := by
      calc
        Finset.univ.image shifted = Finset.univ.image B.phi := by
          simpa only [shifted] using image_univ_cyclicShift B.phi cut
        _ = D.A := B.Block.phi_image
    have hboundaryImage : Finset.univ.image boundary = D.A := by
      simpa only [boundary] using
        (image_univ_finCast_domain B.ambient_card_eq shifted).trans
          hshiftedImage
    have hboundary17Image : Finset.univ.image boundary17 = D.A := by
      simpa only [boundary17] using
        (image_univ_finCast_domain hcard boundary).trans hboundaryImage
    have hshiftedCcw : EuclideanGeometry.IsCcwConvexPolygon shifted := by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift B.phi_injective B.phi_ccw cut
    have hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
      simpa only [boundary] using
        ccw_finCast_domain B.ambient_card_eq hshiftedCcw
    have hposition :
        BlockerVExactSixteenFourRowCoverage.PositionEmbedding
          .reverse order 0 labelIndex := by
      simpa only [labelIndex, Fin.val_cast] using
        skip_exactSixteen_position_embedding_reverse gap17 order
    have pointAt (point : Fin 16) (t : Fin B.m) (j : Fin 9)
        (hsum :
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).val +
            j.val = 8)
        (ht : Fin.cast hm t = gap.succAbove j) :
        boundary (labelIndex point) = B.L.points t := by
      have htVal : t.val = (gap.succAbove j).val := by
        simpa only [Fin.val_cast] using congrArg Fin.val ht
      have hsum9 :
          (gap17.succAbove
              (BlockerVExactSixteenFourRowCoverage.position order 0 point)).val +
            t.val = 9 := by
        have hrev := reverseGapTen_castLE_succAbove_sum_exactSeventeen gap
          (BlockerVExactSixteenFourRowCoverage.position order 0 point) j hsum
        simpa only [gap17, htVal] using hrev
      let offset : Fin B.n := ⟨B.n - B.m + t.val, by
        have hspan := B.block_span
        have hmpos := B.Block.hm
        omega⟩
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm
                (Fin.rev
                  (gap17.succAbove
                    (BlockerVExactSixteenFourRowCoverage.position order 0 point)))) =
            offset := by
        apply Fin.ext
        simp only [Fin.val_cast, Fin.val_rev]
        dsimp only [offset]
        have hn : B.n = 17 := B.ambient_card_eq.trans hcard
        omega
      simpa only [boundary, shifted, labelIndex, cut, hcast, offset] using
        B.shifted_after_block_phi_cast_eq_points t
    let gapB : Fin B.m := Fin.cast hm.symm gap
    have hgapPoint : boundary17 hole17 = B.L.points gapB := by
      have hgapBVal : gapB.val = gap.val := by
        simp only [gapB, Fin.val_cast]
      have hgap17Val : gap17.val = 9 - gap.val := by
        simp only [gap17, Fin.val_castLE, gapR, reverseGapTen]
      let offset : Fin B.n := ⟨B.n - B.m + gapB.val, by
        have hspan := B.block_span
        have hmpos := B.Block.hm
        omega⟩
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm hole17) = offset := by
        apply Fin.ext
        simp only [Fin.val_cast, hole17, Fin.val_rev]
        dsimp only [offset]
        have hn : B.n = 17 := B.ambient_card_eq.trans hcard
        rw [hgap17Val, hgapBVal, hn, hm]
        omega
      simpa only [boundary17, boundary, shifted, hole17, cut, hcast, offset] using
        B.shifted_after_block_phi_cast_eq_points gapB
    have hgapCap : boundary17 hole17 ∈ S.capByIndex S.oppIndex2 := by
      rw [hgapPoint]
      exact B.points_mem_cap gapB
    have hgapNeLabel (point : Fin 16) :
        boundary17 hole17 ≠ boundary (labelIndex point) := by
      intro h
      have hindex :
          hole17 = Fin.rev
            (gap17.succAbove
              (BlockerVExactSixteenFourRowCoverage.position order 0 point)) :=
        hboundary17Injective (by
          simpa only [boundary17, labelIndex] using h)
      have hrevIndex := Fin.rev_injective hindex
      exact (gap17.succAbove_ne
        (BlockerVExactSixteenFourRowCoverage.position order 0 point))
          hrevIndex.symm
    have huPoint := (pointAt 6 iu ju huPos huGap).trans hiu
    have hvPoint := (pointAt 8 iv jv hvPos hvGap).trans hiv
    have hcPoint := (pointAt 11 ic jc hcPos hcGap).trans hic
    have hdeletedPoint := (pointAt 10 id jd hdPos hdGap).trans hid
    have hxvPoint := (pointAt 9 ixv jxv hxvPos hxvGap).trans hixv
    have hePoint := (pointAt 12 ie je hePos heGap).trans hie
    have hxuPoint := (pointAt 7 ixu jxu hxuPos hxuGap).trans hixu
    have hgapNeU : boundary17 hole17 ≠ P.u.1 := by
      intro h
      exact hgapNeLabel 6 (h.trans huPoint.symm)
    have hgapNeV : boundary17 hole17 ≠ P.v.1 := by
      intro h
      exact hgapNeLabel 8 (h.trans hvPoint.symm)
    have hgapNeDeleted :
        boundary17 hole17 ≠ P.jointDeletion.deleted.1 := by
      intro h
      exact hgapNeLabel 10 (h.trans hdeletedPoint.symm)
    have hgapNeXv : boundary17 hole17 ≠ packet.xv := by
      intro h
      exact hgapNeLabel 9 (h.trans hxvPoint.symm)
    have hgapNeXu : boundary17 hole17 ≠ packet.xu := by
      intro h
      exact hgapNeLabel 7 (h.trans hxuPoint.symm)
    have hgapNotKxv : boundary17 hole17 ∉ Kxv.support :=
      not_mem_of_inter_card_le_two_of_three_cap_points
        hgapCap (interiorCap huInterior) (interiorCap hxvInterior)
        Q.huXvRow Kxv.q_mem_support hgapNeU hgapNeXv huNeXv hKxvCap
    have hgapNotKu : boundary17 hole17 ∉ Ku.support :=
      not_mem_of_inter_card_le_two_of_three_cap_points
        hgapCap (interiorCap huInterior) (interiorCap hxuInterior)
        Ku.q_mem_support hxuURow hgapNeU hgapNeXu huNeXu hKuCap
    have hgapNotKv : boundary17 hole17 ∉ Kv.support :=
      not_mem_of_inter_card_le_two_of_three_cap_points
        hgapCap (interiorCap hvInterior) (interiorCap hxvInterior)
        Kv.q_mem_support hxvVRow hgapNeV hgapNeXv hvNeXv hKvCap
    have hgapNotKdel : boundary17 hole17 ∉ Kdel.support :=
      not_mem_of_inter_card_le_two_of_three_cap_points
        hgapCap (interiorCap hdeletedInterior) (interiorCap hvInterior)
        Kdel.q_mem_support Q.hvDeletedRow hgapNeDeleted hgapNeV
        hdelNeV hKdelCap
    let boundaryRev : Fin 17 → ℝ² := fun point => boundary17 (Fin.rev point)
    have hboundaryRevImage : Finset.univ.image boundaryRev = D.A := by
      rw [← hboundary17Image]
      ext point
      constructor
      · intro hpoint
        rcases Finset.mem_image.mp hpoint with ⟨index, _hindex, rfl⟩
        exact Finset.mem_image.mpr
          ⟨Fin.rev index, Finset.mem_univ _, by simp only [boundaryRev]⟩
      · intro hpoint
        rcases Finset.mem_image.mp hpoint with ⟨index, _hindex, rfl⟩
        exact Finset.mem_image.mpr
          ⟨Fin.rev index, Finset.mem_univ _, by
            simp only [boundaryRev, Fin.rev_rev]⟩
    have hpositionSurjective : Function.Surjective
        (BlockerVExactSixteenFourRowCoverage.position order 0) :=
      Finite.injective_iff_surjective.mp
        (BlockerVExactSixteenFourRowCoverage.position_injective order 0)
    have hKxvCovered :
        Kxv.support ⊆ Finset.univ.image
          (fun point : Fin 16 => boundary (labelIndex point)) := by
      change Kxv.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundaryRev
          (gap17.succAbove
            (BlockerVExactSixteenFourRowCoverage.position order 0 point)))
      exact support_subset_image_skip_reindex hboundaryRevImage
        Kxv.support_subset_A gap17 (by simpa only [boundaryRev, hole17])
          _ hpositionSurjective
    have hKuCovered :
        Ku.support ⊆ Finset.univ.image
          (fun point : Fin 16 => boundary (labelIndex point)) := by
      change Ku.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundaryRev
          (gap17.succAbove
            (BlockerVExactSixteenFourRowCoverage.position order 0 point)))
      exact support_subset_image_skip_reindex hboundaryRevImage
        Ku.support_subset_A gap17 (by simpa only [boundaryRev, hole17])
          _ hpositionSurjective
    have hKvCovered :
        Kv.support ⊆ Finset.univ.image
          (fun point : Fin 16 => boundary (labelIndex point)) := by
      change Kv.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundaryRev
          (gap17.succAbove
            (BlockerVExactSixteenFourRowCoverage.position order 0 point)))
      exact support_subset_image_skip_reindex hboundaryRevImage
        Kv.support_subset_A gap17 (by simpa only [boundaryRev, hole17])
          _ hpositionSurjective
    have hKdelCovered :
        Kdel.support ⊆ Finset.univ.image
          (fun point : Fin 16 => boundary (labelIndex point)) := by
      change Kdel.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundaryRev
          (gap17.succAbove
            (BlockerVExactSixteenFourRowCoverage.position order 0 point)))
      exact support_subset_image_skip_reindex hboundaryRevImage
        Kdel.support_subset_A gap17 (by simpa only [boundaryRev, hole17])
          _ hpositionSurjective
    have hlongPosition : ∀ point,
        BlockerVExactSixteenFourRowCoverage.longLabelBool point = true →
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).val < 9 := by
      fin_cases order <;> decide
    have hlongPoint : ∀ point,
        BlockerVExactSixteenFourRowCoverage.longLabelBool point = true →
          boundary (labelIndex point) ∈ S.capByIndex S.oppIndex2 := by
      intro point hlong
      have hlt := hlongPosition point hlong
      let j : Fin 9 := ⟨8 -
        (BlockerVExactSixteenFourRowCoverage.position order 0 point).val, by omega⟩
      let t : Fin B.m := Fin.cast hm.symm (gap.succAbove j)
      have hsum :
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).val +
            j.val = 8 := by
        dsimp only [j]
        omega
      have ht : Fin.cast hm t = gap.succAbove j := by
        simp only [t, Fin.cast_cast, Fin.cast_eq_self]
      exact (pointAt point t j hsum ht) ▸ B.points_mem_cap t
    exact false_of_blockerVExactSixteen_bank_of_covered_source_rows
      Q hcenterV boundary hboundaryInjective hboundaryImage hboundaryCcw
      .reverse order 0 labelIndex hposition hKxvCovered hKuCovered hKvCovered
      hKdelCovered hvInterior hxvInterior hdeletedInterior hcInterior
      huPoint hxuPoint hvPoint hxvPoint hdeletedPoint hcPoint hePoint hlongPoint
  rcases horders with horder | horder | horder | horder
  · rcases horder with ⟨gap, _hgap0, _hgap9, huGap, hvGap, hcGap, hdGap,
      hxvGap, heGap, hxuGap⟩
    exact closeForward 0 gap 1 2 3 4 5 6 7
      huGap hvGap hcGap hdGap hxvGap heGap hxuGap
      (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
      (by decide)
  · rcases horder with ⟨gap, _hgap0, _hgap9, huGap, hvGap, hcGap, hdGap,
      heGap, hxvGap, hxuGap⟩
    exact closeForward 1 gap 1 2 3 4 6 5 7
      huGap hvGap hcGap hdGap hxvGap heGap hxuGap
      (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
      (by decide)
  · rcases horder with ⟨gap, _hgap0, _hgap9, hxuGap, heGap, hxvGap, hdGap,
      hcGap, hvGap, huGap⟩
    exact closeReverse 0 gap 7 6 5 4 3 2 1
      huGap hvGap hcGap hdGap hxvGap heGap hxuGap
      (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
      (by decide)
  · rcases horder with ⟨gap, _hgap0, _hgap9, hxuGap, hxvGap, heGap, hdGap,
      hcGap, hvGap, huGap⟩
    exact closeReverse 1 gap 7 6 5 4 2 3 1
      huGap hvGap hcGap hdGap hxvGap heGap hxuGap
      (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
      (by decide)


/-- Exact-cardinality-sixteen closure of the sole deleted-row `BlockerV`
residual.  Cap arithmetic leaves only second-cap cardinalities nine and ten,
which are discharged by the two certificate adapters above. -/
theorem
    false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_eq_sixteen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (hcenterDeletedInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (hcenterDeletedOffClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∉
        SelectedClass D.A S.oppApex2 P.rho)
    (hcard : D.A.card = 16) :
    False := by
  by_cases hcapCard : (S.capByIndex S.oppIndex2).card = 10
  · exact
      false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_eq_sixteen_secondCapTen
        Q hcenterV hcenterDeletedInterior hcenterDeletedOffClass hcard hcapCard
  · have hnamed :=
      exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_namedSeven
        Q hcenterV hcenterDeletedInterior hcenterDeletedOffClass
    have hcapAdd :=
      ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
        S S.oppIndex2
    rw [capByIndex_oppIndex2_eq_oppCap2_sourceHeavy S] at hcapAdd
    have hsum := S.capSum
    have hsurplus := S.surplus_card_gt_four
    have hfirst := P.surface.firstOppCap_card_ge_four
    have hsecondLower : 9 ≤ S.oppCap2.card := by
      have hIcard : 7 ≤ (S.capInteriorByIndex S.oppIndex2).card := by
        have hle := Finset.card_le_card hnamed.1
        omega
      omega
    have hsecondNine : S.oppCap2.card = 9 := by
      have hsecondNotTen : S.oppCap2.card ≠ 10 := by
        simpa only [capByIndex_oppIndex2_eq_oppCap2_sourceHeavy S] using hcapCard
      omega
    have hcapNine : (S.capByIndex S.oppIndex2).card = 9 := by
      simpa only [capByIndex_oppIndex2_eq_oppCap2_sourceHeavy S] using hsecondNine
    exact
      false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_eq_sixteen_secondCapNine
        Q hcenterV hcenterDeletedInterior hcenterDeletedOffClass hcard hcapNine

/-- If one outside carrier point is unused by all four old rows, omit it from
the cyclic labeling and replay the exact-sixteen four-row certificate. -/
theorem
    false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_eq_seventeen_secondCapNine_of_unusedOutside
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (hcenterDeletedInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (hcenterDeletedOffClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∉
        SelectedClass D.A S.oppApex2 P.rho)
    (hcard : D.A.card = 17)
    (unused : ℝ²)
    (hunusedA : unused ∈ D.A)
    (hunusedCap : unused ∉ S.capByIndex S.oppIndex2)
    (hunusedKxv :
      unused ∉ ((lateFirstApexSystem R).selectedAt packet.xv Q.hxvA).toCriticalFourShell.support)
    (hunusedKu :
      unused ∉ ((lateFirstApexSystem R).selectedAt P.u.1 P.u.2).toCriticalFourShell.support)
    (hunusedKv :
      unused ∉ ((lateFirstApexSystem R).selectedAt P.v.1 P.v.2).toCriticalFourShell.support)
    (hunusedKdel :
      unused ∉ ((lateFirstApexSystem R).selectedAt P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2).toCriticalFourShell.support)
    (hcapCard : (S.capByIndex S.oppIndex2).card = 9) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ku := (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  let Kv := (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
  let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let Kdel :=
    (Hlate.selectedAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2).toCriticalFourShell
  let Kxu := (Hlate.selectedAt packet.xu Q.hxuA).toCriticalFourShell
  let C := SelectedClass D.A S.oppApex2 P.rho
  let I := S.capInteriorByIndex S.oppIndex2
  let c :=
    Hlate.centerAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2
  let e := Hlate.centerAt packet.xu Q.hxuA
  have hnamedInfo :=
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_namedSeven
      Q hcenterV hcenterDeletedInterior hcenterDeletedOffClass
  have hcapAdd :=
    ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
      S S.oppIndex2
  have hIcard : I.card = 7 := by
    have hcapAdd' : I.card + 2 =
        (S.capByIndex S.oppIndex2).card := by
      simpa only [I] using hcapAdd
    omega
  have hnamedSet : blockerVSecondCapNamedSeven Q = I := by
    apply Finset.eq_of_subset_of_card_le hnamedInfo.1
    rw [hnamedInfo.2, hIcard]
  have hnamed : insert e (insert c C) = I := by
    simpa only [blockerVSecondCapNamedSeven, Hlate, e, c, C, I] using hnamedSet
  have hxuInter : packet.xu ∈ Ku.support ∩ C := by
    simpa only [Ku, C, Hlate] using (show
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
      rw [packet.source_row_trace]
      simp)
  have hxuURow : packet.xu ∈ Ku.support := (Finset.mem_inter.mp hxuInter).1
  have hxuClass : packet.xu ∈ C := (Finset.mem_inter.mp hxuInter).2
  have hxvInter : packet.xv ∈ Kv.support ∩ C := by
    simpa only [C] using (show
      packet.xv ∈ Kv.support ∩ SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.opposite_row_trace]
        simp)
  have hxvVRow : packet.xv ∈ Kv.support := (Finset.mem_inter.mp hxvInter).1
  have hxvClass : packet.xv ∈ C := (Finset.mem_inter.mp hxvInter).2
  have hcenterU : Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [Hlate, P.huSource] using packet.blocker_eq_xv
  have hE : dist packet.xv P.u.1 = dist packet.xv packet.xu := by
    rw [← hcenterU]
    exact (Ku.support_eq_radius _ Ku.q_mem_support).trans
      (Ku.support_eq_radius _ hxuURow).symm
  have hD : dist P.v.1 packet.xv = dist P.v.1 P.u.1 := by
    rw [← Q.hblockerEqV]
    exact (Kxv.support_eq_radius _ Kxv.q_mem_support).trans
      (Kxv.support_eq_radius _ Q.huXvRow).symm
  have hC :
      dist P.jointDeletion.deleted.1 P.v.1 =
        dist P.jointDeletion.deleted.1 packet.xv := by
    have hraw :=
      (Kv.support_eq_radius _ Kv.q_mem_support).trans
        (Kv.support_eq_radius _ hxvVRow).symm
    simpa only [Hlate, hcenterV] using hraw
  have hB : dist e packet.xu = dist e P.jointDeletion.deleted.1 := by
    simpa only [e, Kxu] using
      (Kxu.support_eq_radius _ Kxu.q_mem_support).trans
        (Kxu.support_eq_radius _ Q.hdeletedXuRow).symm
  have hA : dist c P.jointDeletion.deleted.1 = dist c P.v.1 := by
    simpa only [c, Kdel] using
      (Kdel.support_eq_radius _ Kdel.q_mem_support).trans
        (Kdel.support_eq_radius _ Q.hvDeletedRow).symm
  have hclassInterior : C ⊆ I := by
    intro x hx
    rw [← hnamed]
    simp [hx]
  have heInterior : e ∈ I := by rw [← hnamed]; simp
  have hcInterior : c ∈ I := by rw [← hnamed]; simp
  have huInterior : P.u.1 ∈ I := hclassInterior P.huClass
  have hxuInterior : packet.xu ∈ I := hclassInterior hxuClass
  have hvInterior : P.v.1 ∈ I := hclassInterior P.hvClass
  have hxvInterior : packet.xv ∈ I := hclassInterior hxvClass
  have hdeletedInterior : P.jointDeletion.deleted.1 ∈ I :=
    hclassInterior P.jointDeletion.deleted_mem_class
  have huNeXu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have hvNeXv : P.v.1 ≠ packet.xv := packet.xv_ne_v.symm
  have huNeV : P.u.1 ≠ P.v.1 := by
    intro h
    exact P.huNeV (Subtype.ext h)
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply Ku.center_not_mem_support
    simpa only [hcenterU, ← h] using Ku.q_mem_support
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply Ku.center_not_mem_support
    simpa only [hcenterU, ← h] using hxuURow
  have hdelNeV : P.jointDeletion.deleted.1 ≠ P.v.1 := by
    intro h
    apply Kv.center_not_mem_support
    simpa only [Hlate, hcenterV, h] using Kv.q_mem_support
  have hdelNeXv : P.jointDeletion.deleted.1 ≠ packet.xv := by
    intro h
    apply Q.hxvNotDeletedRow
    simpa only [← h] using Kdel.q_mem_support
  have hcNeDeleted : c ≠ P.jointDeletion.deleted.1 := by
    simpa only [c, Hlate] using
      centerAt_ne_source Hlate P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2
  have hcNeV : c ≠ P.v.1 := by
    intro h
    exact hcenterDeletedOffClass (by simpa only [c, Hlate, h] using P.hvClass)
  have heNeXu : e ≠ packet.xu := by
    simpa only [e] using centerAt_ne_source Hlate packet.xu Q.hxuA
  have heNeDeleted : e ≠ P.jointDeletion.deleted.1 := by
    intro h
    apply Kxu.center_not_mem_support
    simpa only [e, h] using Q.hdeletedXuRow
  have hdelNeXu : P.jointDeletion.deleted.1 ≠ packet.xu := by
    intro h
    apply Q.hxuNotDeletedRow
    simpa only [← h] using Kdel.q_mem_support
  have hcOff : c ∉ C := by
    simpa only [c, C, Hlate] using hcenterDeletedOffClass
  have hnamedInfo :=
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_namedSeven
      Q hcenterV hcenterDeletedInterior hcenterDeletedOffClass
  have hnamedCard : (insert e (insert c C)).card = 7 := by
    simpa only [blockerVSecondCapNamedSeven, Hlate, e, c, C] using hnamedInfo.2
  have heOff : e ∉ C := by
    intro heClass
    have heInsert : e ∈ insert c C := Finset.mem_insert_of_mem heClass
    have hsmall : (insert e (insert c C)).card = 6 := by
      rw [Finset.insert_eq_self.mpr heInsert,
        Finset.card_insert_of_notMem hcOff]
      have hCcard : C.card = 5 := by
        simpa only [C] using P.hclassFive
      omega
    omega
  have heNeXv : e ≠ packet.xv := by
    intro h
    exact heOff (by simpa only [h] using hxvClass)
  rcases S.capByIndex_cgn4g_strictCapBlockData_oriented D.convex S.oppIndex2 with
    ⟨B, hBorient⟩
  have hm : B.m = 9 := B.cap_card_eq.trans hcapCard
  have interiorCap {x : ℝ²} (hx : x ∈ I) : x ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hx
  rcases B.exists_index_of_mem_cap (interiorCap huInterior) with ⟨iu, hiu⟩
  rcases B.exists_index_of_mem_cap (interiorCap hvInterior) with ⟨iv, hiv⟩
  rcases B.exists_index_of_mem_cap (interiorCap hcInterior) with ⟨ic, hic⟩
  rcases B.exists_index_of_mem_cap (interiorCap hdeletedInterior) with ⟨id, hid⟩
  rcases B.exists_index_of_mem_cap (interiorCap hxvInterior) with ⟨ixv, hixv⟩
  rcases B.exists_index_of_mem_cap (interiorCap heInterior) with ⟨ie, hie⟩
  rcases B.exists_index_of_mem_cap (interiorCap hxuInterior) with ⟨ixu, hixu⟩
  have indexBounds {x : ℝ²} (hx : x ∈ I) (i : Fin B.m)
      (hi : B.L.points i = x) : 0 < i.val ∧ i.val < B.m - 1 := by
    have hfirst : i ≠ CGN.firstIndex B.Packet.hm := by
      intro hifirst
      have hxEndpoint :
          x = (S.triangleByIndex S.oppIndex2).v2 ∨
            x = (S.triangleByIndex S.oppIndex2).v3 := by
        rcases hBorient with hb | hb
        · exact Or.inl (hi.symm.trans (by simpa only [hifirst] using hb.1))
        · exact Or.inr (hi.symm.trans (by simpa only [hifirst] using hb.1))
      rcases hxEndpoint with hxEndpoint | hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v2 hx hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v3 hx hxEndpoint
    have hlast : i ≠ CGN.lastIndex B.Packet.hm := by
      intro hilast
      have hxEndpoint :
          x = (S.triangleByIndex S.oppIndex2).v2 ∨
            x = (S.triangleByIndex S.oppIndex2).v3 := by
        rcases hBorient with hb | hb
        · exact Or.inr (hi.symm.trans (by simpa only [hilast] using hb.2))
        · exact Or.inl (hi.symm.trans (by simpa only [hilast] using hb.2))
      rcases hxEndpoint with hxEndpoint | hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v2 hx hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v3 hx hxEndpoint
    have hfirstVal : i.val ≠ 0 := by
      intro hi
      apply hfirst
      apply Fin.ext
      simpa only [CGN.firstIndex_val] using hi
    have hlastVal : i.val ≠ B.m - 1 := by
      intro hi
      apply hlast
      apply Fin.ext
      simpa only [CGN.lastIndex_val] using hi
    constructor <;> omega
  have hiuBounds := indexBounds huInterior iu hiu
  have hivBounds := indexBounds hvInterior iv hiv
  have hicBounds := indexBounds hcInterior ic hic
  have hidBounds := indexBounds hdeletedInterior id hid
  have hixvBounds := indexBounds hxvInterior ixv hixv
  have hieBounds := indexBounds heInterior ie hie
  have hixuBounds := indexBounds hxuInterior ixu hixu
  have between {j r s : Fin B.m} (hjr : B.L.points j ≠ B.L.points r)
      (hjs : B.L.points j ≠ B.L.points s)
      (hrs : B.L.points r ≠ B.L.points s)
      (heq : dist (B.L.points j) (B.L.points r) =
        dist (B.L.points j) (B.L.points s)) :
      (r < j ∧ j < s) ∨ (s < j ∧ j < r) := by
    have hjrIndex : j ≠ r := by
      intro h
      exact hjr (congrArg B.L.points h)
    have hjsIndex : j ≠ s := by
      intro h
      exact hjs (congrArg B.L.points h)
    have hrsIndex : r ≠ s := by
      intro h
      exact hrs (congrArg B.L.points h)
    rcases lt_or_gt_of_ne hrsIndex with hrs | hsr
    · exact Or.inl (CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord hrs hjrIndex hjsIndex heq)
    · exact Or.inr (CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord hsr hjsIndex hjrIndex heq.symm)
  have hXv : (iu < ixv ∧ ixv < ixu) ∨ (ixu < ixv ∧ ixv < iu) :=
    between (by simpa only [hixv, hiu] using huNeXv.symm)
      (by simpa only [hixv, hixu] using hxuNeXv.symm)
      (by simpa only [hiu, hixu] using huNeXu)
      (by simpa only [hixv, hiu, hixu] using hE)
  have hV : (iu < iv ∧ iv < ixv) ∨ (ixv < iv ∧ iv < iu) :=
    between (by simpa only [hiv, hiu] using huNeV.symm)
      (by simpa only [hiv, hixv] using hvNeXv)
      (by simpa only [hiu, hixv] using huNeXv)
      (by simpa only [hiv, hiu, hixv] using hD.symm)
  have hDel : (iv < id ∧ id < ixv) ∨ (ixv < id ∧ id < iv) :=
    between (by simpa only [hid, hiv] using hdelNeV)
      (by simpa only [hid, hixv] using hdelNeXv)
      (by simpa only [hiv, hixv] using hvNeXv)
      (by simpa only [hid, hiv, hixv] using hC)
  have hCenter : (iv < ic ∧ ic < id) ∨ (id < ic ∧ ic < iv) :=
    between (by simpa only [hic, hiv] using hcNeV)
      (by simpa only [hic, hid] using hcNeDeleted)
      (by simpa only [hiv, hid] using hdelNeV.symm)
      (by simpa only [hic, hiv, hid] using hA.symm)
  have hXuCenter : (id < ie ∧ ie < ixu) ∨ (ixu < ie ∧ ie < id) :=
    between (by simpa only [hie, hid] using heNeDeleted)
      (by simpa only [hie, hixu] using heNeXu)
      (by simpa only [hid, hixu] using hdelNeXu)
      (by simpa only [hie, hid, hixu] using hB.symm)
  have hieNeIxv : ie ≠ ixv := by
    intro h
    apply heNeXv
    calc
      e = B.L.points ie := hie.symm
      _ = B.L.points ixv := congrArg B.L.points h
      _ = packet.xv := hixv
  have horders := seven_index_order_classification hm iu iv ic id ixv ie ixu
    hiuBounds.1 hiuBounds.2 hivBounds.1 hivBounds.2 hicBounds.1 hicBounds.2
    hidBounds.1 hidBounds.2 hixvBounds.1 hixvBounds.2 hieBounds.1 hieBounds.2
    hixuBounds.1 hixuBounds.2
    hieNeIxv
    hXv hV hDel hCenter hXuCenter
  have close
      (orientation : BlockerVExactSixteenFourRowCoverage.Orientation)
      (order : Fin 2) (insertion : Fin 7)
      (boundary : Fin D.A.card → ℝ²)
      (hboundaryInjective : Function.Injective boundary)
      (hboundaryImage : Finset.univ.image boundary = D.A)
      (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
      (labelIndex : Fin 16 → Fin D.A.card)
      (hposition :
        BlockerVExactSixteenFourRowCoverage.PositionEmbedding
          orientation order insertion labelIndex)
      (huPoint : boundary (labelIndex 6) = P.u.1)
      (hxuPoint : boundary (labelIndex 7) = packet.xu)
      (hvPoint : boundary (labelIndex 8) = P.v.1)
      (hxvPoint : boundary (labelIndex 9) = packet.xv)
      (hdeletedPoint :
        boundary (labelIndex 10) = P.jointDeletion.deleted.1)
      (hcPoint : boundary (labelIndex 11) = c)
      (hePoint : boundary (labelIndex 12) = e)
      (hKxvCovered : Kxv.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundary (labelIndex point)))
      (hKuCovered : Ku.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundary (labelIndex point)))
      (hKvCovered : Kv.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundary (labelIndex point)))
      (hKdelCovered : Kdel.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundary (labelIndex point)))
      (hlongPoint : ∀ point,
        BlockerVExactSixteenFourRowCoverage.longLabelBool point = true →
          boundary (labelIndex point) ∈ S.capByIndex S.oppIndex2) : False := by
    exact false_of_blockerVExactSixteen_bank_of_covered_source_rows
      Q hcenterV boundary hboundaryInjective hboundaryImage hboundaryCcw
      orientation order insertion labelIndex hposition
      (by simpa only [Kxv, Hlate] using hKxvCovered)
      (by simpa only [Ku, Hlate] using hKuCovered)
      (by simpa only [Kv, Hlate] using hKvCovered)
      (by simpa only [Kdel, Hlate] using hKdelCovered)
      hvInterior hxvInterior
      hdeletedInterior hcInterior huPoint hxuPoint hvPoint hxvPoint
      hdeletedPoint
      (by simpa only [c, Hlate] using hcPoint)
      (by simpa only [e, Hlate] using hePoint)
      hlongPoint
  have closeForward
      (order : Fin 2)
      (huPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 6).val = iu.val)
      (hxuPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 7).val = ixu.val)
      (hvPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 8).val = iv.val)
      (hxvPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 9).val = ixv.val)
      (hdeletedPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 10).val = id.val)
      (hcPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 11).val = ic.val)
      (hePos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 12).val = ie.val) :
      False := by
    -- Exact-17 unused-point forward adapter.
    let shifted : Fin B.n → ℝ² := fun point => B.phi (point + B.Block.lo)
    let boundary : Fin D.A.card → ℝ² := fun point =>
      shifted (Fin.cast B.ambient_card_eq.symm point)
    let boundary17 : Fin 17 → ℝ² := fun point =>
      boundary (Fin.cast hcard.symm point)
    have hshiftedInjective : Function.Injective shifted := by
      simpa only [shifted] using
        injective_cyclicShift B.phi_injective B.Block.lo
    have hboundaryInjective : Function.Injective boundary := by
      simpa only [boundary] using
        injective_finCast_domain B.ambient_card_eq hshiftedInjective
    have hshiftedImage : Finset.univ.image shifted = D.A := by
      calc
        Finset.univ.image shifted = Finset.univ.image B.phi := by
          simpa only [shifted] using
            image_univ_cyclicShift B.phi B.Block.lo
        _ = D.A := B.Block.phi_image
    have hboundaryImage : Finset.univ.image boundary = D.A := by
      simpa only [boundary] using
        (image_univ_finCast_domain B.ambient_card_eq shifted).trans
          hshiftedImage
    have hboundary17Image : Finset.univ.image boundary17 = D.A := by
      simpa only [boundary17] using
        (image_univ_finCast_domain hcard boundary).trans hboundaryImage
    have hunusedImage : unused ∈ Finset.univ.image boundary17 := by
      simpa only [hboundary17Image] using hunusedA
    rcases Finset.mem_image.mp hunusedImage with
      ⟨gap17, _hgap17, hgapPoint⟩
    have hgapGe : 9 ≤ gap17.val := by
      by_contra hgap
      apply hunusedCap
      rw [← hgapPoint]
      change B.phi
        (Fin.cast B.ambient_card_eq.symm (Fin.cast hcard.symm gap17) +
          B.Block.lo) ∈ S.capByIndex S.oppIndex2
      rw [B.shifted_phi_mem_cap_iff]
      change gap17.val < B.m
      omega
    let labelIndex : Fin 16 → Fin D.A.card := fun point =>
      Fin.cast hcard.symm
        (gap17.succAbove
          (BlockerVExactSixteenFourRowCoverage.position order 0 point))
    have hshiftedCcw : EuclideanGeometry.IsCcwConvexPolygon shifted := by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift B.phi_injective B.phi_ccw B.Block.lo
    have hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
      simpa only [boundary] using
        ccw_finCast_domain B.ambient_card_eq hshiftedCcw
    have hposition :
        BlockerVExactSixteenFourRowCoverage.PositionEmbedding
          .forward order 0 labelIndex := by
      simpa only [labelIndex, Fin.val_cast] using
        skip_exactSixteen_position_embedding_forward gap17 order
    have pointAt (point : Fin 16) (t : Fin B.m)
        (hpoint :
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).val =
            t.val) :
        boundary (labelIndex point) = B.L.points t := by
      have hp :
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).castSucc <
            gap17 := by
        simpa only [Fin.lt_iff_val_lt_val, Fin.val_castSucc] using
          (show
            (BlockerVExactSixteenFourRowCoverage.position order 0 point).val <
              gap17.val by omega)
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm
                (gap17.succAbove
                  (BlockerVExactSixteenFourRowCoverage.position order 0 point))) =
            Fin.castLE (by have hspan := B.block_span; omega) t := by
        apply Fin.ext
        simp only [Fin.val_cast, Fin.val_castLE]
        rw [Fin.succAbove_of_castSucc_lt _ _ hp]
        simpa only [Fin.val_castSucc] using hpoint
      simpa only [boundary, shifted, labelIndex, hcast] using
        B.shifted_phi_cast_eq_points t
    have huPoint := (pointAt 6 iu huPos).trans hiu
    have hxuPoint := (pointAt 7 ixu hxuPos).trans hixu
    have hvPoint := (pointAt 8 iv hvPos).trans hiv
    have hxvPoint := (pointAt 9 ixv hxvPos).trans hixv
    have hdeletedPoint := (pointAt 10 id hdeletedPos).trans hid
    have hcPoint := (pointAt 11 ic hcPos).trans hic
    have hePoint := (pointAt 12 ie hePos).trans hie
    have hgapNotKxv : boundary17 gap17 ∉ Kxv.support := by
      simpa only [hgapPoint] using hunusedKxv
    have hgapNotKu : boundary17 gap17 ∉ Ku.support := by
      simpa only [hgapPoint] using hunusedKu
    have hgapNotKv : boundary17 gap17 ∉ Kv.support := by
      simpa only [hgapPoint] using hunusedKv
    have hgapNotKdel : boundary17 gap17 ∉ Kdel.support := by
      simpa only [hgapPoint] using hunusedKdel
    have hpositionSurjective : Function.Surjective
        (BlockerVExactSixteenFourRowCoverage.position order 0) :=
      Finite.injective_iff_surjective.mp
        (BlockerVExactSixteenFourRowCoverage.position_injective order 0)
    have hKxvCovered :
        Kxv.support ⊆ Finset.univ.image
          (fun point : Fin 16 => boundary (labelIndex point)) := by
      change Kxv.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundary17
          (gap17.succAbove
            (BlockerVExactSixteenFourRowCoverage.position order 0 point)))
      exact support_subset_image_skip_reindex hboundary17Image
        Kxv.support_subset_A gap17 hgapNotKxv _ hpositionSurjective
    have hKuCovered :
        Ku.support ⊆ Finset.univ.image
          (fun point : Fin 16 => boundary (labelIndex point)) := by
      change Ku.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundary17
          (gap17.succAbove
            (BlockerVExactSixteenFourRowCoverage.position order 0 point)))
      exact support_subset_image_skip_reindex hboundary17Image
        Ku.support_subset_A gap17 hgapNotKu _ hpositionSurjective
    have hKvCovered :
        Kv.support ⊆ Finset.univ.image
          (fun point : Fin 16 => boundary (labelIndex point)) := by
      change Kv.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundary17
          (gap17.succAbove
            (BlockerVExactSixteenFourRowCoverage.position order 0 point)))
      exact support_subset_image_skip_reindex hboundary17Image
        Kv.support_subset_A gap17 hgapNotKv _ hpositionSurjective
    have hKdelCovered :
        Kdel.support ⊆ Finset.univ.image
          (fun point : Fin 16 => boundary (labelIndex point)) := by
      change Kdel.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundary17
          (gap17.succAbove
            (BlockerVExactSixteenFourRowCoverage.position order 0 point)))
      exact support_subset_image_skip_reindex hboundary17Image
        Kdel.support_subset_A gap17 hgapNotKdel _ hpositionSurjective
    have hlongPosition : ∀ point,
        BlockerVExactSixteenFourRowCoverage.longLabelBool point = true →
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).val < 9 := by
      fin_cases order <;> decide
    have hlongPoint : ∀ point,
        BlockerVExactSixteenFourRowCoverage.longLabelBool point = true →
          boundary (labelIndex point) ∈ S.capByIndex S.oppIndex2 := by
      intro point hlong
      have hlt := hlongPosition point hlong
      change B.phi
        (Fin.cast B.ambient_card_eq.symm
            (Fin.cast hcard.symm
              (gap17.succAbove
                (BlockerVExactSixteenFourRowCoverage.position order 0 point))) +
          B.Block.lo) ∈ S.capByIndex S.oppIndex2
      rw [B.shifted_phi_mem_cap_iff]
      change
        (gap17.succAbove
          (BlockerVExactSixteenFourRowCoverage.position order 0 point)).val < B.m
      have hp :
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).castSucc <
            gap17 := by
        simpa only [Fin.lt_iff_val_lt_val, Fin.val_castSucc] using
          (show
            (BlockerVExactSixteenFourRowCoverage.position order 0 point).val <
              gap17.val by omega)
      rw [Fin.succAbove_of_castSucc_lt _ _ hp]
      simp only [Fin.val_castSucc]
      omega
    exact false_of_blockerVExactSixteen_bank_of_covered_source_rows
      Q hcenterV boundary hboundaryInjective hboundaryImage hboundaryCcw
      .forward order 0 labelIndex hposition hKxvCovered hKuCovered hKvCovered
      hKdelCovered hvInterior hxvInterior hdeletedInterior hcInterior
      huPoint hxuPoint hvPoint hxvPoint hdeletedPoint hcPoint hePoint hlongPoint
  have closeReverse
      (order : Fin 2)
      (huPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 6).val + iu.val = 8)
      (hxuPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 7).val + ixu.val = 8)
      (hvPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 8).val + iv.val = 8)
      (hxvPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 9).val + ixv.val = 8)
      (hdeletedPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 10).val + id.val = 8)
      (hcPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 11).val + ic.val = 8)
      (hePos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 12).val + ie.val = 8) :
      False := by
    -- Exact-17 unused-point reverse adapter.
    letI : NeZero B.n := ⟨by have hspan := B.block_span; omega⟩
    let cut : Fin B.n := ⟨(B.Block.hi.val + 1) % B.n,
      Nat.mod_lt _ (by have := B.Block.hi.isLt; omega)⟩
    let shifted : Fin B.n → ℝ² := fun point => B.phi (point + cut)
    let boundary : Fin D.A.card → ℝ² := fun point =>
      shifted (Fin.cast B.ambient_card_eq.symm point)
    let boundary17 : Fin 17 → ℝ² := fun point =>
      boundary (Fin.cast hcard.symm point)
    let boundaryRev : Fin 17 → ℝ² := fun point => boundary17 (Fin.rev point)
    have hshiftedInjective : Function.Injective shifted := by
      simpa only [shifted] using injective_cyclicShift B.phi_injective cut
    have hboundaryInjective : Function.Injective boundary := by
      simpa only [boundary] using
        injective_finCast_domain B.ambient_card_eq hshiftedInjective
    have hshiftedImage : Finset.univ.image shifted = D.A := by
      calc
        Finset.univ.image shifted = Finset.univ.image B.phi := by
          simpa only [shifted] using image_univ_cyclicShift B.phi cut
        _ = D.A := B.Block.phi_image
    have hboundaryImage : Finset.univ.image boundary = D.A := by
      simpa only [boundary] using
        (image_univ_finCast_domain B.ambient_card_eq shifted).trans
          hshiftedImage
    have hboundary17Image : Finset.univ.image boundary17 = D.A := by
      simpa only [boundary17] using
        (image_univ_finCast_domain hcard boundary).trans hboundaryImage
    have hboundaryRevImage : Finset.univ.image boundaryRev = D.A := by
      rw [← hboundary17Image]
      ext point
      constructor
      · intro hpoint
        rcases Finset.mem_image.mp hpoint with ⟨index, _hindex, rfl⟩
        exact Finset.mem_image.mpr
          ⟨Fin.rev index, Finset.mem_univ _, by simp only [boundaryRev]⟩
      · intro hpoint
        rcases Finset.mem_image.mp hpoint with ⟨index, _hindex, rfl⟩
        exact Finset.mem_image.mpr
          ⟨Fin.rev index, Finset.mem_univ _, by
            simp only [boundaryRev, Fin.rev_rev]⟩
    have hunusedImage : unused ∈ Finset.univ.image boundaryRev := by
      simpa only [hboundaryRevImage] using hunusedA
    rcases Finset.mem_image.mp hunusedImage with
      ⟨gap17, _hgap17, hgapPoint⟩
    have hgapGe : 9 ≤ gap17.val := by
      by_contra hgap
      let t : Fin B.m := ⟨B.m - 1 - gap17.val, by omega⟩
      let offset : Fin B.n := ⟨B.n - B.m + t.val, by
        have hspan := B.block_span
        have hmpos := B.Block.hm
        omega⟩
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm (Fin.rev gap17)) = offset := by
        apply Fin.ext
        simp only [Fin.val_cast, Fin.val_rev]
        dsimp only [offset, t]
        have hn : B.n = 17 := B.ambient_card_eq.trans hcard
        omega
      have hgapAsPoint : boundaryRev gap17 = B.L.points t := by
        simpa only [boundaryRev, boundary17, boundary, shifted, cut, hcast,
          offset] using B.shifted_after_block_phi_cast_eq_points t
      apply hunusedCap
      rw [← hgapPoint, hgapAsPoint]
      exact B.points_mem_cap t
    let labelIndex : Fin 16 → Fin D.A.card := fun point =>
      Fin.cast hcard.symm
        (Fin.rev
          (gap17.succAbove
            (BlockerVExactSixteenFourRowCoverage.position order 0 point)))
    have hshiftedCcw : EuclideanGeometry.IsCcwConvexPolygon shifted := by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift B.phi_injective B.phi_ccw cut
    have hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
      simpa only [boundary] using
        ccw_finCast_domain B.ambient_card_eq hshiftedCcw
    have hposition :
        BlockerVExactSixteenFourRowCoverage.PositionEmbedding
          .reverse order 0 labelIndex := by
      simpa only [labelIndex, Fin.val_cast] using
        skip_exactSixteen_position_embedding_reverse gap17 order
    have pointAt (point : Fin 16) (t : Fin B.m)
        (hpoint :
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).val +
              t.val = 8) :
        boundary (labelIndex point) = B.L.points t := by
      have hp :
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).castSucc <
            gap17 := by
        simpa only [Fin.lt_iff_val_lt_val, Fin.val_castSucc] using
          (show
            (BlockerVExactSixteenFourRowCoverage.position order 0 point).val <
              gap17.val by omega)
      let offset : Fin B.n := ⟨B.n - B.m + t.val, by
        have hspan := B.block_span
        have hmpos := B.Block.hm
        omega⟩
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm
                (Fin.rev
                  (gap17.succAbove
                    (BlockerVExactSixteenFourRowCoverage.position order 0 point)))) =
            offset := by
        apply Fin.ext
        simp only [Fin.val_cast, Fin.val_rev]
        rw [Fin.succAbove_of_castSucc_lt _ _ hp]
        simp only [Fin.val_castSucc]
        dsimp only [offset]
        have hn : B.n = 17 := B.ambient_card_eq.trans hcard
        omega
      simpa only [boundary, shifted, labelIndex, cut, hcast, offset] using
        B.shifted_after_block_phi_cast_eq_points t
    have huPoint := (pointAt 6 iu huPos).trans hiu
    have hxuPoint := (pointAt 7 ixu hxuPos).trans hixu
    have hvPoint := (pointAt 8 iv hvPos).trans hiv
    have hxvPoint := (pointAt 9 ixv hxvPos).trans hixv
    have hdeletedPoint := (pointAt 10 id hdeletedPos).trans hid
    have hcPoint := (pointAt 11 ic hcPos).trans hic
    have hePoint := (pointAt 12 ie hePos).trans hie
    have hgapNotKxv : boundaryRev gap17 ∉ Kxv.support := by
      simpa only [hgapPoint] using hunusedKxv
    have hgapNotKu : boundaryRev gap17 ∉ Ku.support := by
      simpa only [hgapPoint] using hunusedKu
    have hgapNotKv : boundaryRev gap17 ∉ Kv.support := by
      simpa only [hgapPoint] using hunusedKv
    have hgapNotKdel : boundaryRev gap17 ∉ Kdel.support := by
      simpa only [hgapPoint] using hunusedKdel
    have hpositionSurjective : Function.Surjective
        (BlockerVExactSixteenFourRowCoverage.position order 0) :=
      Finite.injective_iff_surjective.mp
        (BlockerVExactSixteenFourRowCoverage.position_injective order 0)
    have hKxvCovered :
        Kxv.support ⊆ Finset.univ.image
          (fun point : Fin 16 => boundary (labelIndex point)) := by
      change Kxv.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundaryRev
          (gap17.succAbove
            (BlockerVExactSixteenFourRowCoverage.position order 0 point)))
      exact support_subset_image_skip_reindex hboundaryRevImage
        Kxv.support_subset_A gap17 hgapNotKxv _ hpositionSurjective
    have hKuCovered :
        Ku.support ⊆ Finset.univ.image
          (fun point : Fin 16 => boundary (labelIndex point)) := by
      change Ku.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundaryRev
          (gap17.succAbove
            (BlockerVExactSixteenFourRowCoverage.position order 0 point)))
      exact support_subset_image_skip_reindex hboundaryRevImage
        Ku.support_subset_A gap17 hgapNotKu _ hpositionSurjective
    have hKvCovered :
        Kv.support ⊆ Finset.univ.image
          (fun point : Fin 16 => boundary (labelIndex point)) := by
      change Kv.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundaryRev
          (gap17.succAbove
            (BlockerVExactSixteenFourRowCoverage.position order 0 point)))
      exact support_subset_image_skip_reindex hboundaryRevImage
        Kv.support_subset_A gap17 hgapNotKv _ hpositionSurjective
    have hKdelCovered :
        Kdel.support ⊆ Finset.univ.image
          (fun point : Fin 16 => boundary (labelIndex point)) := by
      change Kdel.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundaryRev
          (gap17.succAbove
            (BlockerVExactSixteenFourRowCoverage.position order 0 point)))
      exact support_subset_image_skip_reindex hboundaryRevImage
        Kdel.support_subset_A gap17 hgapNotKdel _ hpositionSurjective
    have hlongPosition : ∀ point,
        BlockerVExactSixteenFourRowCoverage.longLabelBool point = true →
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).val < 9 := by
      fin_cases order <;> decide
    have hlongPoint : ∀ point,
        BlockerVExactSixteenFourRowCoverage.longLabelBool point = true →
          boundary (labelIndex point) ∈ S.capByIndex S.oppIndex2 := by
      intro point hlong
      have hlt := hlongPosition point hlong
      let t : Fin B.m := ⟨B.m - 1 -
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).val, by
        omega⟩
      have hsum :
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).val +
              t.val = 8 := by
        change
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).val +
              (B.m - 1 -
                (BlockerVExactSixteenFourRowCoverage.position order 0 point).val) = 8
        omega
      exact (pointAt point t hsum) ▸ B.points_mem_cap t
    exact false_of_blockerVExactSixteen_bank_of_covered_source_rows
      Q hcenterV boundary hboundaryInjective hboundaryImage hboundaryCcw
      .reverse order 0 labelIndex hposition hKxvCovered hKuCovered hKvCovered
      hKdelCovered hvInterior hxvInterior hdeletedInterior hcInterior
      huPoint hxuPoint hvPoint hxvPoint hdeletedPoint hcPoint hePoint hlongPoint
  rcases horders with horder | horder | horder | horder
  · exact closeForward 0 (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
  · exact closeForward 1 (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
  · exact closeReverse 0 (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
  · exact closeReverse 1 (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactSixteenFourRowCoverage.position,
        BlockerVExactFifteenFourRowCoverage.position]; omega)

/-- Source-authenticated exact-cover split for the exact-seventeen cap-nine
residual.  The four old selected rows each have exactly two points outside the
distinguished cap.  Consequently either one of the eight outside carrier
points is absent from all four rows, or those four two-point slices partition
the outside set exactly.  This is the Lean ingress that licenses the finite
encoder's four outside-pair labels. -/
theorem exactFourRigid221_blockerV_exactSeventeen_secondCapNine_outsideRows_unused_or_exactCover
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (hcenterDeletedInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (hcenterDeletedOffClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∉
        SelectedClass D.A S.oppApex2 P.rho)
    (hcard : D.A.card = 17)
    (hcapCard : (S.capByIndex S.oppIndex2).card = 9) :
    let Hlate := lateFirstApexSystem R
    let Ku := (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
    let Kv := (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
    let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
    let Kdel := (Hlate.selectedAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2).toCriticalFourShell
    let cap := S.capByIndex S.oppIndex2
    let outside := D.A \ cap
    let rowSupport : Fin 4 → Finset ℝ² := fun row =>
      match row.1 with
      | 0 => Kxv.support
      | 1 => Ku.support
      | 2 => Kv.support
      | _ => Kdel.support
    (∃ x ∈ outside, ∀ row, x ∉ rowSupport row) ∨
      (incidenceBag outside rowSupport).Nodup ∧
        (incidenceBag outside rowSupport).toFinset = outside := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ku := (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  let Kv := (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
  let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let Kdel :=
    (Hlate.selectedAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2).toCriticalFourShell
  let C := SelectedClass D.A S.oppApex2 P.rho
  let I := S.capInteriorByIndex S.oppIndex2
  let cap := S.capByIndex S.oppIndex2
  let outside := D.A \ cap
  let c := Hlate.centerAt P.jointDeletion.deleted.1
    P.jointDeletion.deleted.2
  let rowSupport : Fin 4 → Finset ℝ² := fun row =>
    match row.1 with
    | 0 => Kxv.support
    | 1 => Ku.support
    | 2 => Kv.support
    | _ => Kdel.support
  have hnamed :=
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_namedSeven
      Q hcenterV hcenterDeletedInterior hcenterDeletedOffClass
  have hclassInterior : C ⊆ I := by
    intro x hx
    exact hnamed.1 (by simp [blockerVSecondCapNamedSeven, Hlate, c, C, hx])
  have interiorCap {x : ℝ²} (hx : x ∈ I) : x ∈ cap := by
    simpa only [cap, I] using
      S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hx
  have huInterior : P.u.1 ∈ I := hclassInterior P.huClass
  have hvInterior : P.v.1 ∈ I := hclassInterior P.hvClass
  have hdeletedInterior : P.jointDeletion.deleted.1 ∈ I :=
    hclassInterior P.jointDeletion.deleted_mem_class
  have hxuInter : packet.xu ∈ Ku.support ∩ C := by
    simpa only [Ku, C, Hlate] using (show
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
      rw [packet.source_row_trace]
      simp)
  have hxuURow : packet.xu ∈ Ku.support := (Finset.mem_inter.mp hxuInter).1
  have hxuInterior : packet.xu ∈ I :=
    hclassInterior (Finset.mem_inter.mp hxuInter).2
  have hxvInter : packet.xv ∈ Kv.support ∩ C := by
    simpa only [C] using (show
      packet.xv ∈ Kv.support ∩ SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.opposite_row_trace]
        simp)
  have hxvVRow : packet.xv ∈ Kv.support := (Finset.mem_inter.mp hxvInter).1
  have hxvInterior : packet.xv ∈ I :=
    hclassInterior (Finset.mem_inter.mp hxvInter).2
  have hcenterU : Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [Hlate, P.huSource] using packet.blocker_eq_xv
  have huNeXu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have hvNeXv : P.v.1 ≠ packet.xv := packet.xv_ne_v.symm
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply Ku.center_not_mem_support
    simpa only [hcenterU, ← h] using Ku.q_mem_support
  have hdelNeV : P.jointDeletion.deleted.1 ≠ P.v.1 := by
    intro h
    apply Kv.center_not_mem_support
    simpa only [Hlate, hcenterV, h] using Kv.q_mem_support
  have hKxvCap : (Kxv.support ∩ cap).card ≤ 2 :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.oppIndex2 Kxv.toSelectedFourClass
      (by simpa only [Hlate, Q.hblockerEqV, cap] using interiorCap hvInterior)
  have hKuCap : (Ku.support ∩ cap).card ≤ 2 :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.oppIndex2 Ku.toSelectedFourClass
      (by simpa only [Hlate, hcenterU, cap] using interiorCap hxvInterior)
  have hKvCap : (Kv.support ∩ cap).card ≤ 2 :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.oppIndex2 Kv.toSelectedFourClass
      (by simpa only [Hlate, hcenterV, cap] using interiorCap hdeletedInterior)
  have hKdelCap : (Kdel.support ∩ cap).card ≤ 2 :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.oppIndex2 Kdel.toSelectedFourClass
      (by simpa only [Hlate, c, cap] using interiorCap hcenterDeletedInterior)
  have hKxvOutside : (Kxv.support \ cap).card = 2 :=
    outsideSlice_card_eq_two Kxv.support cap P.u.1 packet.xv
      Kxv.support_card hKxvCap
      (Finset.mem_inter.mpr ⟨Q.huXvRow, interiorCap huInterior⟩)
      (Finset.mem_inter.mpr
        ⟨Kxv.q_mem_support, interiorCap hxvInterior⟩) huNeXv
  have hKuOutside : (Ku.support \ cap).card = 2 :=
    outsideSlice_card_eq_two Ku.support cap P.u.1 packet.xu
      Ku.support_card hKuCap
      (Finset.mem_inter.mpr ⟨Ku.q_mem_support, interiorCap huInterior⟩)
      (Finset.mem_inter.mpr ⟨hxuURow, interiorCap hxuInterior⟩) huNeXu
  have hKvOutside : (Kv.support \ cap).card = 2 :=
    outsideSlice_card_eq_two Kv.support cap P.v.1 packet.xv
      Kv.support_card hKvCap
      (Finset.mem_inter.mpr ⟨Kv.q_mem_support, interiorCap hvInterior⟩)
      (Finset.mem_inter.mpr ⟨hxvVRow, interiorCap hxvInterior⟩) hvNeXv
  have hKdelOutside : (Kdel.support \ cap).card = 2 :=
    outsideSlice_card_eq_two Kdel.support cap
      P.jointDeletion.deleted.1 P.v.1 Kdel.support_card hKdelCap
      (Finset.mem_inter.mpr
        ⟨Kdel.q_mem_support, interiorCap hdeletedInterior⟩)
      (Finset.mem_inter.mpr ⟨Q.hvDeletedRow, interiorCap hvInterior⟩) hdelNeV
  have slice_eq (support : Finset ℝ²) (hsub : support ⊆ D.A) :
      support ∩ outside = support \ cap := by
    ext x
    simp only [outside, Finset.mem_inter, Finset.mem_sdiff]
    constructor
    · exact fun hx => ⟨hx.1, hx.2.2⟩
    · exact fun hx => ⟨hx.1, hsub hx.1, hx.2⟩
  have houtside : outside.card = 8 := by
    change (D.A \ S.capByIndex S.oppIndex2).card = 8
    rw [Finset.card_sdiff_of_subset (S.capByIndex_subset S.oppIndex2)]
    omega
  have hrow : ∀ row, (rowSupport row ∩ outside).card = 2 := by
    intro row
    fin_cases row
    · simpa only [rowSupport,
        slice_eq Kxv.support Kxv.support_subset_A] using hKxvOutside
    · simpa only [rowSupport,
        slice_eq Ku.support Ku.support_subset_A] using hKuOutside
    · simpa only [rowSupport,
        slice_eq Kv.support Kv.support_subset_A] using hKvOutside
    · simpa only [rowSupport,
        slice_eq Kdel.support Kdel.support_subset_A] using hKdelOutside
  exact unused_or_exactCover outside rowSupport houtside hrow

/- Exact-seventeen, second-cap-nine terminal left after the deterministic
second-cap-ten and second-cap-eleven reductions.  This is the source-faithful
CEGAR target: the seven named strict-cap points exhaust that strict interior,
so no anonymous cap point is available for a smaller-bank deletion lift. -/
/-- Source-authenticated normalization of the exact-seventeen, second-cap-nine
exact-cover branch.  The result retains the full carrier geometry and the
explicit label/center correspondence needed by the checked SAT semantics. -/
theorem exists_exactSeventeenSourceRealization_of_exactCover
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (hcenterDeletedInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (hcenterDeletedOffClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∉
        SelectedClass D.A S.oppApex2 P.rho)
    (hcard : D.A.card = 17)
    (hcapCard : (S.capByIndex S.oppIndex2).card = 9)
    (hnextRowPhysicalHits :
      let Hlate := lateFirstApexSystem R
      let c := Hlate.centerAt P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2
      let hcA : c ∈ D.A := Finset.mem_of_mem_erase
        (Hlate.selectedAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.center_mem
      (((Hlate.selectedAt c hcA).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 P.rho).card ≤ 1))
    (hexactCover :
      let Hlate := lateFirstApexSystem R
      let Ku := (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
      let Kv := (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
      let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
      let Kdel := (Hlate.selectedAt P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2).toCriticalFourShell
      let cap := S.capByIndex S.oppIndex2
      let outside := D.A \ cap
      let rowSupport : Fin 4 → Finset ℝ² := fun row =>
        match row.1 with
        | 0 => Kxv.support
        | 1 => Ku.support
        | 2 => Kv.support
        | _ => Kdel.support
      (incidenceBag outside rowSupport).Nodup ∧
        (incidenceBag outside rowSupport).toFinset = outside) :
    Nonempty (ATailBlockerVExactSeventeenSourceNormalForm.SourceRealization D.A) := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ku := (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  let Kv := (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
  let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let Kdel :=
    (Hlate.selectedAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2).toCriticalFourShell
  let Kxu := (Hlate.selectedAt packet.xu Q.hxuA).toCriticalFourShell
  let C := SelectedClass D.A S.oppApex2 P.rho
  let I := S.capInteriorByIndex S.oppIndex2
  let c :=
    Hlate.centerAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2
  let e := Hlate.centerAt packet.xu Q.hxuA
  have hnamedInfo :=
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_namedSeven
      Q hcenterV hcenterDeletedInterior hcenterDeletedOffClass
  have hcapAdd :=
    ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
      S S.oppIndex2
  have hIcard : I.card = 7 := by
    have hcapAdd' : I.card + 2 =
        (S.capByIndex S.oppIndex2).card := by
      simpa only [I] using hcapAdd
    omega
  have hnamedSet : blockerVSecondCapNamedSeven Q = I := by
    apply Finset.eq_of_subset_of_card_le hnamedInfo.1
    rw [hnamedInfo.2, hIcard]
  have hnamed : insert e (insert c C) = I := by
    simpa only [blockerVSecondCapNamedSeven, Hlate, e, c, C, I] using hnamedSet
  have hxuInter : packet.xu ∈ Ku.support ∩ C := by
    simpa only [Ku, C, Hlate] using (show
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho by
      rw [packet.source_row_trace]
      simp)
  have hxuURow : packet.xu ∈ Ku.support := (Finset.mem_inter.mp hxuInter).1
  have hxuClass : packet.xu ∈ C := (Finset.mem_inter.mp hxuInter).2
  have hxvInter : packet.xv ∈ Kv.support ∩ C := by
    simpa only [C] using (show
      packet.xv ∈ Kv.support ∩ SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.opposite_row_trace]
        simp)
  have hxvVRow : packet.xv ∈ Kv.support := (Finset.mem_inter.mp hxvInter).1
  have hxvClass : packet.xv ∈ C := (Finset.mem_inter.mp hxvInter).2
  have hcenterU : Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [Hlate, P.huSource] using packet.blocker_eq_xv
  have hE : dist packet.xv P.u.1 = dist packet.xv packet.xu := by
    rw [← hcenterU]
    exact (Ku.support_eq_radius _ Ku.q_mem_support).trans
      (Ku.support_eq_radius _ hxuURow).symm
  have hD : dist P.v.1 packet.xv = dist P.v.1 P.u.1 := by
    rw [← Q.hblockerEqV]
    exact (Kxv.support_eq_radius _ Kxv.q_mem_support).trans
      (Kxv.support_eq_radius _ Q.huXvRow).symm
  have hC :
      dist P.jointDeletion.deleted.1 P.v.1 =
        dist P.jointDeletion.deleted.1 packet.xv := by
    have hraw :=
      (Kv.support_eq_radius _ Kv.q_mem_support).trans
        (Kv.support_eq_radius _ hxvVRow).symm
    simpa only [Hlate, hcenterV] using hraw
  have hB : dist e packet.xu = dist e P.jointDeletion.deleted.1 := by
    simpa only [e, Kxu] using
      (Kxu.support_eq_radius _ Kxu.q_mem_support).trans
        (Kxu.support_eq_radius _ Q.hdeletedXuRow).symm
  have hA : dist c P.jointDeletion.deleted.1 = dist c P.v.1 := by
    simpa only [c, Kdel] using
      (Kdel.support_eq_radius _ Kdel.q_mem_support).trans
        (Kdel.support_eq_radius _ Q.hvDeletedRow).symm
  have hclassInterior : C ⊆ I := by
    intro x hx
    rw [← hnamed]
    simp [hx]
  have heInterior : e ∈ I := by rw [← hnamed]; simp
  have hcInterior : c ∈ I := by rw [← hnamed]; simp
  have huInterior : P.u.1 ∈ I := hclassInterior P.huClass
  have hxuInterior : packet.xu ∈ I := hclassInterior hxuClass
  have hvInterior : P.v.1 ∈ I := hclassInterior P.hvClass
  have hxvInterior : packet.xv ∈ I := hclassInterior hxvClass
  have hdeletedInterior : P.jointDeletion.deleted.1 ∈ I :=
    hclassInterior P.jointDeletion.deleted_mem_class
  have huNeXu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have hvNeXv : P.v.1 ≠ packet.xv := packet.xv_ne_v.symm
  have huNeV : P.u.1 ≠ P.v.1 := by
    intro h
    exact P.huNeV (Subtype.ext h)
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply Ku.center_not_mem_support
    simpa only [hcenterU, ← h] using Ku.q_mem_support
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply Ku.center_not_mem_support
    simpa only [hcenterU, ← h] using hxuURow
  have hdelNeV : P.jointDeletion.deleted.1 ≠ P.v.1 := by
    intro h
    apply Kv.center_not_mem_support
    simpa only [Hlate, hcenterV, h] using Kv.q_mem_support
  have hdelNeXv : P.jointDeletion.deleted.1 ≠ packet.xv := by
    intro h
    apply Q.hxvNotDeletedRow
    simpa only [← h] using Kdel.q_mem_support
  have hcNeDeleted : c ≠ P.jointDeletion.deleted.1 := by
    simpa only [c, Hlate] using
      centerAt_ne_source Hlate P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2
  have hcNeV : c ≠ P.v.1 := by
    intro h
    exact hcenterDeletedOffClass (by simpa only [c, Hlate, h] using P.hvClass)
  have heNeXu : e ≠ packet.xu := by
    simpa only [e] using centerAt_ne_source Hlate packet.xu Q.hxuA
  have heNeDeleted : e ≠ P.jointDeletion.deleted.1 := by
    intro h
    apply Kxu.center_not_mem_support
    simpa only [e, h] using Q.hdeletedXuRow
  have hdelNeXu : P.jointDeletion.deleted.1 ≠ packet.xu := by
    intro h
    apply Q.hxuNotDeletedRow
    simpa only [← h] using Kdel.q_mem_support
  have hcOff : c ∉ C := by
    simpa only [c, C, Hlate] using hcenterDeletedOffClass
  have hnamedInfo :=
    exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_namedSeven
      Q hcenterV hcenterDeletedInterior hcenterDeletedOffClass
  have hnamedCard : (insert e (insert c C)).card = 7 := by
    simpa only [blockerVSecondCapNamedSeven, Hlate, e, c, C] using hnamedInfo.2
  have heOff : e ∉ C := by
    intro heClass
    have heInsert : e ∈ insert c C := Finset.mem_insert_of_mem heClass
    have hsmall : (insert e (insert c C)).card = 6 := by
      rw [Finset.insert_eq_self.mpr heInsert,
        Finset.card_insert_of_notMem hcOff]
      have hCcard : C.card = 5 := by
        simpa only [C] using P.hclassFive
      omega
    omega
  have heNeXv : e ≠ packet.xv := by
    intro h
    exact heOff (by simpa only [h] using hxvClass)
  rcases S.capByIndex_cgn4g_strictCapBlockData_oriented D.convex S.oppIndex2 with
    ⟨B, hBorient⟩
  have hm : B.m = 9 := B.cap_card_eq.trans hcapCard
  have interiorCap {x : ℝ²} (hx : x ∈ I) : x ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hx
  rcases B.exists_index_of_mem_cap (interiorCap huInterior) with ⟨iu, hiu⟩
  rcases B.exists_index_of_mem_cap (interiorCap hvInterior) with ⟨iv, hiv⟩
  rcases B.exists_index_of_mem_cap (interiorCap hcInterior) with ⟨ic, hic⟩
  rcases B.exists_index_of_mem_cap (interiorCap hdeletedInterior) with ⟨id, hid⟩
  rcases B.exists_index_of_mem_cap (interiorCap hxvInterior) with ⟨ixv, hixv⟩
  rcases B.exists_index_of_mem_cap (interiorCap heInterior) with ⟨ie, hie⟩
  rcases B.exists_index_of_mem_cap (interiorCap hxuInterior) with ⟨ixu, hixu⟩
  have indexBounds {x : ℝ²} (hx : x ∈ I) (i : Fin B.m)
      (hi : B.L.points i = x) : 0 < i.val ∧ i.val < B.m - 1 := by
    have hfirst : i ≠ CGN.firstIndex B.Packet.hm := by
      intro hifirst
      have hxEndpoint :
          x = (S.triangleByIndex S.oppIndex2).v2 ∨
            x = (S.triangleByIndex S.oppIndex2).v3 := by
        rcases hBorient with hb | hb
        · exact Or.inl (hi.symm.trans (by simpa only [hifirst] using hb.1))
        · exact Or.inr (hi.symm.trans (by simpa only [hifirst] using hb.1))
      rcases hxEndpoint with hxEndpoint | hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v2 hx hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v3 hx hxEndpoint
    have hlast : i ≠ CGN.lastIndex B.Packet.hm := by
      intro hilast
      have hxEndpoint :
          x = (S.triangleByIndex S.oppIndex2).v2 ∨
            x = (S.triangleByIndex S.oppIndex2).v3 := by
        rcases hBorient with hb | hb
        · exact Or.inr (hi.symm.trans (by simpa only [hilast] using hb.2))
        · exact Or.inl (hi.symm.trans (by simpa only [hilast] using hb.2))
      rcases hxEndpoint with hxEndpoint | hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v2 hx hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v3 hx hxEndpoint
    have hfirstVal : i.val ≠ 0 := by
      intro hi
      apply hfirst
      apply Fin.ext
      simpa only [CGN.firstIndex_val] using hi
    have hlastVal : i.val ≠ B.m - 1 := by
      intro hi
      apply hlast
      apply Fin.ext
      simpa only [CGN.lastIndex_val] using hi
    constructor <;> omega
  have hiuBounds := indexBounds huInterior iu hiu
  have hivBounds := indexBounds hvInterior iv hiv
  have hicBounds := indexBounds hcInterior ic hic
  have hidBounds := indexBounds hdeletedInterior id hid
  have hixvBounds := indexBounds hxvInterior ixv hixv
  have hieBounds := indexBounds heInterior ie hie
  have hixuBounds := indexBounds hxuInterior ixu hixu
  have between {j r s : Fin B.m} (hjr : B.L.points j ≠ B.L.points r)
      (hjs : B.L.points j ≠ B.L.points s)
      (hrs : B.L.points r ≠ B.L.points s)
      (heq : dist (B.L.points j) (B.L.points r) =
        dist (B.L.points j) (B.L.points s)) :
      (r < j ∧ j < s) ∨ (s < j ∧ j < r) := by
    have hjrIndex : j ≠ r := by
      intro h
      exact hjr (congrArg B.L.points h)
    have hjsIndex : j ≠ s := by
      intro h
      exact hjs (congrArg B.L.points h)
    have hrsIndex : r ≠ s := by
      intro h
      exact hrs (congrArg B.L.points h)
    rcases lt_or_gt_of_ne hrsIndex with hrs | hsr
    · exact Or.inl (CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord hrs hjrIndex hjsIndex heq)
    · exact Or.inr (CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord hsr hjsIndex hjrIndex heq.symm)
  have hXv : (iu < ixv ∧ ixv < ixu) ∨ (ixu < ixv ∧ ixv < iu) :=
    between (by simpa only [hixv, hiu] using huNeXv.symm)
      (by simpa only [hixv, hixu] using hxuNeXv.symm)
      (by simpa only [hiu, hixu] using huNeXu)
      (by simpa only [hixv, hiu, hixu] using hE)
  have hV : (iu < iv ∧ iv < ixv) ∨ (ixv < iv ∧ iv < iu) :=
    between (by simpa only [hiv, hiu] using huNeV.symm)
      (by simpa only [hiv, hixv] using hvNeXv)
      (by simpa only [hiu, hixv] using huNeXv)
      (by simpa only [hiv, hiu, hixv] using hD.symm)
  have hDel : (iv < id ∧ id < ixv) ∨ (ixv < id ∧ id < iv) :=
    between (by simpa only [hid, hiv] using hdelNeV)
      (by simpa only [hid, hixv] using hdelNeXv)
      (by simpa only [hiv, hixv] using hvNeXv)
      (by simpa only [hid, hiv, hixv] using hC)
  have hCenter : (iv < ic ∧ ic < id) ∨ (id < ic ∧ ic < iv) :=
    between (by simpa only [hic, hiv] using hcNeV)
      (by simpa only [hic, hid] using hcNeDeleted)
      (by simpa only [hiv, hid] using hdelNeV.symm)
      (by simpa only [hic, hiv, hid] using hA.symm)
  have hXuCenter : (id < ie ∧ ie < ixu) ∨ (ixu < ie ∧ ie < id) :=
    between (by simpa only [hie, hid] using heNeDeleted)
      (by simpa only [hie, hixu] using heNeXu)
      (by simpa only [hid, hixu] using hdelNeXu)
      (by simpa only [hie, hid, hixu] using hB.symm)
  have hieNeIxv : ie ≠ ixv := by
    intro h
    apply heNeXv
    calc
      e = B.L.points ie := hie.symm
      _ = B.L.points ixv := congrArg B.L.points h
      _ = packet.xv := hixv
  have horders := seven_index_order_classification hm iu iv ic id ixv ie ixu
    hiuBounds.1 hiuBounds.2 hivBounds.1 hivBounds.2 hicBounds.1 hicBounds.2
    hidBounds.1 hidBounds.2 hixvBounds.1 hixvBounds.2 hieBounds.1 hieBounds.2
    hixuBounds.1 hixuBounds.2
    hieNeIxv
    hXv hV hDel hCenter hXuCenter
  let cap := S.capByIndex S.oppIndex2
  let rowSupport : Fin 4 → Finset (ℝ²) := fun row =>
    match row.1 with
    | 0 => Kxv.support
    | 1 => Ku.support
    | 2 => Kv.support
    | _ => Kdel.support
  have hexactCover' :
      (incidenceBag (D.A \ cap) rowSupport).Nodup ∧
        (incidenceBag (D.A \ cap) rowSupport).toFinset = D.A \ cap := by
    simpa only [Hlate, Ku, Kv, Kxv, Kdel, cap, rowSupport] using hexactCover
  have hrowCap : ∀ row, (rowSupport row ∩ cap).card ≤ 2 := by
    intro row
    fin_cases row
    · exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 Kxv.toSelectedFourClass
        (by simpa only [Hlate, Q.hblockerEqV, cap] using interiorCap hvInterior)
    · exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 Ku.toSelectedFourClass
        (by simpa only [Hlate, hcenterU, cap] using interiorCap hxvInterior)
    · exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 Kv.toSelectedFourClass
        (by simpa only [Hlate, hcenterV, cap] using interiorCap hdeletedInterior)
    · exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 Kdel.toSelectedFourClass
        (by simpa only [Hlate, c, cap] using interiorCap hcInterior)
  have holdCapRaw : ∀ row,
      rowSupport row ∩ cap =
        match row.1 with
        | 0 => {P.u.1, packet.xv}
        | 1 => {P.u.1, packet.xu}
        | 2 => {P.v.1, packet.xv}
        | _ => {P.v.1, P.jointDeletion.deleted.1} := by
    intro row
    fin_cases row
    · apply eq_pair_of_card_le_two _ _ _ (hrowCap 0)
      · exact Finset.mem_inter.mpr ⟨Q.huXvRow, interiorCap huInterior⟩
      · exact Finset.mem_inter.mpr ⟨Kxv.q_mem_support, interiorCap hxvInterior⟩
      · exact huNeXv
    · apply eq_pair_of_card_le_two _ _ _ (hrowCap 1)
      · exact Finset.mem_inter.mpr ⟨Ku.q_mem_support, interiorCap huInterior⟩
      · exact Finset.mem_inter.mpr ⟨hxuURow, interiorCap hxuInterior⟩
      · exact huNeXu
    · apply eq_pair_of_card_le_two _ _ _ (hrowCap 2)
      · exact Finset.mem_inter.mpr ⟨Kv.q_mem_support, interiorCap hvInterior⟩
      · exact Finset.mem_inter.mpr ⟨hxvVRow, interiorCap hxvInterior⟩
      · exact hvNeXv
    · apply eq_pair_of_card_le_two _ _ _ (hrowCap 3)
      · exact Finset.mem_inter.mpr ⟨Q.hvDeletedRow, interiorCap hvInterior⟩
      · exact Finset.mem_inter.mpr ⟨Kdel.q_mem_support, interiorCap hdeletedInterior⟩
      · exact hdelNeV.symm
  obtain ⟨pattern⟩ := exists_faithfulCarrierPattern_of_globalK4 D.K4 P.u.2
  have close
      (orientation : Orientation) (order : NamedOrder)
      (boundary : Fin 17 → ℝ²)
      (hboundaryInjective : Function.Injective boundary)
      (hboundaryImage : Finset.univ.image boundary = D.A)
      (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
      (labelIndex : Label → Fin 17)
      (hlabelIndex : labelIndex =
        ATailBlockerVExactSeventeenSourceNormalForm.expectedLabelIndex orientation order)
      (hposition : PositionEmbedding orientation order labelIndex)
      (huPoint : boundary (labelIndex 6) = P.u.1)
      (hxuPoint : boundary (labelIndex 7) = packet.xu)
      (hvPoint : boundary (labelIndex 8) = P.v.1)
      (hxvPoint : boundary (labelIndex 9) = packet.xv)
      (hdeletedPoint : boundary (labelIndex 10) = P.jointDeletion.deleted.1)
      (hcPoint : boundary (labelIndex 11) = c)
      (hePoint : boundary (labelIndex 12) = e)
      (hcapLabel : ∀ label, label ∈ secondCapLabels →
        boundary (labelIndex label) ∈ cap) :
      Nonempty (SourceRealization D.A) := by
    let point : Label → ℝ² := fun label => boundary (labelIndex label)
    have hlabelInjective : Function.Injective labelIndex :=
      labelIndex_injective_of_positionEmbedding orientation order labelIndex hposition
    have hpointInjective : Function.Injective point :=
      hboundaryInjective.comp hlabelInjective
    have hpointImage : Finset.univ.image point = D.A := by
      ext x
      constructor
      · rintro hx
        rcases Finset.mem_image.mp hx with ⟨label, -, rfl⟩
        exact boundaryLabel_mem boundary hboundaryImage labelIndex label
      · intro hx
        rw [← hboundaryImage] at hx
        rcases Finset.mem_image.mp hx with ⟨index, -, rfl⟩
        obtain ⟨label, hlabel⟩ :=
          (Finite.injective_iff_surjective.mp hlabelInjective) index
        exact Finset.mem_image.mpr ⟨label, by simp, by simp [point, hlabel]⟩
    have hcapPullback : pullback point cap = secondCapLabels := by
      have hsub : secondCapLabels ⊆ pullback point cap := by
        intro label hlabel
        exact (mem_pullback point cap label).2 (hcapLabel label hlabel)
      have hpullCard : (pullback point cap).card = 9 := by
        rw [card_pullback_eq point D.A cap hpointInjective hpointImage]
        · simpa only [cap] using hcapCard
        · simpa only [cap] using S.capByIndex_subset S.oppIndex2
      have hlabelsCard : secondCapLabels.card = 9 := by native_decide
      exact (Finset.eq_of_subset_of_card_le hsub (by omega)).symm
    have holdRows : ∀ row,
        selectedOfPattern pattern boundary hboundaryImage labelIndex
            (oldCenter row) = pullback point (rowSupport row) := by
      intro row
      have hsupport :
          (pattern.classAt (point (oldCenter row))
            (boundaryLabel_mem boundary hboundaryImage labelIndex
              (oldCenter row))).support = rowSupport row := by
        fin_cases row
        · calc
            _ = (pattern.classAt (Hlate.centerAt packet.xv Q.hxvA)
                  (Finset.mem_of_mem_erase
                    (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell.center_mem)).support :=
                FaithfulCarrierPattern.classAt_support_congr pattern _ _
                  (by simpa only [point, oldCenter, hvPoint] using Q.hblockerEqV.symm)
            _ = Kxv.support := by
                simpa only [Kxv] using
                  Hlate.selectedFourClass_support_eq_shell packet.xv Q.hxvA
                    (pattern.classAt (Hlate.centerAt packet.xv Q.hxvA)
                      (Finset.mem_of_mem_erase
                        (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell.center_mem))
        · calc
            _ = (pattern.classAt (Hlate.centerAt P.u.1 P.u.2)
                  (Finset.mem_of_mem_erase
                    (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.center_mem)).support :=
                FaithfulCarrierPattern.classAt_support_congr pattern _ _
                  (by simpa only [point, oldCenter, hxvPoint] using hcenterU.symm)
            _ = Ku.support := by
                simpa only [Ku] using
                  Hlate.selectedFourClass_support_eq_shell P.u.1 P.u.2
                    (pattern.classAt (Hlate.centerAt P.u.1 P.u.2)
                      (Finset.mem_of_mem_erase
                        (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.center_mem))
        · calc
            _ = (pattern.classAt (Hlate.centerAt P.v.1 P.v.2)
                  (Finset.mem_of_mem_erase
                    (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.center_mem)).support :=
                FaithfulCarrierPattern.classAt_support_congr pattern _ _
                  (by simpa only [point, oldCenter, hdeletedPoint] using hcenterV.symm)
            _ = Kv.support := by
                simpa only [Kv] using
                  Hlate.selectedFourClass_support_eq_shell P.v.1 P.v.2
                    (pattern.classAt (Hlate.centerAt P.v.1 P.v.2)
                      (Finset.mem_of_mem_erase
                        (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.center_mem))
        · calc
            _ = (pattern.classAt
                  (Hlate.centerAt P.jointDeletion.deleted.1
                    P.jointDeletion.deleted.2)
                  (Finset.mem_of_mem_erase
                    (Hlate.selectedAt P.jointDeletion.deleted.1
                      P.jointDeletion.deleted.2).toCriticalFourShell.center_mem)).support :=
                FaithfulCarrierPattern.classAt_support_congr pattern _ _
                  (by simp only [point, oldCenter, hcPoint, c])
            _ = Kdel.support := by
                simpa only [Kdel] using
                  Hlate.selectedFourClass_support_eq_shell
                    P.jointDeletion.deleted.1 P.jointDeletion.deleted.2
                    (pattern.classAt
                      (Hlate.centerAt P.jointDeletion.deleted.1
                        P.jointDeletion.deleted.2)
                      (Finset.mem_of_mem_erase
                        (Hlate.selectedAt P.jointDeletion.deleted.1
                          P.jointDeletion.deleted.2).toCriticalFourShell.center_mem))
      simpa only [selectedOfPattern, point] using congrArg (pullback point) hsupport
    have holdCapGeom : ∀ row,
        rowSupport row ∩ cap =
          {boundary (labelIndex (oldFixedHit₁ row)),
            boundary (labelIndex (oldFixedHit₂ row))} := by
      intro row
      fin_cases row
      · simpa only [oldFixedHit₁, oldFixedHit₂, huPoint, hxuPoint, hvPoint,
          hxvPoint, hdeletedPoint] using holdCapRaw (0 : Fin 4)
      · simpa only [oldFixedHit₁, oldFixedHit₂, huPoint, hxuPoint, hvPoint,
          hxvPoint, hdeletedPoint] using holdCapRaw (1 : Fin 4)
      · simpa only [oldFixedHit₁, oldFixedHit₂, huPoint, hxuPoint, hvPoint,
          hxvPoint, hdeletedPoint] using holdCapRaw (2 : Fin 4)
      · simpa only [oldFixedHit₁, oldFixedHit₂, huPoint, hxuPoint, hvPoint,
          hxvPoint, hdeletedPoint] using holdCapRaw (3 : Fin 4)
    have hcA : c ∈ D.A := Finset.mem_of_mem_erase
      (Hlate.selectedAt P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2).toCriticalFourShell.center_mem
    let d := Hlate.centerAt c hcA
    have hdA : d ∈ D.A := Finset.mem_of_mem_erase <| by
      simpa only [d] using
        (Hlate.selectedAt c hcA).toCriticalFourShell.center_mem
    obtain ⟨nextCenter, hnextPoint⟩ : ∃ label, point label = d := by
      have hdImage : d ∈ Finset.univ.image point := by simpa [hpointImage] using hdA
      rcases Finset.mem_image.mp hdImage with ⟨label, -, hlabel⟩
      exact ⟨label, hlabel⟩
    have hnextCenter : point nextCenter =
        Hlate.centerAt (point 11)
          (boundaryLabel_mem boundary hboundaryImage labelIndex 11) := by
      simpa only [d, point, hcPoint] using hnextPoint
    have hphysicalPullback : pullback point C = physicalLabels := by
      change pullback point (SelectedClass D.A S.oppApex2 P.rho) =
        physicalLabels
      rw [packet.physical_class]
      rw [← hdeletedPoint, ← huPoint, ← hxuPoint, ← hvPoint,
        ← hxvPoint]
      ext label
      simp only [mem_pullback, physicalLabels, Finset.mem_insert,
        Finset.mem_union, Finset.mem_singleton]
      change
        (point label = point 10 ∨
            (point label = point 6 ∨ point label = point 7) ∨
              point label = point 8 ∨ point label = point 9) ↔
          label = 6 ∨ label = 7 ∨ label = 8 ∨ label = 9 ∨ label = 10
      simp only [hpointInjective.eq_iff]
      constructor
      · intro h
        rcases h with h10 | hrest
        · exact Or.inr (Or.inr (Or.inr (Or.inr h10)))
        · rcases hrest with h67 | h89
          · rcases h67 with h6 | h7
            · exact Or.inl h6
            · exact Or.inr (Or.inl h7)
          · rcases h89 with h8 | h9
            · exact Or.inr (Or.inr (Or.inl h8))
            · exact Or.inr (Or.inr (Or.inr (Or.inl h9)))
      · intro h
        rcases h with h6 | h7 | h8 | h9 | h10
        · exact Or.inr (Or.inl (Or.inl h6))
        · exact Or.inr (Or.inl (Or.inr h7))
        · exact Or.inr (Or.inr (Or.inl h8))
        · exact Or.inr (Or.inr (Or.inr h9))
        · exact Or.inl h10
    have hnextSupport :
        (pattern.classAt (point nextCenter)
          (boundaryLabel_mem boundary hboundaryImage labelIndex nextCenter)).support =
          (Hlate.selectedAt c hcA).toCriticalFourShell.support := by
      calc
        _ = (pattern.classAt d hdA).support :=
          FaithfulCarrierPattern.classAt_support_congr pattern _ _ hnextPoint
        _ = _ := by
          simpa only [d] using
            Hlate.selectedFourClass_support_eq_shell c hcA
              (pattern.classAt d hdA)
    have hnextPhysicalGeom :
        ((pattern.classAt (point nextCenter)
            (boundaryLabel_mem boundary hboundaryImage labelIndex nextCenter)).support ∩
          C).card ≤ 1 := by
      rw [hnextSupport]
      simpa only [Hlate, c, C] using hnextRowPhysicalHits
    exact exists_sourceRealization_of_geometricExactCover Hlate D.convex pattern order
      orientation boundary hboundaryInjective hboundaryImage hboundaryCcw
      labelIndex hlabelIndex hposition rowSupport holdRows cap hcapPullback holdCapGeom
      hexactCover'.1 hexactCover'.2 nextCenter hnextCenter C
      hphysicalPullback hnextPhysicalGeom
  have closeForward
      (order : NamedOrder)
      (huPos : (position order 6).val = iu.val)
      (hxuPos : (position order 7).val = ixu.val)
      (hvPos : (position order 8).val = iv.val)
      (hxvPos : (position order 9).val = ixv.val)
      (hdeletedPos : (position order 10).val = id.val)
      (hcPos : (position order 11).val = ic.val)
      (hePos : (position order 12).val = ie.val) :
      Nonempty (SourceRealization D.A) := by
    let shifted : Fin B.n → ℝ² := fun point => B.phi (point + B.Block.lo)
    let carrierBoundary : Fin D.A.card → ℝ² := fun point =>
      shifted (Fin.cast B.ambient_card_eq.symm point)
    let boundary : Fin 17 → ℝ² := fun point =>
      carrierBoundary (Fin.cast hcard.symm point)
    let labelIndex : Label → Fin 17 := position order
    have hshiftedInjective : Function.Injective shifted := by
      simpa only [shifted] using
        injective_cyclicShift B.phi_injective B.Block.lo
    have hcarrierInjective : Function.Injective carrierBoundary := by
      simpa only [carrierBoundary] using
        injective_finCast_domain B.ambient_card_eq hshiftedInjective
    have hboundaryInjective : Function.Injective boundary := by
      simpa only [boundary] using
        injective_finCast_domain hcard hcarrierInjective
    have hshiftedImage : Finset.univ.image shifted = D.A := by
      calc
        Finset.univ.image shifted = Finset.univ.image B.phi := by
          simpa only [shifted] using
            image_univ_cyclicShift B.phi B.Block.lo
        _ = D.A := B.Block.phi_image
    have hcarrierImage : Finset.univ.image carrierBoundary = D.A := by
      simpa only [carrierBoundary] using
        (image_univ_finCast_domain B.ambient_card_eq shifted).trans
          hshiftedImage
    have hboundaryImage : Finset.univ.image boundary = D.A := by
      simpa only [boundary] using
        (image_univ_finCast_domain hcard carrierBoundary).trans
          hcarrierImage
    have hshiftedCcw : EuclideanGeometry.IsCcwConvexPolygon shifted := by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift B.phi_injective B.phi_ccw B.Block.lo
    have hcarrierCcw : EuclideanGeometry.IsCcwConvexPolygon carrierBoundary := by
      simpa only [carrierBoundary] using
        ccw_finCast_domain B.ambient_card_eq hshiftedCcw
    have hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
      simpa only [boundary] using
        ccw_finCast_domain hcard hcarrierCcw
    have hposition : PositionEmbedding .forward order labelIndex := by
      intro point₁ point₂ hlt
      change position order point₁ < position order point₂
      exact hlt
    have pointAt (point : Label) (t : Fin B.m)
        (hpoint : (position order point).val = t.val) :
        boundary (labelIndex point) = B.L.points t := by
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm (position order point)) =
            Fin.castLE (by have hspan := B.block_span; omega) t := by
        apply Fin.ext
        exact hpoint
      simpa only [boundary, carrierBoundary, shifted, labelIndex, hcast] using
        B.shifted_phi_cast_eq_points t
    have hcapPosition : ∀ label, label ∈ secondCapLabels →
        (position order label).val < 9 := by
      fin_cases order <;> decide
    have hcapLabel : ∀ label, label ∈ secondCapLabels →
        boundary (labelIndex label) ∈ S.capByIndex S.oppIndex2 := by
      intro label hlabel
      have hlt := hcapPosition label hlabel
      change B.phi
        (Fin.cast B.ambient_card_eq.symm
            (Fin.cast hcard.symm (position order label)) + B.Block.lo) ∈
          S.capByIndex S.oppIndex2
      rw [B.shifted_phi_mem_cap_iff]
      change (position order label).val < B.m
      omega
    exact close .forward order boundary hboundaryInjective hboundaryImage
      hboundaryCcw labelIndex rfl hposition
      ((pointAt 6 iu huPos).trans hiu) ((pointAt 7 ixu hxuPos).trans hixu)
      ((pointAt 8 iv hvPos).trans hiv) ((pointAt 9 ixv hxvPos).trans hixv)
      ((pointAt 10 id hdeletedPos).trans hid) ((pointAt 11 ic hcPos).trans hic)
      ((pointAt 12 ie hePos).trans hie) hcapLabel
  have closeReverse
      (order : NamedOrder)
      (huPos : (position order 6).val + iu.val = 8)
      (hxuPos : (position order 7).val + ixu.val = 8)
      (hvPos : (position order 8).val + iv.val = 8)
      (hxvPos : (position order 9).val + ixv.val = 8)
      (hdeletedPos : (position order 10).val + id.val = 8)
      (hcPos : (position order 11).val + ic.val = 8)
      (hePos : (position order 12).val + ie.val = 8) :
      Nonempty (SourceRealization D.A) := by
    letI : NeZero B.n := ⟨by have hspan := B.block_span; omega⟩
    let cut : Fin B.n := ⟨(B.Block.hi.val + 1) % B.n,
      Nat.mod_lt _ (by have := B.Block.hi.isLt; omega)⟩
    let shifted : Fin B.n → ℝ² := fun point => B.phi (point + cut)
    let carrierBoundary : Fin D.A.card → ℝ² := fun point =>
      shifted (Fin.cast B.ambient_card_eq.symm point)
    let boundary : Fin 17 → ℝ² := fun point =>
      carrierBoundary (Fin.cast hcard.symm point)
    let labelIndex : Label → Fin 17 := fun point => Fin.rev (position order point)
    have hshiftedInjective : Function.Injective shifted := by
      simpa only [shifted] using injective_cyclicShift B.phi_injective cut
    have hcarrierInjective : Function.Injective carrierBoundary := by
      simpa only [carrierBoundary] using
        injective_finCast_domain B.ambient_card_eq hshiftedInjective
    have hboundaryInjective : Function.Injective boundary := by
      simpa only [boundary] using
        injective_finCast_domain hcard hcarrierInjective
    have hshiftedImage : Finset.univ.image shifted = D.A := by
      calc
        Finset.univ.image shifted = Finset.univ.image B.phi := by
          simpa only [shifted] using image_univ_cyclicShift B.phi cut
        _ = D.A := B.Block.phi_image
    have hcarrierImage : Finset.univ.image carrierBoundary = D.A := by
      simpa only [carrierBoundary] using
        (image_univ_finCast_domain B.ambient_card_eq shifted).trans
          hshiftedImage
    have hboundaryImage : Finset.univ.image boundary = D.A := by
      simpa only [boundary] using
        (image_univ_finCast_domain hcard carrierBoundary).trans
          hcarrierImage
    have hshiftedCcw : EuclideanGeometry.IsCcwConvexPolygon shifted := by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift B.phi_injective B.phi_ccw cut
    have hcarrierCcw : EuclideanGeometry.IsCcwConvexPolygon carrierBoundary := by
      simpa only [carrierBoundary] using
        ccw_finCast_domain B.ambient_card_eq hshiftedCcw
    have hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
      simpa only [boundary] using
        ccw_finCast_domain hcard hcarrierCcw
    have hposition : PositionEmbedding .reverse order labelIndex := by
      intro point₁ point₂ hlt
      change (Fin.rev (position order point₂)).val <
        (Fin.rev (position order point₁)).val
      rw [Fin.val_rev, Fin.val_rev]
      have hltVal : (position order point₁).val <
          (position order point₂).val := hlt
      have hp₁ := (position order point₁).isLt
      have hp₂ := (position order point₂).isLt
      omega
    have pointAt (point : Label) (t : Fin B.m)
        (hpoint : (position order point).val + t.val = 8) :
        boundary (labelIndex point) = B.L.points t := by
      let offset : Fin B.n := ⟨B.n - B.m + t.val, by
        have hspan := B.block_span
        have hmpos := B.Block.hm
        omega⟩
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm (Fin.rev (position order point))) =
            offset := by
        apply Fin.ext
        simp only [Fin.val_cast, Fin.val_rev]
        dsimp only [offset]
        have hn : B.n = 17 := B.ambient_card_eq.trans hcard
        omega
      simpa only [boundary, carrierBoundary, shifted, labelIndex, cut, hcast,
        offset] using B.shifted_after_block_phi_cast_eq_points t
    have hcapPosition : ∀ label, label ∈ secondCapLabels →
        (position order label).val < 9 := by
      fin_cases order <;> decide
    have hcapLabel : ∀ label, label ∈ secondCapLabels →
        boundary (labelIndex label) ∈ S.capByIndex S.oppIndex2 := by
      intro label hlabel
      have hlt := hcapPosition label hlabel
      let t : Fin B.m := ⟨B.m - 1 - (position order label).val, by omega⟩
      have hsum : (position order label).val + t.val = 8 := by
        change (position order label).val +
          (B.m - 1 - (position order label).val) = 8
        omega
      exact (pointAt label t hsum) ▸ B.points_mem_cap t
    exact close .reverse order boundary hboundaryInjective hboundaryImage
      hboundaryCcw labelIndex rfl hposition
      ((pointAt 6 iu huPos).trans hiu) ((pointAt 7 ixu hxuPos).trans hixu)
      ((pointAt 8 iv hvPos).trans hiv) ((pointAt 9 ixv hxvPos).trans hixv)
      ((pointAt 10 id hdeletedPos).trans hid) ((pointAt 11 ic hcPos).trans hic)
      ((pointAt 12 ie hePos).trans hie) hcapLabel
  rcases horders with horder | horder | horder | horder
  · exact closeForward 0 (by simp [position]; omega)
      (by simp [position]; omega) (by simp [position]; omega)
      (by simp [position]; omega) (by simp [position]; omega)
      (by simp [position]; omega) (by simp [position]; omega)
  · exact closeForward 1 (by simp [position]; omega)
      (by simp [position]; omega) (by simp [position]; omega)
      (by simp [position]; omega) (by simp [position]; omega)
      (by simp [position]; omega) (by simp [position]; omega)
  · exact closeReverse 0 (by simp [position]; omega)
      (by simp [position]; omega) (by simp [position]; omega)
      (by simp [position]; omega) (by simp [position]; omega)
      (by simp [position]; omega) (by simp [position]; omega)
  · exact closeReverse 1 (by simp [position]; omega)
      (by simp [position]; omega) (by simp [position]; omega)
      (by simp [position]; omega) (by simp [position]; omega)
      (by simp [position]; omega) (by simp [position]; omega)

theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_eq_seventeen_secondCapNine
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (hcenterDeletedInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (hcenterDeletedOffClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∉
        SelectedClass D.A S.oppApex2 P.rho)
    (hcard : D.A.card = 17)
    (hcapCard : (S.capByIndex S.oppIndex2).card = 9)
    (_hnextRowPhysicalHits :
      let Hlate := lateFirstApexSystem R
      let c := Hlate.centerAt P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2
      let hcA : c ∈ D.A := Finset.mem_of_mem_erase
        (Hlate.selectedAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.center_mem
      (((Hlate.selectedAt c hcA).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 P.rho).card ≤ 1)) :
    False := by
  rcases
    exactFourRigid221_blockerV_exactSeventeen_secondCapNine_outsideRows_unused_or_exactCover
      Q hcenterV hcenterDeletedInterior hcenterDeletedOffClass hcard hcapCard
    with hunused | hexactCover
  · rcases hunused with ⟨unused, hunusedOutside, hunusedRows⟩
    have hunusedCarrierAndNotCap := Finset.mem_sdiff.mp hunusedOutside
    exact
      false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_eq_seventeen_secondCapNine_of_unusedOutside
        Q hcenterV hcenterDeletedInterior hcenterDeletedOffClass hcard
        unused hunusedCarrierAndNotCap.1 hunusedCarrierAndNotCap.2
        (by simpa using hunusedRows (0 : Fin 4))
        (by simpa using hunusedRows (1 : Fin 4))
        (by simpa using hunusedRows (2 : Fin 4))
        (by simpa using hunusedRows (3 : Fin 4))
        hcapCard
  · sorry

/-- Unbounded continuation of the deleted-row `BlockerV` residual after the
exact-cardinality-seventeen stratum is isolated. -/
theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_ge_eighteen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (_Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (_hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (_hcenterDeletedInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (_hcenterDeletedOffClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∉
        SelectedClass D.A S.oppApex2 P.rho)
    (_hcard : 18 ≤ D.A.card)
    (_hnextRowPhysicalHits :
      let Hlate := lateFirstApexSystem R
      let c := Hlate.centerAt P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2
      let hcA : c ∈ D.A := Finset.mem_of_mem_erase
        (Hlate.selectedAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.center_mem
      (((Hlate.selectedAt c hcA).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 P.rho).card ≤ 1)) :
    False := by
  sorry

/-- Checked split of the remaining direct residual.  At exact seventeen the
second cap has cardinality nine, ten, or eleven.  The ten- and eleven-point
caps reduce to the exact-sixteen and exact-fifteen banks respectively; only
the exact-nine cap remains.  Above exact seventeen the surviving child starts
at cardinality eighteen.

Coordinator-interface frontier: one child with `17 ≤ |A|` before this split;
after it, one exact-17/cap-9 child and one child with `18 ≤ |A|`.  Immediate
constructor fan-out changes from one to two. -/
theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_ge_seventeen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (_Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (_hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (_hcenterDeletedInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (_hcenterDeletedOffClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∉
        SelectedClass D.A S.oppApex2 P.rho)
    (_hcard : 17 ≤ D.A.card)
    (_hnextRowPhysicalHits :
      let Hlate := lateFirstApexSystem R
      let c := Hlate.centerAt P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2
      let hcA : c ∈ D.A := Finset.mem_of_mem_erase
        (Hlate.selectedAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.center_mem
      (((Hlate.selectedAt c hcA).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 P.rho).card ≤ 1)) :
    False := by
  by_cases hcardEq : D.A.card = 17
  · by_cases hcapEleven : (S.capByIndex S.oppIndex2).card = 11
    · exact
        false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_eq_seventeen_secondCapEleven
          _Q _hcenterV _hcenterDeletedInterior _hcenterDeletedOffClass
          hcardEq hcapEleven
    · by_cases hcapTen : (S.capByIndex S.oppIndex2).card = 10
      · exact
          false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_eq_seventeen_secondCapTen
            _Q _hcenterV _hcenterDeletedInterior _hcenterDeletedOffClass
            hcardEq hcapTen
      · have hnamed :=
          exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_namedSeven
            _Q _hcenterV _hcenterDeletedInterior _hcenterDeletedOffClass
        have hcapAdd :=
          ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
            S S.oppIndex2
        rw [capByIndex_oppIndex2_eq_oppCap2_sourceHeavy S] at hcapAdd
        have hsum := S.capSum
        have hsurplus := S.surplus_card_gt_four
        have hfirst := P.surface.firstOppCap_card_ge_four
        have hsecondLower : 9 ≤ S.oppCap2.card := by
          have hIcard : 7 ≤ (S.capInteriorByIndex S.oppIndex2).card := by
            have hle := Finset.card_le_card hnamed.1
            omega
          omega
        have hsecondNine : S.oppCap2.card = 9 := by
          have hsecondNotEleven : S.oppCap2.card ≠ 11 := by
            simpa only [capByIndex_oppIndex2_eq_oppCap2_sourceHeavy S] using
              hcapEleven
          have hsecondNotTen : S.oppCap2.card ≠ 10 := by
            simpa only [capByIndex_oppIndex2_eq_oppCap2_sourceHeavy S] using
              hcapTen
          omega
        have hcapNine : (S.capByIndex S.oppIndex2).card = 9 := by
          simpa only [capByIndex_oppIndex2_eq_oppCap2_sourceHeavy S] using
            hsecondNine
        exact
          false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_eq_seventeen_secondCapNine
            _Q _hcenterV _hcenterDeletedInterior _hcenterDeletedOffClass
            hcardEq hcapNine _hnextRowPhysicalHits
  · have h18 : 18 ≤ D.A.card := by omega
    exact
      false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_ge_eighteen
        _Q _hcenterV _hcenterDeletedInterior _hcenterDeletedOffClass h18
        _hnextRowPhysicalHits

/-- Split coordinator for the direct residual after exact fifteen.  At exact
sixteen the second cap has cardinality nine or ten, and the two certificate
adapters discharge those cases; the remaining branch starts at seventeen. -/
theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_ge_sixteen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (_Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (_hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (_hcenterDeletedInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (_hcenterDeletedOffClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∉
        SelectedClass D.A S.oppApex2 P.rho)
    (_hcard : 16 ≤ D.A.card)
    (_hnextRowPhysicalHits :
      let Hlate := lateFirstApexSystem R
      let c := Hlate.centerAt P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2
      let hcA : c ∈ D.A := Finset.mem_of_mem_erase
        (Hlate.selectedAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.center_mem
      (((Hlate.selectedAt c hcA).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 P.rho).card ≤ 1)) :
    False := by
  by_cases hcardEq : D.A.card = 16
  · exact
      false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_eq_sixteen
        _Q _hcenterV _hcenterDeletedInterior _hcenterDeletedOffClass hcardEq
  · have h17 : 17 ≤ D.A.card := by omega
    exact
      false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_ge_seventeen
        _Q _hcenterV _hcenterDeletedInterior _hcenterDeletedOffClass h17
        _hnextRowPhysicalHits

/-- Sole surviving subcase of the deleted-row blocker arm.  Its blocker lies
strictly inside the second cap but outside the exact physical five-class.
Those seven distinct interior points force the second cap to have cardinality
at least nine and the whole carrier to have cardinality at least fifteen.
Moreover, the critical row through that off-class blocker meets the physical
five-class in at most one point, so at least three of its four support points
lie outside the physical class.

Coordinator-interface frontier: one child with `15 ≤ |A|` and next-row overlap
at most one before this narrowing, and one child with `17 ≤ |A|` and the same
overlap bound after it.  Constructor fan-out remains one; the exact-cardinality
12 through 16 strata and the two-hit next-row arm are eliminated.
-/
theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1)
    (hcenterDeletedInterior :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (hcenterDeletedOffClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∉
        SelectedClass D.A S.oppApex2 P.rho)
    (hcard : 15 ≤ D.A.card)
    (hnextRowPhysicalHits :
      let Hlate := lateFirstApexSystem R
      let c := Hlate.centerAt P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2
      let hcA : c ∈ D.A := Finset.mem_of_mem_erase
        (Hlate.selectedAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.center_mem
      (((Hlate.selectedAt c hcA).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 P.rho).card ≤ 1)) :
    False := by
  by_cases h15 : D.A.card = 15
  · exact
      false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_eq_fifteen
        Q hcenterV hcenterDeletedInterior hcenterDeletedOffClass h15
  · have h16 : 16 ≤ D.A.card := by omega
    exact
      false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_ge_sixteen
        Q hcenterV hcenterDeletedInterior hcenterDeletedOffClass h16
        hnextRowPhysicalHits

/-- Second continuation of the `BlockerV` pentagon: the next row blocker,
centred at `v`, is the joint-deletion point.  The physical-five-class arm is
impossible; only the strict-cap, off-class blocker remains. -/
theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
        P.jointDeletion.deleted.1) :
    False := by
  have hcenterDeletedInterior :=
    blockerV_vRowBlockerDeleted_centerDeletedInterior Q hcenterV
  by_cases hcenterDeletedClass :
      (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2 ∈
        SelectedClass D.A S.oppApex2 P.rho
  · exact
      false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerClass
      Q hcenterV hcenterDeletedClass
  · exact
      false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass
        Q hcenterV hcenterDeletedInterior hcenterDeletedClass
        (exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_ge_fifteen
          Q hcenterV hcenterDeletedInterior hcenterDeletedClass)
        (exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_nextRow_physical_hits_le_one
          Q hcenterV hcenterDeletedInterior hcenterDeletedClass)

/-- Third live continuation of the `BlockerV` pentagon: the next row blocker,
centred at `v`, lies outside the exact physical five-class. -/
theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerOffClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (_Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (_hcenterV :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 ∉
        SelectedClass D.A S.oppApex2 P.rho) :
    False := by
  sorry

/-- Pentagon blocker leaf: the `xv`-row blocker is the opposite source `v`.
Narrowing over the parent pentagon: the blocker is pinned to a named class
point, which also puts `v` in the strict second-cap interior via the
parent-proved blocker localization, and `v` is therefore equidistant from
the pinned edge `{xv, u}` while being off the `xv` row.  This is the
rotationally continued five-cycle: `centerAt u = xv` and
`centerAt xv = v` both send a row source to its cycle predecessor.

Coordinator-interface frontier: one `BlockerV` leaf before this split.  The
immediate source-exhaustive constructor fan-out is three: `centerAt v = xu`,
`centerAt v = deleted`, or the blocker is off the physical class.  The `xu`
arm is discharged by the ordered-cap betweenness cycle, so the live frontier
after this change has two strictly stronger continuations: `deleted` and
off-class.  The other three exact-five alternatives are closed inside this
parent by center-not-in-row or equilateral geometry. -/
theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (_packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (_hsecond : 6 ≤ S.oppCap2.card)
    (hxuA : _packet.xu ∈ D.A)
    (hxvA : _packet.xv ∈ D.A)
    (_huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          _packet.xv hxvA).toCriticalFourShell.support)
    (_huNotXuRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          _packet.xu hxuA).toCriticalFourShell.support)
    (_hxvNotXuRow :
      _packet.xv ∉
        ((lateFirstApexSystem R).selectedAt
          _packet.xu hxuA).toCriticalFourShell.support)
    (_hdeletedXuRow :
      P.jointDeletion.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          _packet.xu hxuA).toCriticalFourShell.support)
    (_hvDeletedRow :
      P.v.1 ∈
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support)
    (_huNotDeletedRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support)
    (_hxuNotDeletedRow :
      _packet.xu ∉
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support)
    (_hxvNotDeletedRow :
      _packet.xv ∉
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support)
    (_hclassFive :
      ∀ q ∈ SelectedClass D.A S.oppApex2 P.rho,
        q = P.u.1 ∨ q = _packet.xu ∨ q = P.jointDeletion.deleted.1 ∨
          q = P.v.1 ∨ q = _packet.xv)
    (_hxvInterior :
      _packet.xv ∈ S.capInteriorByIndex S.oppIndex2)
    (_hblockerInterior :
      (lateFirstApexSystem R).centerAt _packet.xv hxvA ∈
        S.capInteriorByIndex S.oppIndex2)
    (_hblockerEqV :
      (lateFirstApexSystem R).centerAt _packet.xv hxvA = P.v.1)
    (_htraceBound :
      ∀ x ∈
        ((lateFirstApexSystem R).selectedAt
          _packet.xv hxvA).toCriticalFourShell.support,
        x ∈ SelectedClass D.A S.oppApex2 P.rho →
          x = _packet.xv ∨ x = P.u.1)
    (_htraceBoundXu :
      ∀ x ∈
        ((lateFirstApexSystem R).selectedAt
          _packet.xu hxuA).toCriticalFourShell.support,
        x ∈ SelectedClass D.A S.oppApex2 P.rho →
          x = _packet.xu ∨ x = P.jointDeletion.deleted.1) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kv :=
    (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
  let Kxv :=
    (Hlate.selectedAt _packet.xv hxvA).toCriticalFourShell
  let Q : ExactFourRigid221PentagonBlockerVResidual P _packet := {
    hsecond := _hsecond
    hxuA := hxuA
    hxvA := hxvA
    huXvRow := _huXvRow
    huNotXuRow := _huNotXuRow
    hxvNotXuRow := _hxvNotXuRow
    hdeletedXuRow := _hdeletedXuRow
    hvDeletedRow := _hvDeletedRow
    huNotDeletedRow := _huNotDeletedRow
    hxuNotDeletedRow := _hxuNotDeletedRow
    hxvNotDeletedRow := _hxvNotDeletedRow
    hclassFive := _hclassFive
    hxvInterior := _hxvInterior
    hblockerInterior := _hblockerInterior
    hblockerEqV := _hblockerEqV
    htraceBound := _htraceBound
    htraceBoundXu := _htraceBoundXu }
  have hxvVRow : _packet.xv ∈ Kv.support := by
    have hmem :
        _packet.xv ∈ Kv.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
      rw [_packet.opposite_row_trace]
      simp
    exact (Finset.mem_inter.mp hmem).1
  have hxvClass :
      _packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho := by
    have hmem :
        _packet.xv ∈ Kv.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
      rw [_packet.opposite_row_trace]
      simp
    exact (Finset.mem_inter.mp hmem).2
  by_cases hcenterVClass :
      Hlate.centerAt P.v.1 P.v.2 ∈
        SelectedClass D.A S.oppApex2 P.rho
  · rcases _hclassFive _ hcenterVClass with
      hcenterU | hcenterXu | hcenterDeleted | hcenterV | hcenterXv
    · have hcenterXv : Hlate.centerAt _packet.xv hxvA = P.v.1 :=
        _hblockerEqV
      have hvxv_eq_vu :
          dist P.v.1 _packet.xv = dist P.v.1 P.u.1 := by
        have h :=
          (Kxv.support_eq_radius _ Kxv.q_mem_support).trans
            (Kxv.support_eq_radius _ _huXvRow).symm
        simpa only [hcenterXv] using h
      have huv_eq_uxv :
          dist P.u.1 P.v.1 = dist P.u.1 _packet.xv := by
        have h :=
          (Kv.support_eq_radius _ Kv.q_mem_support).trans
            (Kv.support_eq_radius _ hxvVRow).symm
        simpa only [hcenterU] using h
      have huNeV : P.u.1 ≠ P.v.1 := by
        intro h
        exact P.huNeV (Subtype.ext h)
      have huNeXv : P.u.1 ≠ _packet.xv := by
        intro h
        apply P.huOmitted
        simpa only [h] using hxvVRow
      have hvNeXv : P.v.1 ≠ _packet.xv :=
        _packet.xv_ne_v.symm
      have huxv_eq_vxv :
          dist P.u.1 _packet.xv = dist P.v.1 _packet.xv := by
        calc
          dist P.u.1 _packet.xv = dist P.u.1 P.v.1 := huv_eq_uxv.symm
          _ = dist P.v.1 P.u.1 := dist_comm _ _
          _ = dist P.v.1 _packet.xv := hvxv_eq_vu.symm
      have huv_eq_vxv :
          dist P.u.1 P.v.1 = dist P.v.1 _packet.xv := by
        calc
          dist P.u.1 P.v.1 = dist P.v.1 P.u.1 := dist_comm _ _
          _ = dist P.v.1 _packet.xv := hvxv_eq_vu.symm
      exact
        exactFourRigid221_sourceHeavy_equilateral_class_triple_false
          P P.u.2 P.v.2 hxvA huNeV huNeXv hvNeXv
          P.huClass P.hvClass hxvClass huxv_eq_vxv huv_eq_vxv
    · exact
        false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerXu
          Q hcenterXu
    · exact
        false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted
          Q hcenterDeleted
    · exact (centerAt_ne_source Hlate P.v.1 P.v.2 hcenterV).elim
    · apply False.elim
      apply Kv.center_not_mem_support
      simpa only [hcenterXv] using hxvVRow
  · exact
      false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerOffClass
        Q hcenterVClass

/-- Full source data for the pentagon branch in which the `xv`-row blocker is
strictly inside the physical second cap but off the physical class.  Keeping
the parent data bundled here lets the two terminal leaves below strengthen the
parent without erasing any of its hypotheses. -/
structure ExactFourRigid221PentagonOffClassBlockerResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P) : Type where
  hsecond : 6 ≤ S.oppCap2.card
  hxuA : packet.xu ∈ D.A
  hxvA : packet.xv ∈ D.A
  huXvRow :
    P.u.1 ∈
      ((lateFirstApexSystem R).selectedAt
        packet.xv hxvA).toCriticalFourShell.support
  huNotXuRow :
    P.u.1 ∉
      ((lateFirstApexSystem R).selectedAt
        packet.xu hxuA).toCriticalFourShell.support
  hxvNotXuRow :
    packet.xv ∉
      ((lateFirstApexSystem R).selectedAt
        packet.xu hxuA).toCriticalFourShell.support
  hdeletedXuRow :
    P.jointDeletion.deleted.1 ∈
      ((lateFirstApexSystem R).selectedAt
        packet.xu hxuA).toCriticalFourShell.support
  hvDeletedRow :
    P.v.1 ∈
      ((lateFirstApexSystem R).selectedAt
        P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2).toCriticalFourShell.support
  huNotDeletedRow :
    P.u.1 ∉
      ((lateFirstApexSystem R).selectedAt
        P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2).toCriticalFourShell.support
  hxuNotDeletedRow :
    packet.xu ∉
      ((lateFirstApexSystem R).selectedAt
        P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2).toCriticalFourShell.support
  hxvNotDeletedRow :
    packet.xv ∉
      ((lateFirstApexSystem R).selectedAt
        P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2).toCriticalFourShell.support
  hclassFive :
    ∀ q ∈ SelectedClass D.A S.oppApex2 P.rho,
      q = P.u.1 ∨ q = packet.xu ∨ q = P.jointDeletion.deleted.1 ∨
        q = P.v.1 ∨ q = packet.xv
  hxvInterior : packet.xv ∈ S.capInteriorByIndex S.oppIndex2
  hblockerInterior :
    (lateFirstApexSystem R).centerAt packet.xv hxvA ∈
      S.capInteriorByIndex S.oppIndex2
  hblockerNotClass :
    (lateFirstApexSystem R).centerAt packet.xv hxvA ∉
      SelectedClass D.A S.oppApex2 P.rho
  htraceBound :
    ∀ x ∈
      ((lateFirstApexSystem R).selectedAt
        packet.xv hxvA).toCriticalFourShell.support,
      x ∈ SelectedClass D.A S.oppApex2 P.rho →
        x = packet.xv ∨ x = P.u.1
  htraceBoundXu :
    ∀ x ∈
      ((lateFirstApexSystem R).selectedAt
        packet.xu hxuA).toCriticalFourShell.support,
      x ∈ SelectedClass D.A S.oppApex2 P.rho →
        x = packet.xu ∨ x = P.jointDeletion.deleted.1

/-- The exact selected row at `xu` contains the joint-deletion point, so a
four-point row at the same center cannot survive erasing that point.  This is
the source-level adapter behind the direct collision rejected by the exact-12
placement audit; it is a narrowing fact, not a contradiction for the full
residual. -/
theorem pentagonOffClassBlocker_xuRow_survival_forces_deleted_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    {z : ℝ²}
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase z)
        ((lateFirstApexSystem R).centerAt packet.xu Q.hxuA)) :
    P.jointDeletion.deleted.1 ≠ z := by
  intro hdeletedEq
  have hzNotXuRow :
      z ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xu Q.hxuA).toCriticalFourShell.support :=
    (cross_deletion_survives_iff_not_mem_selected_support
      (lateFirstApexSystem R) Q.hxuA).mp hsurvives
  apply hzNotXuRow
  rw [← hdeletedEq]
  exact Q.hdeletedXuRow

theorem pentagonOffClassBlocker_u_ne_xv
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet : ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P) :
    P.u.1 ≠ packet.xv := by
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell
  have hcenter :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [P.huSource] using packet.blocker_eq_xv
  intro huEqXv
  have hxvKu : packet.xv ∈ Ku.support := by
    simpa [Ku, huEqXv] using Ku.q_mem_support
  have hmemEq :
      ((lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈ Ku.support) =
        (packet.xv ∈ Ku.support) :=
    congrArg (fun z : ℝ² ↦ z ∈ Ku.support) hcenter
  exact Ku.center_not_mem_support (hmemEq.mpr hxvKu)

/-- The two carrier points on the perpendicular bisector of `{xv,u}` are
exactly the actual blocker of the `xv` row and the physical apex. -/
theorem pentagonOffClassBlocker_xv_u_bisector_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet : ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    D.A.filter (fun z ↦ dist z packet.xv = dist z P.u.1) =
      ({(lateFirstApexSystem R).centerAt packet.xv hxvA,
          S.oppApex2} : Finset ℝ²) := by
  classical
  let Kxv :=
    ((lateFirstApexSystem R).selectedAt
      packet.xv hxvA).toCriticalFourShell
  have huNeXv : P.u.1 ≠ packet.xv :=
    pentagonOffClassBlocker_u_ne_xv P packet
  have hcNeO :
      (lateFirstApexSystem R).centerAt packet.xv hxvA ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne
      (lateFirstApexSystem R) packet.xv hxvA
  have hcA :
      (lateFirstApexSystem R).centerAt packet.xv hxvA ∈ D.A :=
    (Finset.mem_erase.mp Kxv.center_mem).2
  have hOA : S.oppApex2 ∈ D.A :=
    P.surface.ingress.packet.center₂_mem_A
  have hcBisects :
      dist ((lateFirstApexSystem R).centerAt packet.xv hxvA) packet.xv =
        dist ((lateFirstApexSystem R).centerAt packet.xv hxvA) P.u.1 := by
    exact (Kxv.support_eq_radius packet.xv Kxv.q_mem_support).trans
      (Kxv.support_eq_radius P.u.1 huXvRow).symm
  have hxvClass : packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.physical_class]
    simp
  have hOBisects :
      dist S.oppApex2 packet.xv = dist S.oppApex2 P.u.1 :=
    ((mem_selectedClass.mp hxvClass).2).trans
      ((mem_selectedClass.mp P.huClass).2).symm
  have hbound :
      (D.A.filter (fun z ↦ dist z packet.xv = dist z P.u.1)).card ≤ 2 :=
    Dumitrescu.perpBisector_apex_bound D.convex hxvA P.u.2 huNeXv.symm
  refine (Finset.eq_of_subset_of_card_le ?_ ?_).symm
  · intro z hz
    rcases Finset.mem_insert.mp hz with rfl | hz
    · exact Finset.mem_filter.mpr ⟨hcA, hcBisects⟩
    · rw [Finset.mem_singleton] at hz
      exact hz ▸ Finset.mem_filter.mpr ⟨hOA, hOBisects⟩
  · rw [Finset.card_pair hcNeO]
    exact hbound

/-- The two carrier points on the perpendicular bisector of `{xu,deleted}` are
exactly the actual blocker of the `xu` row and the physical apex.

This is the `{xu,deleted}` analogue of
`pentagonOffClassBlocker_xv_u_bisector_eq_pair`.  Both named points bisect for
source-clean reasons: `xu` and `deleted` are the two physical-class points of
the `xu` row (`htraceBoundXu`), so the row centre is equidistant from them;
and both lie in the physical class at radius `rho`, so the second apex is too.
The Dumitrescu apex bound then forces the census to be exact. -/
theorem pentagonOffClassBlocker_xu_deleted_bisector_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet) :
    D.A.filter
        (fun z ↦ dist z packet.xu = dist z P.jointDeletion.deleted.1) =
      ({(lateFirstApexSystem R).centerAt packet.xu Q.hxuA,
          S.oppApex2} : Finset ℝ²) := by
  classical
  let Kxu :=
    ((lateFirstApexSystem R).selectedAt
      packet.xu Q.hxuA).toCriticalFourShell
  let Kdeleted :=
    ((lateFirstApexSystem R).selectedAt
      P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2).toCriticalFourShell
  have hxuNeDeleted : packet.xu ≠ P.jointDeletion.deleted.1 := by
    intro h
    exact Q.hxuNotDeletedRow
      (by simpa only [h] using Kdeleted.q_mem_support)
  have hcNeO :
      (lateFirstApexSystem R).centerAt packet.xu Q.hxuA ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne
      (lateFirstApexSystem R) packet.xu Q.hxuA
  have hcA :
      (lateFirstApexSystem R).centerAt packet.xu Q.hxuA ∈ D.A :=
    (Finset.mem_erase.mp Kxu.center_mem).2
  have hOA : S.oppApex2 ∈ D.A :=
    P.surface.ingress.packet.center₂_mem_A
  have hcBisects :
      dist ((lateFirstApexSystem R).centerAt packet.xu Q.hxuA) packet.xu =
        dist ((lateFirstApexSystem R).centerAt packet.xu Q.hxuA)
          P.jointDeletion.deleted.1 :=
    (Kxu.support_eq_radius packet.xu Kxu.q_mem_support).trans
      (Kxu.support_eq_radius P.jointDeletion.deleted.1 Q.hdeletedXuRow).symm
  have hxuClass : packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.physical_class]
    simp
  have hOBisects :
      dist S.oppApex2 packet.xu =
        dist S.oppApex2 P.jointDeletion.deleted.1 :=
    ((mem_selectedClass.mp hxuClass).2).trans
      ((mem_selectedClass.mp P.jointDeletion.deleted_mem_class).2).symm
  have hbound :
      (D.A.filter
          (fun z ↦
            dist z packet.xu = dist z P.jointDeletion.deleted.1)).card ≤ 2 :=
    Dumitrescu.perpBisector_apex_bound D.convex Q.hxuA
      P.jointDeletion.deleted.2 hxuNeDeleted
  refine (Finset.eq_of_subset_of_card_le ?_ ?_).symm
  · intro z hz
    rcases Finset.mem_insert.mp hz with rfl | hz
    · exact Finset.mem_filter.mpr ⟨hcA, hcBisects⟩
    · rw [Finset.mem_singleton] at hz
      exact hz ▸ Finset.mem_filter.mpr ⟨hOA, hOBisects⟩
  · rw [Finset.card_pair hcNeO]
    exact hbound

#print axioms pentagonOffClassBlocker_xu_deleted_bisector_eq_pair

/-- The physical apex is never a member of its own radius class. -/
theorem pentagonOffClassBlocker_oppApex2_not_mem_physicalClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) :
    S.oppApex2 ∉ SelectedClass D.A S.oppApex2 P.rho := by
  intro hmem
  have hdist := (mem_selectedClass.mp hmem).2
  rw [dist_self] at hdist
  linarith [P.hrho]

#print axioms pentagonOffClassBlocker_oppApex2_not_mem_physicalClass

/-- **The `xu`-row blocker is decided by one distance equality.**  Given the
`{xu,deleted}` bisector census, the actual blocker of the `xu` row equals the
second rigid row source `v` exactly when `v` is equidistant from `xu` and the
jointly deleted point.

This converts a cross-centre *membership* question into a single metric
equation inside the five-point physical class.  Its consumer is the
missing-incidence residual: the first of the five tetrahedron incidences,
`centerAt xu ∈ SelectedClass (D.A.erase u) S.oppApex2 rho`, is equivalent to
`centerAt xu = v`, so this theorem reduces that incidence to
`dist v xu = dist v deleted`. -/
theorem pentagonOffClassBlocker_centerAt_xu_eq_v_iff_v_bisects
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet) :
    (lateFirstApexSystem R).centerAt packet.xu Q.hxuA = P.v.1 ↔
      dist P.v.1 packet.xu = dist P.v.1 P.jointDeletion.deleted.1 := by
  classical
  have hcensus := pentagonOffClassBlocker_xu_deleted_bisector_eq_pair Q
  have hvNeO : P.v.1 ≠ S.oppApex2 := by
    intro hv
    exact pentagonOffClassBlocker_oppApex2_not_mem_physicalClass P
      (hv ▸ P.hvClass)
  constructor
  · intro hEq
    have hcmem :
        (lateFirstApexSystem R).centerAt packet.xu Q.hxuA ∈
          D.A.filter
            (fun z ↦
              dist z packet.xu = dist z P.jointDeletion.deleted.1) := by
      rw [hcensus]
      exact Finset.mem_insert_self _ _
    rw [hEq] at hcmem
    exact (Finset.mem_filter.mp hcmem).2
  · intro hbisect
    have hmem :
        P.v.1 ∈
          D.A.filter
            (fun z ↦
              dist z packet.xu = dist z P.jointDeletion.deleted.1) :=
      Finset.mem_filter.mpr ⟨P.v.2, hbisect⟩
    rw [hcensus] at hmem
    rcases Finset.mem_insert.mp hmem with h | h
    · exact h.symm
    · exact absurd (Finset.mem_singleton.mp h) hvNeO

#print axioms pentagonOffClassBlocker_centerAt_xu_eq_v_iff_v_bisects

/-- **At most one physical-class point bisects `{xu,deleted}`.**  The census
pair is `{centerAt xu, oppApex2}` and the apex is never in its own radius
class, so the bisector meets the five-point physical class in at most the
`xu`-row blocker alone.

This is the `≤ 1` class-intersection shape the source-clean cross-row
consumers take, stated for the `{xu,deleted}` chord rather than a selected
row. -/
theorem pentagonOffClassBlocker_xu_deleted_bisector_inter_physicalClass_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet) :
    (D.A.filter
        (fun z ↦ dist z packet.xu = dist z P.jointDeletion.deleted.1) ∩
      SelectedClass D.A S.oppApex2 P.rho).card ≤ 1 := by
  classical
  have hsub :
      (D.A.filter
          (fun z ↦ dist z packet.xu = dist z P.jointDeletion.deleted.1) ∩
        SelectedClass D.A S.oppApex2 P.rho) ⊆
        ({(lateFirstApexSystem R).centerAt packet.xu Q.hxuA} : Finset ℝ²) := by
    intro z hz
    rcases Finset.mem_inter.mp hz with ⟨hzBisect, hzClass⟩
    rw [pentagonOffClassBlocker_xu_deleted_bisector_eq_pair Q] at hzBisect
    rcases Finset.mem_insert.mp hzBisect with h | h
    · exact Finset.mem_singleton.mpr h
    · exact absurd
        ((Finset.mem_singleton.mp h) ▸ hzClass)
        (pentagonOffClassBlocker_oppApex2_not_mem_physicalClass P)
  calc
    (D.A.filter
        (fun z ↦ dist z packet.xu = dist z P.jointDeletion.deleted.1) ∩
      SelectedClass D.A S.oppApex2 P.rho).card
        ≤ ({(lateFirstApexSystem R).centerAt packet.xu Q.hxuA} :
            Finset ℝ²).card := Finset.card_le_card hsub
    _ = 1 := Finset.card_singleton _

#print axioms pentagonOffClassBlocker_xu_deleted_bisector_inter_physicalClass_card_le_one

/-- Away from the `xv` row, every actual blocker preserves at least one of
the endpoint deletions `u` and `xv`. -/
theorem pentagonOffClassBlocker_pairDeletion_survival
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet : ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (t : ℝ²) (htA : t ∈ D.A)
    (htNotXvRow :
      t ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        ((lateFirstApexSystem R).centerAt t htA) ∨
      HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
        ((lateFirstApexSystem R).centerAt t htA) := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kt := (Hlate.selectedAt t htA).toCriticalFourShell
  let Kxv := (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell
  by_cases huSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        (Hlate.centerAt t htA)
  · exact Or.inl huSurvives
  by_cases hxvSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
        (Hlate.centerAt t htA)
  · exact Or.inr hxvSurvives
  have huKt : P.u.1 ∈ Kt.support :=
    ATAILStageOnePrescribedApexDichotomy.source_mem_critical_support_of_no_qfree
      (Hlate.selectedAt t htA) huSurvives
  have hxvKt : packet.xv ∈ Kt.support :=
    ATAILStageOnePrescribedApexDichotomy.source_mem_critical_support_of_no_qfree
      (Hlate.selectedAt t htA) hxvSurvives
  have htBisector :
      Hlate.centerAt t htA ∈
        D.A.filter (fun z ↦ dist z packet.xv = dist z P.u.1) := by
    apply Finset.mem_filter.mpr
    refine ⟨(Finset.mem_erase.mp Kt.center_mem).2, ?_⟩
    exact (Kt.support_eq_radius packet.xv hxvKt).trans
      (Kt.support_eq_radius P.u.1 huKt).symm
  have hpair :=
    pentagonOffClassBlocker_xv_u_bisector_eq_pair
      P packet hxvA huXvRow
  have htCenters :
      Hlate.centerAt t htA = Hlate.centerAt packet.xv hxvA ∨
        Hlate.centerAt t htA = S.oppApex2 := by
    rw [hpair] at htBisector
    simpa only [Finset.mem_insert, Finset.mem_singleton] using htBisector
  rcases htCenters with htCenterXv | htCenterO
  · have hsupports : Kt.support = Kxv.support := by
      let K : SelectedFourClass D.A (Hlate.centerAt t htA) :=
        { support := Kxv.support
          support_subset_A := Kxv.support_subset_A
          support_card := Kxv.support_card
          radius := Kxv.radius
          radius_pos := Kxv.radius_pos
          support_eq_radius := by
            intro z hz
            rw [htCenterXv]
            exact Kxv.support_eq_radius z hz
          center_not_mem := by
            intro hmem
            apply Kxv.center_not_mem_support
            have hmem' : Hlate.centerAt t htA ∈ Kxv.support := hmem
            rw [htCenterXv] at hmem'
            exact hmem' }
      exact (Hlate.selectedFourClass_support_eq_shell t htA K).symm
    have htOwn : t ∈ Kt.support := Kt.q_mem_support
    rw [hsupports] at htOwn
    exact (htNotXvRow htOwn).elim
  · exact
      (P.surface.secondApex_robust.centerAt_ne Hlate t htA htCenterO).elim

/-- In the `xv`-deletion arm, a source outside the `xv` row has a genuine
crossed-deletion row pattern: its selected exact-four row contains `u` and
omits `xv`, while the `xv` row omits the source.  In particular the two actual
blockers are distinct.  This is the source-level incidence packet needed by
consumers; the three-center survival statement alone forgets these row facts. -/
theorem pentagonOffClassBlocker_xvDeletion_crossedRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (source : CarrierVertex D.A)
    (hsourceOutside :
      source.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv Q.hxvA).toCriticalFourShell.support)
    (hnotSurvivesU :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        ((lateFirstApexSystem R).centerAt source.1 source.2))
    (hsurvivesXv :
      HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
        ((lateFirstApexSystem R).centerAt source.1 source.2)) :
    let Hlate := lateFirstApexSystem R
    let Ks := (Hlate.selectedAt source.1 source.2).toCriticalFourShell
    let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
    P.u.1 ∈ Ks.support ∧
      packet.xv ∉ Ks.support ∧
      source.1 ∉ Kxv.support ∧
      Hlate.centerAt source.1 source.2 ≠
        Hlate.centerAt packet.xv Q.hxvA := by
  let Hlate := lateFirstApexSystem R
  let Ks := (Hlate.selectedAt source.1 source.2).toCriticalFourShell
  let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  change P.u.1 ∈ Ks.support ∧
    packet.xv ∉ Ks.support ∧
    source.1 ∉ Kxv.support ∧
    Hlate.centerAt source.1 source.2 ≠
      Hlate.centerAt packet.xv Q.hxvA
  have huKs : P.u.1 ∈ Ks.support :=
    ATAILStageOnePrescribedApexDichotomy.source_mem_critical_support_of_no_qfree
      (Hlate.selectedAt source.1 source.2) hnotSurvivesU
  have hxvNotKs : packet.xv ∉ Ks.support :=
    (cross_deletion_survives_iff_not_mem_selected_support
      Hlate source.2).mp hsurvivesXv
  have hcentersNe :
      Hlate.centerAt source.1 source.2 ≠
        Hlate.centerAt packet.xv Q.hxvA := by
    intro hcenters
    have hsupports : Ks.support = Kxv.support := by
      simpa only [Ks, Kxv] using
        selectedSupports_eq_of_actualBlockers_eq
          Hlate source.2 Q.hxvA hcenters
    apply hsourceOutside
    rw [← hsupports]
    exact Ks.q_mem_support
  exact ⟨huKs, hxvNotKs, hsourceOutside, hcentersNe⟩

/-- The symmetric crossed-row packet for the `u`-deletion arm.  If the
source blocker survives deleting `u` but not deleting `xv`, its selected
exact-four row contains `xv` and omits `u`.  Keeping the source outside the
`xv` row again makes the two actual blockers distinct. -/
theorem pentagonOffClassBlocker_uDeletion_crossedRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (source : CarrierVertex D.A)
    (hsourceOutside :
      source.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv Q.hxvA).toCriticalFourShell.support)
    (hsurvivesU :
      HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        ((lateFirstApexSystem R).centerAt source.1 source.2))
    (hnotSurvivesXv :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
        ((lateFirstApexSystem R).centerAt source.1 source.2)) :
    let Hlate := lateFirstApexSystem R
    let Ks := (Hlate.selectedAt source.1 source.2).toCriticalFourShell
    let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
    packet.xv ∈ Ks.support ∧
      P.u.1 ∉ Ks.support ∧
      source.1 ∉ Kxv.support ∧
      Hlate.centerAt source.1 source.2 ≠
        Hlate.centerAt packet.xv Q.hxvA := by
  let Hlate := lateFirstApexSystem R
  let Ks := (Hlate.selectedAt source.1 source.2).toCriticalFourShell
  let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  change packet.xv ∈ Ks.support ∧
    P.u.1 ∉ Ks.support ∧
    source.1 ∉ Kxv.support ∧
    Hlate.centerAt source.1 source.2 ≠
      Hlate.centerAt packet.xv Q.hxvA
  have hxvKs : packet.xv ∈ Ks.support :=
    ATAILStageOnePrescribedApexDichotomy.source_mem_critical_support_of_no_qfree
      (Hlate.selectedAt source.1 source.2) hnotSurvivesXv
  have huNotKs : P.u.1 ∉ Ks.support :=
    (cross_deletion_survives_iff_not_mem_selected_support
      Hlate source.2).mp hsurvivesU
  have hcentersNe :
      Hlate.centerAt source.1 source.2 ≠
        Hlate.centerAt packet.xv Q.hxvA := by
    intro hcenters
    have hsupports : Ks.support = Kxv.support := by
      simpa only [Ks, Kxv] using
        selectedSupports_eq_of_actualBlockers_eq
          Hlate source.2 Q.hxvA hcenters
    apply hsourceOutside
    rw [← hsupports]
    exact Ks.q_mem_support
  exact ⟨hxvKs, huNotKs, hsourceOutside, hcentersNe⟩

/-- Repackage an exact critical shell which omits `q` as a q-deleted `K4`
class without trimming its support.  Keeping the original support is important
for downstream incidence consumers: arbitrary four-point extraction would
forget the named points already proved to lie on the row. -/
private noncomputable def criticalFourShellToQDeletedK4ClassOfNotMem
    {D : CounterexampleData} {source q center : ℝ²}
    (K : CriticalFourShell D.A source center)
    (hqNot : q ∉ K.support) :
    U5QDeletedK4Class D q center K.support where
  subset := by
    intro y hy
    have hyNeCenter : y ≠ center := by
      intro hyCenter
      subst y
      exact K.center_not_mem_support hy
    have hyNeQ : y ≠ q := by
      intro hyQ
      subst y
      exact hqNot hy
    exact Finset.mem_erase.mpr
      ⟨hyNeCenter, Finset.mem_erase.mpr ⟨hyNeQ, K.support_subset_A hy⟩⟩
  card_four := by rw [K.support_card]
  q_not_mem := hqNot
  radius := K.radius
  radius_pos := K.radius_pos
  same_radius := K.support_eq_radius

/-- A positive-radius class after deleting `q` is already a q-deleted class.
This adapter likewise retains the complete erased class rather than selecting
an anonymous four-subset. -/
private noncomputable def selectedClassEraseToQDeletedK4Class
    {D : CounterexampleData} {q center : ℝ²} {r : ℝ}
    (hr : 0 < r)
    (hcard : 4 ≤ (SelectedClass (D.A.erase q) center r).card) :
    U5QDeletedK4Class D q center
      (SelectedClass (D.A.erase q) center r) where
  subset := by
    intro y hy
    have hyData := mem_selectedClass.mp hy
    have hyNeCenter : y ≠ center := by
      intro hyCenter
      subst y
      rw [dist_self] at hyData
      linarith
    exact Finset.mem_erase.mpr ⟨hyNeCenter, hyData.1⟩
  card_four := hcard
  q_not_mem := by
    intro hq
    have hqErase : q ∈ D.A.erase q := (mem_selectedClass.mp hq).1
    exact (Finset.mem_erase.mp hqErase).1 rfl
  radius := r
  radius_pos := hr
  same_radius := by
    intro y hy
    exact (mem_selectedClass.mp hy).2

/-- In the `xv`-deletion arm, the two crossed selected rows and the physical
apex row can be exported as three q-deleted `K4` classes while retaining a
named common point `u` in all three supports.  The two selected supports also
retain their own source points.  This is strictly stronger ingress than three
bare `HasNEquidistantPointsAt` witnesses, whose arbitrary four-point trimming
would lose these incidences.

This theorem is an incidence producer, not a contradiction: a tetrahedron
consumer still needs cross-incidences among the three centers. -/
theorem pentagonOffClassBlocker_xvDeletion_threeExactRows_common_u
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (source₁ source₂ : CarrierVertex D.A)
    (hsource₁Outside :
      source₁.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv Q.hxvA).toCriticalFourShell.support)
    (hsource₂Outside :
      source₂.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv Q.hxvA).toCriticalFourShell.support)
    (hnotSurvivesU₁ :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        ((lateFirstApexSystem R).centerAt source₁.1 source₁.2))
    (hnotSurvivesU₂ :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        ((lateFirstApexSystem R).centerAt source₂.1 source₂.2))
    (hsurvivesXv₁ :
      HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
        ((lateFirstApexSystem R).centerAt source₁.1 source₁.2))
    (hsurvivesXv₂ :
      HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
        ((lateFirstApexSystem R).centerAt source₂.1 source₂.2)) :
    let Hlate := lateFirstApexSystem R
    let K₁ := (Hlate.selectedAt source₁.1 source₁.2).toCriticalFourShell
    let K₂ := (Hlate.selectedAt source₂.1 source₂.2).toCriticalFourShell
    let BO := SelectedClass (D.A.erase packet.xv) S.oppApex2 P.rho
    ∃ C₁ : U5QDeletedK4Class D packet.xv
        (Hlate.centerAt source₁.1 source₁.2) K₁.support,
      ∃ C₂ : U5QDeletedK4Class D packet.xv
          (Hlate.centerAt source₂.1 source₂.2) K₂.support,
        ∃ CO : U5QDeletedK4Class D packet.xv S.oppApex2 BO,
          P.u.1 ∈ K₁.support ∧
          P.u.1 ∈ K₂.support ∧
          P.u.1 ∈ BO ∧
          BO.card = 4 ∧
          source₁.1 ∈ K₁.support ∧
          source₂.1 ∈ K₂.support := by
  let Hlate := lateFirstApexSystem R
  let K₁ := (Hlate.selectedAt source₁.1 source₁.2).toCriticalFourShell
  let K₂ := (Hlate.selectedAt source₂.1 source₂.2).toCriticalFourShell
  let BO := SelectedClass (D.A.erase packet.xv) S.oppApex2 P.rho
  change
    ∃ C₁ : U5QDeletedK4Class D packet.xv
        (Hlate.centerAt source₁.1 source₁.2) K₁.support,
      ∃ C₂ : U5QDeletedK4Class D packet.xv
          (Hlate.centerAt source₂.1 source₂.2) K₂.support,
        ∃ CO : U5QDeletedK4Class D packet.xv S.oppApex2 BO,
          P.u.1 ∈ K₁.support ∧
          P.u.1 ∈ K₂.support ∧
          P.u.1 ∈ BO ∧
          BO.card = 4 ∧
          source₁.1 ∈ K₁.support ∧
          source₂.1 ∈ K₂.support
  have hcross₁ := pentagonOffClassBlocker_xvDeletion_crossedRow
    Q source₁ hsource₁Outside hnotSurvivesU₁ hsurvivesXv₁
  have hcross₂ := pentagonOffClassBlocker_xvDeletion_crossedRow
    Q source₂ hsource₂Outside hnotSurvivesU₂ hsurvivesXv₂
  have hBOCard : 4 ≤ BO.card := by
    have hfour := selectedClass_erase_card_ge_of_succ_le
      (A := D.A) (x := packet.xv) (s := S.oppApex2)
      (d := P.rho) (n := 4) P.hfive
    simpa [BO] using hfour
  let C₁ : U5QDeletedK4Class D packet.xv
      (Hlate.centerAt source₁.1 source₁.2) K₁.support :=
    criticalFourShellToQDeletedK4ClassOfNotMem K₁ hcross₁.2.1
  let C₂ : U5QDeletedK4Class D packet.xv
      (Hlate.centerAt source₂.1 source₂.2) K₂.support :=
    criticalFourShellToQDeletedK4ClassOfNotMem K₂ hcross₂.2.1
  let CO : U5QDeletedK4Class D packet.xv S.oppApex2 BO :=
    selectedClassEraseToQDeletedK4Class P.hrho hBOCard
  have huNeXv : P.u.1 ≠ packet.xv :=
    pentagonOffClassBlocker_u_ne_xv P packet
  have huBO : P.u.1 ∈ BO := by
    have huData := mem_selectedClass.mp P.huClass
    exact mem_selectedClass.mpr
      ⟨Finset.mem_erase.mpr ⟨huNeXv, huData.1⟩, huData.2⟩
  have hxvClass :
      packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho := by
    have hxvInter :
        packet.xv ∈
          ((Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho) := by
      simpa [Hlate, packet.opposite_row_trace]
    exact (Finset.mem_inter.mp hxvInter).2
  have hBOCardEq : BO.card = 4 := by
    dsimp [BO]
    rw [selectedClass_erase_eq, Finset.card_erase_of_mem hxvClass,
      P.hclassFive]
  exact ⟨C₁, C₂, CO, hcross₁.1, hcross₂.1, huBO,
    hBOCardEq, K₁.q_mem_support, K₂.q_mem_support⟩

/-- Symmetric incidence export for the `u`-deletion arm.  Two sources whose
blockers survive deleting `u` but fail after deleting `xv` yield two exact
rows omitting `u`, while the physical apex row after deleting `u` is the
third exact row.  All three rows retain the named common point `xv`.

This is an incidence producer only; it does not assert the additional center
incidences required by a tetrahedron consumer. -/
theorem pentagonOffClassBlocker_uDeletion_threeExactRows_common_xv
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (source₁ source₂ : CarrierVertex D.A)
    (hsource₁Outside :
      source₁.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv Q.hxvA).toCriticalFourShell.support)
    (hsource₂Outside :
      source₂.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv Q.hxvA).toCriticalFourShell.support)
    (hsurvivesU₁ :
      HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        ((lateFirstApexSystem R).centerAt source₁.1 source₁.2))
    (hsurvivesU₂ :
      HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        ((lateFirstApexSystem R).centerAt source₂.1 source₂.2))
    (hnotSurvivesXv₁ :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
        ((lateFirstApexSystem R).centerAt source₁.1 source₁.2))
    (hnotSurvivesXv₂ :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
        ((lateFirstApexSystem R).centerAt source₂.1 source₂.2)) :
    let Hlate := lateFirstApexSystem R
    let K₁ := (Hlate.selectedAt source₁.1 source₁.2).toCriticalFourShell
    let K₂ := (Hlate.selectedAt source₂.1 source₂.2).toCriticalFourShell
    let BO := SelectedClass (D.A.erase P.u.1) S.oppApex2 P.rho
    ∃ C₁ : U5QDeletedK4Class D P.u.1
        (Hlate.centerAt source₁.1 source₁.2) K₁.support,
      ∃ C₂ : U5QDeletedK4Class D P.u.1
          (Hlate.centerAt source₂.1 source₂.2) K₂.support,
        ∃ CO : U5QDeletedK4Class D P.u.1 S.oppApex2 BO,
          packet.xv ∈ K₁.support ∧
          packet.xv ∈ K₂.support ∧
          packet.xv ∈ BO ∧
          BO.card = 4 ∧
          source₁.1 ∈ K₁.support ∧
          source₂.1 ∈ K₂.support := by
  let Hlate := lateFirstApexSystem R
  let K₁ := (Hlate.selectedAt source₁.1 source₁.2).toCriticalFourShell
  let K₂ := (Hlate.selectedAt source₂.1 source₂.2).toCriticalFourShell
  let BO := SelectedClass (D.A.erase P.u.1) S.oppApex2 P.rho
  change
    ∃ C₁ : U5QDeletedK4Class D P.u.1
        (Hlate.centerAt source₁.1 source₁.2) K₁.support,
      ∃ C₂ : U5QDeletedK4Class D P.u.1
          (Hlate.centerAt source₂.1 source₂.2) K₂.support,
        ∃ CO : U5QDeletedK4Class D P.u.1 S.oppApex2 BO,
          packet.xv ∈ K₁.support ∧
          packet.xv ∈ K₂.support ∧
          packet.xv ∈ BO ∧
          BO.card = 4 ∧
          source₁.1 ∈ K₁.support ∧
          source₂.1 ∈ K₂.support
  have hcross₁ := pentagonOffClassBlocker_uDeletion_crossedRow
    Q source₁ hsource₁Outside hsurvivesU₁ hnotSurvivesXv₁
  have hcross₂ := pentagonOffClassBlocker_uDeletion_crossedRow
    Q source₂ hsource₂Outside hsurvivesU₂ hnotSurvivesXv₂
  have hBOCard : 4 ≤ BO.card := by
    have hfour := selectedClass_erase_card_ge_of_succ_le
      (A := D.A) (x := P.u.1) (s := S.oppApex2)
      (d := P.rho) (n := 4) P.hfive
    simpa [BO] using hfour
  let C₁ : U5QDeletedK4Class D P.u.1
      (Hlate.centerAt source₁.1 source₁.2) K₁.support :=
    criticalFourShellToQDeletedK4ClassOfNotMem K₁ hcross₁.2.1
  let C₂ : U5QDeletedK4Class D P.u.1
      (Hlate.centerAt source₂.1 source₂.2) K₂.support :=
    criticalFourShellToQDeletedK4ClassOfNotMem K₂ hcross₂.2.1
  let CO : U5QDeletedK4Class D P.u.1 S.oppApex2 BO :=
    selectedClassEraseToQDeletedK4Class P.hrho hBOCard
  have huNeXv : P.u.1 ≠ packet.xv :=
    pentagonOffClassBlocker_u_ne_xv P packet
  have hxvClass :
      packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho := by
    have hxvInter :
        packet.xv ∈
          ((Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho) := by
      simpa [Hlate, packet.opposite_row_trace]
    exact (Finset.mem_inter.mp hxvInter).2
  have hxvBO : packet.xv ∈ BO := by
    have hxvData := mem_selectedClass.mp hxvClass
    exact mem_selectedClass.mpr
      ⟨Finset.mem_erase.mpr ⟨huNeXv.symm, hxvData.1⟩, hxvData.2⟩
  have hBOCardEq : BO.card = 4 := by
    dsimp [BO]
    rw [selectedClass_erase_eq, Finset.card_erase_of_mem P.huClass,
      P.hclassFive]
  exact ⟨C₁, C₂, CO, hcross₁.1, hcross₂.1, hxvBO,
    hBOCardEq, K₁.q_mem_support, K₂.q_mem_support⟩

/-- The exact consumer boundary for the three q-deleted rows produced in the
`xv`-deletion arm.  Five positive center incidences complete the forbidden
tetrahedron pattern.  In particular, no cardinality or certificate assumption
is hidden in this adapter: the preceding producer supplies the three exact
rows and their common point `u`.

This theorem is a checked consumer, not a producer for the five incidences. -/
theorem pentagonOffClassBlocker_xvDeletion_false_of_tetrahedron_incidences
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (source₁ source₂ : CarrierVertex D.A)
    (hsource₁Outside :
      source₁.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv Q.hxvA).toCriticalFourShell.support)
    (hsource₂Outside :
      source₂.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv Q.hxvA).toCriticalFourShell.support)
    (hnotSurvivesU₁ :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        ((lateFirstApexSystem R).centerAt source₁.1 source₁.2))
    (hnotSurvivesU₂ :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        ((lateFirstApexSystem R).centerAt source₂.1 source₂.2))
    (hsurvivesXv₁ :
      HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
        ((lateFirstApexSystem R).centerAt source₁.1 source₁.2))
    (hsurvivesXv₂ :
      HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
        ((lateFirstApexSystem R).centerAt source₂.1 source₂.2))
    (hincidences :
      let Hlate := lateFirstApexSystem R
      let K₁ := (Hlate.selectedAt source₁.1 source₁.2).toCriticalFourShell
      let K₂ := (Hlate.selectedAt source₂.1 source₂.2).toCriticalFourShell
      let BO := SelectedClass (D.A.erase packet.xv) S.oppApex2 P.rho
      Hlate.centerAt source₁.1 source₁.2 ∈ BO ∧
        S.oppApex2 ∈ K₁.support ∧
        Hlate.centerAt source₂.1 source₂.2 ∈ K₁.support ∧
        S.oppApex2 ∈ K₂.support ∧
        Hlate.centerAt source₁.1 source₁.2 ∈ K₂.support) :
    False := by
  let Hlate := lateFirstApexSystem R
  let K₁ := (Hlate.selectedAt source₁.1 source₁.2).toCriticalFourShell
  let K₂ := (Hlate.selectedAt source₂.1 source₂.2).toCriticalFourShell
  let BO := SelectedClass (D.A.erase packet.xv) S.oppApex2 P.rho
  change
    Hlate.centerAt source₁.1 source₁.2 ∈ BO ∧
      S.oppApex2 ∈ K₁.support ∧
      Hlate.centerAt source₂.1 source₂.2 ∈ K₁.support ∧
      S.oppApex2 ∈ K₂.support ∧
      Hlate.centerAt source₁.1 source₁.2 ∈ K₂.support at hincidences
  rcases hincidences with ⟨hc₁BO, hOK₁, hc₂K₁, hOK₂, hc₁K₂⟩
  rcases pentagonOffClassBlocker_xvDeletion_threeExactRows_common_u
      Q source₁ source₂ hsource₁Outside hsource₂Outside
      hnotSurvivesU₁ hnotSurvivesU₂ hsurvivesXv₁ hsurvivesXv₂ with
    ⟨C₁, C₂, CO, huK₁, huK₂, huBO, _hBOCard,
      _hsource₁K₁, _hsource₂K₂⟩
  exact U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility
    CO C₁ C₂ hc₁BO huBO hOK₁ huK₁ hc₂K₁ hOK₂ hc₁K₂ huK₂

/-- Symmetric checked consumer boundary for the `u`-deletion/common-`xv`
three-row export.  The same five positive center incidences complete the
forbidden tetrahedron pattern; this theorem does not produce them. -/
theorem pentagonOffClassBlocker_uDeletion_false_of_tetrahedron_incidences
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (source₁ source₂ : CarrierVertex D.A)
    (hsource₁Outside :
      source₁.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv Q.hxvA).toCriticalFourShell.support)
    (hsource₂Outside :
      source₂.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv Q.hxvA).toCriticalFourShell.support)
    (hsurvivesU₁ :
      HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        ((lateFirstApexSystem R).centerAt source₁.1 source₁.2))
    (hsurvivesU₂ :
      HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        ((lateFirstApexSystem R).centerAt source₂.1 source₂.2))
    (hnotSurvivesXv₁ :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
        ((lateFirstApexSystem R).centerAt source₁.1 source₁.2))
    (hnotSurvivesXv₂ :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
        ((lateFirstApexSystem R).centerAt source₂.1 source₂.2))
    (hincidences :
      let Hlate := lateFirstApexSystem R
      let K₁ := (Hlate.selectedAt source₁.1 source₁.2).toCriticalFourShell
      let K₂ := (Hlate.selectedAt source₂.1 source₂.2).toCriticalFourShell
      let BO := SelectedClass (D.A.erase P.u.1) S.oppApex2 P.rho
      Hlate.centerAt source₁.1 source₁.2 ∈ BO ∧
        S.oppApex2 ∈ K₁.support ∧
        Hlate.centerAt source₂.1 source₂.2 ∈ K₁.support ∧
        S.oppApex2 ∈ K₂.support ∧
        Hlate.centerAt source₁.1 source₁.2 ∈ K₂.support) :
    False := by
  let Hlate := lateFirstApexSystem R
  let K₁ := (Hlate.selectedAt source₁.1 source₁.2).toCriticalFourShell
  let K₂ := (Hlate.selectedAt source₂.1 source₂.2).toCriticalFourShell
  let BO := SelectedClass (D.A.erase P.u.1) S.oppApex2 P.rho
  change
    Hlate.centerAt source₁.1 source₁.2 ∈ BO ∧
      S.oppApex2 ∈ K₁.support ∧
      Hlate.centerAt source₂.1 source₂.2 ∈ K₁.support ∧
      S.oppApex2 ∈ K₂.support ∧
      Hlate.centerAt source₁.1 source₁.2 ∈ K₂.support at hincidences
  rcases hincidences with ⟨hc₁BO, hOK₁, hc₂K₁, hOK₂, hc₁K₂⟩
  rcases pentagonOffClassBlocker_uDeletion_threeExactRows_common_xv
      Q source₁ source₂ hsource₁Outside hsource₂Outside
      hsurvivesU₁ hsurvivesU₂ hnotSurvivesXv₁ hnotSurvivesXv₂ with
    ⟨C₁, C₂, CO, hxvK₁, hxvK₂, hxvBO, _hBOCard,
      _hsource₁K₁, _hsource₂K₂⟩
  exact U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility
    CO C₁ C₂ hc₁BO hxvBO hOK₁ hxvK₁ hc₂K₁ hOK₂ hc₁K₂ hxvK₂

/-- Unless the carrier has exactly twelve points, one endpoint deletion
survives at two distinct actual blockers and at the physical apex. -/
theorem pentagonOffClassBlocker_threeCenterDeletion_or_card_eq_twelve
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet : ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support) :
    D.A.card = 12 ∨
      13 ≤ D.A.card ∧
      ∃ deleted : ℝ²,
        (deleted = P.u.1 ∨ deleted = packet.xv) ∧
        ∃ source₁ source₂ : CarrierVertex D.A,
          source₁.1 ∉
              ((lateFirstApexSystem R).selectedAt
                packet.xv hxvA).toCriticalFourShell.support ∧
          source₂.1 ∉
              ((lateFirstApexSystem R).selectedAt
                packet.xv hxvA).toCriticalFourShell.support ∧
          (lateFirstApexSystem R).centerAt source₁.1 source₁.2 ≠
              (lateFirstApexSystem R).centerAt source₂.1 source₂.2 ∧
          (lateFirstApexSystem R).centerAt source₁.1 source₁.2 ≠
              S.oppApex2 ∧
          (lateFirstApexSystem R).centerAt source₂.1 source₂.2 ≠
              S.oppApex2 ∧
          (deleted = packet.xv →
            ¬ HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
              ((lateFirstApexSystem R).centerAt source₁.1 source₁.2)) ∧
          (deleted = packet.xv →
            ¬ HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
              ((lateFirstApexSystem R).centerAt source₂.1 source₂.2)) ∧
          HasNEquidistantPointsAt 4 (D.A.erase deleted)
              ((lateFirstApexSystem R).centerAt source₁.1 source₁.2) ∧
          HasNEquidistantPointsAt 4 (D.A.erase deleted)
              ((lateFirstApexSystem R).centerAt source₂.1 source₂.2) ∧
          HasNEquidistantPointsAt 4 (D.A.erase deleted) S.oppApex2 := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxv := (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell
  let inside : Finset (CarrierVertex D.A) :=
    Finset.univ.filter fun source ↦ source.1 ∈ Kxv.support
  let outside : Finset (CarrierVertex D.A) :=
    Finset.univ.filter fun source ↦ source.1 ∉ Kxv.support
  have hinsideImage :
      inside.image (fun source ↦ source.1) = Kxv.support := by
    ext z
    simp only [inside, Finset.mem_image, Finset.mem_filter,
      Finset.mem_univ, true_and]
    constructor
    · rintro ⟨source, hsource, rfl⟩
      exact hsource
    · intro hz
      exact ⟨⟨z, Kxv.support_subset_A hz⟩, hz, rfl⟩
  have hinsideCard : inside.card = 4 := by
    have himageCard :=
      Finset.card_image_of_injective inside Subtype.val_injective
    rw [hinsideImage, Kxv.support_card] at himageCard
    omega
  have hinsideOutside := Finset.card_filter_add_card_filter_not
    (s := (Finset.univ : Finset (CarrierVertex D.A)))
    (fun source ↦ source.1 ∈ Kxv.support)
  change inside.card + outside.card =
      (Finset.univ : Finset (CarrierVertex D.A)).card at hinsideOutside
  have htotal : Fintype.card (CarrierVertex D.A) = D.A.card := by
    simp [Fintype.card_coe]
  rw [Finset.card_univ, htotal, hinsideCard] at hinsideOutside
  by_cases hcardTwelve : D.A.card = 12
  · exact Or.inl hcardTwelve
  right
  refine ⟨?_, ?_⟩
  · have hcard := P.hcard
    omega
  have houtsideNine : 9 ≤ outside.card := by
    have hcard := P.hcard
    omega
  let uColor := outside.filter fun source ↦
    HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
      (Hlate.centerAt source.1 source.2)
  let xvColor := outside.filter fun source ↦
    ¬ HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
      (Hlate.centerAt source.1 source.2)
  have hcolors := Finset.card_filter_add_card_filter_not
    (s := outside) (fun source ↦
      HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        (Hlate.centerAt source.1 source.2))
  change uColor.card + xvColor.card = outside.card at hcolors
  by_cases huFive : 5 ≤ uColor.card
  · rcases exists_pair_distinct_actualBlockers_of_five_le_card
      Hlate uColor huFive with
      ⟨source₁, hsource₁, source₂, hsource₂, hcenters⟩
    have hsource₁Data := Finset.mem_filter.mp hsource₁
    have hsource₂Data := Finset.mem_filter.mp hsource₂
    have hsource₁Outside : source₁.1 ∉ Kxv.support :=
      (Finset.mem_filter.mp hsource₁Data.1).2
    have hsource₂Outside : source₂.1 ∉ Kxv.support :=
      (Finset.mem_filter.mp hsource₂Data.1).2
    have hcenter₁NeO : Hlate.centerAt source₁.1 source₁.2 ≠ S.oppApex2 :=
      P.surface.secondApex_robust.centerAt_ne Hlate source₁.1 source₁.2
    have hcenter₂NeO : Hlate.centerAt source₂.1 source₂.2 ≠ S.oppApex2 :=
      P.surface.secondApex_robust.centerAt_ne Hlate source₂.1 source₂.2
    have hOSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase P.u.1) S.oppApex2 := by
      refine ⟨P.rho, P.hrho, ?_⟩
      have hfour := selectedClass_erase_card_ge_of_succ_le
        (A := D.A) (x := P.u.1) (s := S.oppApex2)
        (d := P.rho) (n := 4) P.hfive
      simpa [SelectedClass] using hfour
    exact ⟨P.u.1, Or.inl rfl, source₁, source₂,
      hsource₁Outside, hsource₂Outside, hcenters,
      hcenter₁NeO, hcenter₂NeO,
      (by
        intro huEqXv
        exact (pentagonOffClassBlocker_u_ne_xv P packet huEqXv).elim),
      (by
        intro huEqXv
        exact (pentagonOffClassBlocker_u_ne_xv P packet huEqXv).elim),
      hsource₁Data.2, hsource₂Data.2, hOSurvives⟩
  · have hxvFive : 5 ≤ xvColor.card := by omega
    rcases exists_pair_distinct_actualBlockers_of_five_le_card
      Hlate xvColor hxvFive with
      ⟨source₁, hsource₁, source₂, hsource₂, hcenters⟩
    have hsource₁Data := Finset.mem_filter.mp hsource₁
    have hsource₂Data := Finset.mem_filter.mp hsource₂
    have hsource₁Outside : source₁.1 ∉ Kxv.support :=
      (Finset.mem_filter.mp hsource₁Data.1).2
    have hsource₂Outside : source₂.1 ∉ Kxv.support :=
      (Finset.mem_filter.mp hsource₂Data.1).2
    have hsurvives₁ :
        HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
          (Hlate.centerAt source₁.1 source₁.2) :=
      (pentagonOffClassBlocker_pairDeletion_survival
        P packet hxvA huXvRow source₁.1 source₁.2
        hsource₁Outside).resolve_left hsource₁Data.2
    have hsurvives₂ :
        HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
          (Hlate.centerAt source₂.1 source₂.2) :=
      (pentagonOffClassBlocker_pairDeletion_survival
        P packet hxvA huXvRow source₂.1 source₂.2
        hsource₂Outside).resolve_left hsource₂Data.2
    have hcenter₁NeO : Hlate.centerAt source₁.1 source₁.2 ≠ S.oppApex2 :=
      P.surface.secondApex_robust.centerAt_ne Hlate source₁.1 source₁.2
    have hcenter₂NeO : Hlate.centerAt source₂.1 source₂.2 ≠ S.oppApex2 :=
      P.surface.secondApex_robust.centerAt_ne Hlate source₂.1 source₂.2
    have hOSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase packet.xv) S.oppApex2 := by
      refine ⟨P.rho, P.hrho, ?_⟩
      have hfour := selectedClass_erase_card_ge_of_succ_le
        (A := D.A) (x := packet.xv) (s := S.oppApex2)
        (d := P.rho) (n := 4) P.hfive
      simpa [SelectedClass] using hfour
    exact ⟨packet.xv, Or.inr rfl, source₁, source₂,
      hsource₁Outside, hsource₂Outside, hcenters,
      hcenter₁NeO, hcenter₂NeO,
      (fun _ ↦ hsource₁Data.2), (fun _ ↦ hsource₂Data.2),
      hsurvives₁, hsurvives₂,
      hOSurvives⟩

/-- With at least seventeen carrier points, the sources outside the `xv` row
contain two distinct-blocker sources with one uniform endpoint-survival
profile.  The three profiles are exhaustive because the pair-deletion theorem
rules out simultaneous failure:

* both fail deleting `u` and therefore survive deleting `xv`;
* both survive deleting `u` and fail deleting `xv`;
* both survive both deletions.

This is the uniform source producer needed to separate the two crossed-row
arms from the genuinely bi-surviving residual. -/
theorem pentagonOffClassBlocker_largeCard_threeColor_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hlarge : 17 ≤ D.A.card) :
    ∃ source₁ source₂ : CarrierVertex D.A,
      source₁.1 ∉
          ((lateFirstApexSystem R).selectedAt
            packet.xv Q.hxvA).toCriticalFourShell.support ∧
      source₂.1 ∉
          ((lateFirstApexSystem R).selectedAt
            packet.xv Q.hxvA).toCriticalFourShell.support ∧
      (lateFirstApexSystem R).centerAt source₁.1 source₁.2 ≠
          (lateFirstApexSystem R).centerAt source₂.1 source₂.2 ∧
      ((¬ HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
            ((lateFirstApexSystem R).centerAt source₁.1 source₁.2) ∧
        ¬ HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
            ((lateFirstApexSystem R).centerAt source₂.1 source₂.2) ∧
        HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
            ((lateFirstApexSystem R).centerAt source₁.1 source₁.2) ∧
        HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
            ((lateFirstApexSystem R).centerAt source₂.1 source₂.2)) ∨
       (HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
            ((lateFirstApexSystem R).centerAt source₁.1 source₁.2) ∧
        HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
            ((lateFirstApexSystem R).centerAt source₂.1 source₂.2) ∧
        ¬ HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
            ((lateFirstApexSystem R).centerAt source₁.1 source₁.2) ∧
        ¬ HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
            ((lateFirstApexSystem R).centerAt source₂.1 source₂.2)) ∨
       (HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
            ((lateFirstApexSystem R).centerAt source₁.1 source₁.2) ∧
        HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
            ((lateFirstApexSystem R).centerAt source₂.1 source₂.2) ∧
        HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
            ((lateFirstApexSystem R).centerAt source₁.1 source₁.2) ∧
        HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
            ((lateFirstApexSystem R).centerAt source₂.1 source₂.2))) := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let outside : Finset (CarrierVertex D.A) :=
    Finset.univ.filter fun source ↦ source.1 ∉ Kxv.support
  let uSurvive := outside.filter fun source ↦
    HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
      (Hlate.centerAt source.1 source.2)
  let uFail := outside.filter fun source ↦
    ¬ HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
      (Hlate.centerAt source.1 source.2)
  let both := uSurvive.filter fun source ↦
    HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
      (Hlate.centerAt source.1 source.2)
  let xvFail := uSurvive.filter fun source ↦
    ¬ HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
      (Hlate.centerAt source.1 source.2)
  have hinsideCard :
      (Finset.univ.filter fun source : CarrierVertex D.A ↦
        source.1 ∈ Kxv.support).card = 4 := by
    let inside : Finset (CarrierVertex D.A) :=
      Finset.univ.filter fun source ↦ source.1 ∈ Kxv.support
    have hinsideImage :
        inside.image (fun source ↦ source.1) = Kxv.support := by
      ext z
      simp only [inside, Finset.mem_image, Finset.mem_filter,
        Finset.mem_univ, true_and]
      constructor
      · rintro ⟨source, hsource, rfl⟩
        exact hsource
      · intro hz
        exact ⟨⟨z, Kxv.support_subset_A hz⟩, hz, rfl⟩
    have himageCard :=
      Finset.card_image_of_injective inside Subtype.val_injective
    rw [hinsideImage, Kxv.support_card] at himageCard
    simpa only [inside] using himageCard.symm
  have hinsideOutside := Finset.card_filter_add_card_filter_not
    (s := (Finset.univ : Finset (CarrierVertex D.A)))
    (fun source ↦ source.1 ∈ Kxv.support)
  change
    (Finset.univ.filter fun source : CarrierVertex D.A ↦
      source.1 ∈ Kxv.support).card + outside.card =
        (Finset.univ : Finset (CarrierVertex D.A)).card at hinsideOutside
  have htotal : Fintype.card (CarrierVertex D.A) = D.A.card := by
    simp [Fintype.card_coe]
  rw [Finset.card_univ, htotal, hinsideCard] at hinsideOutside
  have houtsideThirteen : 13 ≤ outside.card := by omega
  have huSplit := Finset.card_filter_add_card_filter_not
    (s := outside) (fun source ↦
      HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        (Hlate.centerAt source.1 source.2))
  change uSurvive.card + uFail.card = outside.card at huSplit
  have hxvSplit := Finset.card_filter_add_card_filter_not
    (s := uSurvive) (fun source ↦
      HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
        (Hlate.centerAt source.1 source.2))
  change both.card + xvFail.card = uSurvive.card at hxvSplit
  by_cases huFailFive : 5 ≤ uFail.card
  · rcases exists_pair_distinct_actualBlockers_of_five_le_card
      Hlate uFail huFailFive with
      ⟨source₁, hsource₁, source₂, hsource₂, hcenters⟩
    have hs₁ := Finset.mem_filter.mp hsource₁
    have hs₂ := Finset.mem_filter.mp hsource₂
    have hout₁ := (Finset.mem_filter.mp hs₁.1).2
    have hout₂ := (Finset.mem_filter.mp hs₂.1).2
    have hxv₁ :=
      (pentagonOffClassBlocker_pairDeletion_survival
        P packet Q.hxvA Q.huXvRow source₁.1 source₁.2 hout₁).resolve_left hs₁.2
    have hxv₂ :=
      (pentagonOffClassBlocker_pairDeletion_survival
        P packet Q.hxvA Q.huXvRow source₂.1 source₂.2 hout₂).resolve_left hs₂.2
    exact ⟨source₁, source₂, hout₁, hout₂, hcenters,
      Or.inl ⟨hs₁.2, hs₂.2, hxv₁, hxv₂⟩⟩
  · by_cases hxvFailFive : 5 ≤ xvFail.card
    · rcases exists_pair_distinct_actualBlockers_of_five_le_card
        Hlate xvFail hxvFailFive with
        ⟨source₁, hsource₁, source₂, hsource₂, hcenters⟩
      have hs₁ := Finset.mem_filter.mp hsource₁
      have hs₂ := Finset.mem_filter.mp hsource₂
      have hu₁ := Finset.mem_filter.mp hs₁.1
      have hu₂ := Finset.mem_filter.mp hs₂.1
      have hout₁ := (Finset.mem_filter.mp hu₁.1).2
      have hout₂ := (Finset.mem_filter.mp hu₂.1).2
      exact ⟨source₁, source₂, hout₁, hout₂, hcenters,
        Or.inr (Or.inl ⟨hu₁.2, hu₂.2, hs₁.2, hs₂.2⟩)⟩
    · have hbothFive : 5 ≤ both.card := by omega
      rcases exists_pair_distinct_actualBlockers_of_five_le_card
          Hlate both hbothFive with
        ⟨source₁, hsource₁, source₂, hsource₂, hcenters⟩
      have hs₁ := Finset.mem_filter.mp hsource₁
      have hs₂ := Finset.mem_filter.mp hsource₂
      have hu₁ := Finset.mem_filter.mp hs₁.1
      have hu₂ := Finset.mem_filter.mp hs₂.1
      have hout₁ := (Finset.mem_filter.mp hu₁.1).2
      have hout₂ := (Finset.mem_filter.mp hu₂.1).2
      exact ⟨source₁, source₂, hout₁, hout₂, hcenters,
        Or.inr (Or.inr ⟨hu₁.2, hu₂.2, hs₁.2, hs₂.2⟩)⟩

/-- The genuinely bi-surviving color of the large-cardinality source
partition gives a two-deletion/two-center rectangle of exact q-deleted K4
packets.  This is the source-faithful ingress needed by a future consumer
which compares the two endpoint deletions; the survival profile alone is not
a contradiction. -/
theorem pentagonOffClassBlocker_biSurvival_commonDeletionRectangle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (source₁ source₂ : CarrierVertex D.A)
    (hcenters :
      (lateFirstApexSystem R).centerAt source₁.1 source₁.2 ≠
        (lateFirstApexSystem R).centerAt source₂.1 source₂.2)
    (hu₁ :
      HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        ((lateFirstApexSystem R).centerAt source₁.1 source₁.2))
    (hu₂ :
      HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        ((lateFirstApexSystem R).centerAt source₂.1 source₂.2))
    (hxv₁ :
      HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
        ((lateFirstApexSystem R).centerAt source₁.1 source₁.2))
    (hxv₂ :
      HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
        ((lateFirstApexSystem R).centerAt source₂.1 source₂.2)) :
    Nonempty (CommonDeletionTwoCenterPacket D (lateFirstApexSystem R)
        P.u.1
        ((lateFirstApexSystem R).centerAt source₁.1 source₁.2)
        ((lateFirstApexSystem R).centerAt source₂.1 source₂.2)) ∧
      Nonempty (CommonDeletionTwoCenterPacket D (lateFirstApexSystem R)
        packet.xv
        ((lateFirstApexSystem R).centerAt source₁.1 source₁.2)
        ((lateFirstApexSystem R).centerAt source₂.1 source₂.2)) := by
  let Hlate := lateFirstApexSystem R
  have hcenter₁A : Hlate.centerAt source₁.1 source₁.2 ∈ D.A :=
    Finset.mem_of_mem_erase
      (Hlate.selectedAt source₁.1 source₁.2).toCriticalFourShell.center_mem
  have hcenter₂A : Hlate.centerAt source₂.1 source₂.2 ∈ D.A :=
    Finset.mem_of_mem_erase
      (Hlate.selectedAt source₂.1 source₂.2).toCriticalFourShell.center_mem
  constructor
  · exact nonempty_commonDeletionTwoCenterPacket Hlate P.u.2
      hcenter₁A hcenter₂A hcenters hu₁ hu₂
  · exact nonempty_commonDeletionTwoCenterPacket Hlate Q.hxvA
      hcenter₁A hcenter₂A hcenters hxv₁ hxv₂

theorem pentagonOffClassBlocker_u_mem_secondCapInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet : ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P) :
    P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
  have huPair :
      P.u.1 ∈ ({P.u.1, packet.xu} : Finset ℝ²) ∩
        S.capInteriorByIndex S.oppIndex2 := by
    rw [packet.source_pair_interior]
    simp
  exact (Finset.mem_inter.mp huPair).2

theorem pentagonOffClassBlocker_xu_ne_xv
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet : ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P) :
    packet.xu ≠ packet.xv := by
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell
  have hxuKu : packet.xu ∈ Ku.support := by
    have hxuTrace :
        packet.xu ∈ Ku.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
      simp [Ku, packet.source_row_trace]
    exact (Finset.mem_inter.mp hxuTrace).1
  have hcenter :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [P.huSource] using packet.blocker_eq_xv
  intro hxuEqXv
  have hxvKu : packet.xv ∈ Ku.support := by
    simpa [hxuEqXv] using hxuKu
  have hmemEq :
      ((lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈ Ku.support) =
        (packet.xv ∈ Ku.support) :=
    congrArg (fun z : ℝ² ↦ z ∈ Ku.support) hcenter
  exact Ku.center_not_mem_support (hmemEq.mpr hxvKu)

theorem pentagonOffClassBlocker_xu_mem_secondCapInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet : ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P) :
    packet.xu ∈ S.capInteriorByIndex S.oppIndex2 := by
  have hxuPair :
      packet.xu ∈ ({P.u.1, packet.xu} : Finset ℝ²) ∩
        S.capInteriorByIndex S.oppIndex2 := by
    rw [packet.source_pair_interior]
    simp
  exact (Finset.mem_inter.mp hxuPair).2

private theorem pentagonOffClassBlocker_capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

private theorem pentagonOffClassBlocker_xvRow_secondCap_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet) :
    ((lateFirstApexSystem R).selectedAt
        packet.xv Q.hxvA).toCriticalFourShell.support ∩
      S.capByIndex S.oppIndex2 =
        ({P.u.1, packet.xv} : Finset ℝ²) := by
  classical
  let Kxv :=
    ((lateFirstApexSystem R).selectedAt
      packet.xv Q.hxvA).toCriticalFourShell
  have huInterior : P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 :=
    pentagonOffClassBlocker_u_mem_secondCapInterior P packet
  have hpairSubset :
      ({P.u.1, packet.xv} : Finset ℝ²) ⊆
        Kxv.support ∩ S.capByIndex S.oppIndex2 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨Q.huXvRow,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex2 huInterior⟩
    · exact Finset.mem_inter.mpr
        ⟨Kxv.q_mem_support,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex2 Q.hxvInterior⟩
  have hblockerCap :
      (lateFirstApexSystem R).centerAt packet.xv Q.hxvA ∈
        S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 Q.hblockerInterior
  have hcapTwo :
      (Kxv.support ∩ S.capByIndex S.oppIndex2).card ≤ 2 := by
    simpa [Kxv] using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 Kxv.toSelectedFourClass hblockerCap
  exact
    (Finset.eq_of_subset_of_card_le hpairSubset
      (by
        simpa [pentagonOffClassBlocker_u_ne_xv P packet] using hcapTwo)).symm

/-- The four named points in the second physical cap occur in one forced
linear order, up to reversing the cap orientation.  The source row makes
`xv` equidistant from `u` and `xu`, while the `xv` row makes its actual
blocker equidistant from `u` and `xv`; one-sided distance injectivity on the
ordered cap therefore nests the two betweenness relations.  This theorem is
the source-level ingress for the corresponding order predicate in finite
searches; it is not by itself a contradiction. -/
theorem pentagonOffClassBlocker_exists_forced_secondCap_order
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet) :
    ∃ (m : ℕ) (L : CGN.OrderedCap m)
        (Packet : CGN.MecCapPacket D.A L)
        (iu ic ixv ixu : Fin m),
      CGN.MinorCapSideHypotheses Packet ∧
      CGN.StrictCapOrder D.A L ∧
      Finset.univ.image L.points = S.capByIndex S.oppIndex2 ∧
      L.points iu = P.u.1 ∧
      L.points ic =
        (lateFirstApexSystem R).centerAt packet.xv Q.hxvA ∧
      L.points ixv = packet.xv ∧
      L.points ixu = packet.xu ∧
      ((iu < ic ∧ ic < ixv ∧ ixv < ixu) ∨
        (ixu < ixv ∧ ixv < ic ∧ ic < iu)) := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ku := (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let c := Hlate.centerAt packet.xv Q.hxvA
  have hxuKu : packet.xu ∈ Ku.support := by
    have hxuTrace :
        packet.xu ∈ Ku.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
      simp [Ku, Hlate, packet.source_row_trace]
    exact (Finset.mem_inter.mp hxuTrace).1
  have hcenterU : Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [Hlate, P.huSource] using packet.blocker_eq_xv
  have hY : dist packet.xv P.u.1 = dist packet.xv packet.xu := by
    rw [← hcenterU]
    exact (Ku.support_eq_radius _ Ku.q_mem_support).trans
      (Ku.support_eq_radius _ hxuKu).symm
  have hC : dist c P.u.1 = dist c packet.xv := by
    exact (Kxv.support_eq_radius _ Q.huXvRow).trans
      (Kxv.support_eq_radius _ Kxv.q_mem_support).symm
  have huInterior : P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 :=
    pentagonOffClassBlocker_u_mem_secondCapInterior P packet
  have hxuInterior : packet.xu ∈ S.capInteriorByIndex S.oppIndex2 :=
    pentagonOffClassBlocker_xu_mem_secondCapInterior P packet
  have huClass : P.u.1 ∈ SelectedClass D.A S.oppApex2 P.rho := P.huClass
  have hxuClass : packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.physical_class]
    simp
  have hxvClass : packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.physical_class]
    simp
  have huNeC : P.u.1 ≠ c := by
    intro h
    apply Q.hblockerNotClass
    simpa only [c, Hlate, ← h] using huClass
  have hcNeXv : c ≠ packet.xv := by
    intro h
    apply Q.hblockerNotClass
    simpa only [c, Hlate, h] using hxvClass
  have hcNeXu : c ≠ packet.xu := by
    intro h
    apply Q.hblockerNotClass
    simpa only [c, Hlate, h] using hxuClass
  have huNeXv : P.u.1 ≠ packet.xv :=
    pentagonOffClassBlocker_u_ne_xv P packet
  have hxuNeXv : packet.xu ≠ packet.xv :=
    pentagonOffClassBlocker_xu_ne_xv P packet
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex2 with
    ⟨m, L, Packet, Hside, Hord, hcap⟩
  have huImage : P.u.1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 huInterior
  have hcImage : c ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 Q.hblockerInterior
  have hxvImage : packet.xv ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 Q.hxvInterior
  have hxuImage : packet.xu ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hxuInterior
  rcases Finset.mem_image.mp huImage with ⟨iu, _hiuMem, hiu⟩
  rcases Finset.mem_image.mp hcImage with ⟨ic, _hicMem, hic⟩
  rcases Finset.mem_image.mp hxvImage with ⟨ixv, _hixvMem, hixv⟩
  rcases Finset.mem_image.mp hxuImage with ⟨ixu, _hixuMem, hixu⟩
  have hiu_ic : iu ≠ ic := by
    intro h; apply huNeC; rw [← hiu, ← hic, h]
  have hic_ixv : ic ≠ ixv := by
    intro h; apply hcNeXv; rw [← hic, ← hixv, h]
  have hic_ixu : ic ≠ ixu := by
    intro h; apply hcNeXu; rw [← hic, ← hixu, h]
  have hiu_ixv : iu ≠ ixv := by
    intro h; apply huNeXv; rw [← hiu, ← hixv, h]
  have hiu_ixu : iu ≠ ixu := by
    intro h; apply packet.xu_ne_u; rw [← hixu, ← hiu, h]
  have hixv_ixu : ixv ≠ ixu := by
    intro h; apply hxuNeXv; rw [← hixu, ← hixv, h]
  have hYbetween :
      (iu < ixv ∧ ixv < ixu) ∨ (ixu < ixv ∧ ixv < iu) := by
    rcases lt_or_gt_of_ne hiu_ixu with h | h
    · exact Or.inl (CGN.index_strictly_between_of_equidistant
        Packet Hside Hord h hiu_ixv.symm hixv_ixu (by
          simpa only [hiu, hixv, hixu] using hY))
    · exact Or.inr (CGN.index_strictly_between_of_equidistant
        Packet Hside Hord h hixv_ixu hiu_ixv.symm (by
          simpa only [hiu, hixv, hixu] using hY.symm))
  have hCbetween :
      (iu < ic ∧ ic < ixv) ∨ (ixv < ic ∧ ic < iu) := by
    rcases lt_or_gt_of_ne hiu_ixv with h | h
    · exact Or.inl (CGN.index_strictly_between_of_equidistant
        Packet Hside Hord h hiu_ic.symm hic_ixv (by
          simpa only [c, hiu, hic, hixv] using hC))
    · exact Or.inr (CGN.index_strictly_between_of_equidistant
        Packet Hside Hord h hic_ixv hiu_ic.symm (by
          simpa only [c, hiu, hic, hixv] using hC.symm))
  refine ⟨m, L, Packet, iu, ic, ixv, ixu, Hside, Hord,
    hcap, hiu, ?_, hixv, hixu, ?_⟩
  · simpa only [c, Hlate] using hic
  · rcases hYbetween with hYbetween | hYbetween <;>
      rcases hCbetween with hCbetween | hCbetween <;> omega

/-- The portion of the physical second cap omitted by the `xv` row contains
at least four sources.  Every such source is a common deletion for the
`xv`-row blocker and the physical apex.  This is a source-sensitive producer:
it retains the deletion-source information hidden by a row-only CEGAR cube. -/
theorem pentagonOffClassBlocker_secondCap_commonDeletionFan
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet) :
    let T := S.capByIndex S.oppIndex2 \
      ((lateFirstApexSystem R).selectedAt
        packet.xv Q.hxvA).toCriticalFourShell.support
    4 ≤ T.card ∧
      ∀ q ∈ T,
        Nonempty (CommonDeletionTwoCenterPacket
          D (lateFirstApexSystem R) q
          ((lateFirstApexSystem R).centerAt packet.xv Q.hxvA)
          S.oppApex2) := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let T := S.capByIndex S.oppIndex2 \ Kxv.support
  have hrowCap :
      Kxv.support ∩ S.capByIndex S.oppIndex2 =
        ({P.u.1, packet.xv} : Finset ℝ²) := by
    simpa only [Hlate, Kxv] using
      pentagonOffClassBlocker_xvRow_secondCap_eq_pair Q
  have hinterCard :
      (S.capByIndex S.oppIndex2 ∩ Kxv.support).card = 2 := by
    rw [Finset.inter_comm, hrowCap]
    simp [pentagonOffClassBlocker_u_ne_xv P packet]
  have hcapCard : 6 ≤ (S.capByIndex S.oppIndex2).card := by
    simpa only [pentagonOffClassBlocker_capByIndex_oppIndex2_eq_oppCap2]
      using Q.hsecond
  have hTCard : 4 ≤ T.card := by
    have hsplit := Finset.card_sdiff_add_card_inter
      (S.capByIndex S.oppIndex2) Kxv.support
    dsimp only [T]
    omega
  refine ⟨hTCard, ?_⟩
  intro q hqT
  have hqParts := Finset.mem_sdiff.mp hqT
  have hqA : q ∈ D.A :=
    S.capByIndex_subset S.oppIndex2 hqParts.1
  have hcA : Hlate.centerAt packet.xv Q.hxvA ∈ D.A :=
    (Finset.mem_erase.mp Kxv.center_mem).2
  have hOA : S.oppApex2 ∈ D.A :=
    P.surface.ingress.packet.center₂_mem_A
  have hcNeO : Hlate.centerAt packet.xv Q.hxvA ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne Hlate packet.xv Q.hxvA
  apply nonempty_commonDeletionTwoCenterPacket Hlate hqA hcA hOA hcNeO
  · exact selectedFourClass_survives_erase_of_not_mem
      Kxv.toSelectedFourClass hqParts.2
  · refine ⟨P.rho, P.hrho, ?_⟩
    have hfour := selectedClass_erase_card_ge_of_succ_le
      (A := D.A) (x := q) (s := S.oppApex2)
      (d := P.rho) (n := 4) P.hfive
    simpa [SelectedClass] using hfour

/-- The four-source second-cap fan is not one actual-blocker fiber. -/
theorem pentagonOffClassBlocker_secondCap_fan_actualBlocker_not_constant
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet) :
    let Hlate := lateFirstApexSystem R
    let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
    let T := S.capByIndex S.oppIndex2 \ Kxv.support
    let c := Hlate.centerAt packet.xv Q.hxvA
    let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
    ∃ q : CarrierVertex D.A,
      q.1 ∈ T ∧
        Hlate.centerAt q.1 q.2 ≠ Hlate.centerAt c hcA := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let T := S.capByIndex S.oppIndex2 \ Kxv.support
  let c := Hlate.centerAt packet.xv Q.hxvA
  have hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
  let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
  change ∃ q : CarrierVertex D.A,
    q.1 ∈ T ∧ Hlate.centerAt q.1 q.2 ≠ Hlate.centerAt c hcA
  have hfan := pentagonOffClassBlocker_secondCap_commonDeletionFan Q
  have hTCard : 4 ≤ T.card := by
    simpa only [Hlate, Kxv, T] using hfan.1
  have hcT : c ∈ T := by
    exact Finset.mem_sdiff.mpr
      ⟨S.capInteriorByIndex_subset_capByIndex S.oppIndex2 Q.hblockerInterior,
        Kxv.center_not_mem_support⟩
  by_contra hnonconstant
  have hconstant : ∀ q : CarrierVertex D.A,
      q.1 ∈ T → Hlate.centerAt q.1 q.2 = Hlate.centerAt c hcA := by
    intro q hqT
    by_contra hne
    exact hnonconstant ⟨q, hqT, hne⟩
  have hTsub : T ⊆ Kc.support := by
    intro q hqT
    have hqA : q ∈ D.A :=
      S.capByIndex_subset S.oppIndex2 (Finset.mem_sdiff.mp hqT).1
    have hcenters : Hlate.centerAt q hqA = Hlate.centerAt c hcA :=
      hconstant ⟨q, hqA⟩ hqT
    have hsupports :=
      selectedSupports_eq_of_actualBlockers_eq Hlate hqA hcA hcenters
    rw [← hsupports]
    exact (Hlate.selectedAt q hqA).toCriticalFourShell.q_mem_support
  have hTeq : T = Kc.support :=
    Finset.eq_of_subset_of_card_le hTsub (by
      rw [Kc.support_card]
      exact hTCard)
  have hxuInter :
      packet.xu ∈
        ((Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho) := by
    simpa only [Hlate] using (show
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
            P.u.1 P.u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho by
      rw [packet.source_row_trace]
      simp)
  have hxuURow :
      packet.xu ∈ (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support :=
    (Finset.mem_inter.mp hxuInter).1
  have hxuClass : packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxuInter).2
  have hxuInterior : packet.xu ∈ S.capInteriorByIndex S.oppIndex2 :=
    pentagonOffClassBlocker_xu_mem_secondCapInterior P packet
  have hxuNotKxv : packet.xu ∉ Kxv.support := by
    intro hxuKxv
    have hrowCap := pentagonOffClassBlocker_xvRow_secondCap_eq_pair Q
    have hmem : packet.xu ∈ ({P.u.1, packet.xv} : Finset ℝ²) := by
      rw [← hrowCap]
      exact Finset.mem_inter.mpr
        ⟨hxuKxv,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hxuInterior⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hmem
    rcases hmem with hxuEqU | hxuEqXv
    · exact packet.xu_ne_u hxuEqU
    · apply Kxv.center_not_mem_support
      have hcenterU : Hlate.centerAt P.u.1 P.u.2 = packet.xv := by
        simpa only [Hlate, P.huSource] using packet.blocker_eq_xv
      have hxvNotURow : packet.xv ∉
          (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support := by
        rw [← hcenterU]
        exact
          (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.center_not_mem_support
      exact (hxvNotURow (hxuEqXv ▸ hxuURow)).elim
  have hxuT : packet.xu ∈ T :=
    Finset.mem_sdiff.mpr
      ⟨S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hxuInterior,
        hxuNotKxv⟩
  have hcenterXu : Hlate.centerAt packet.xu Q.hxuA = Hlate.centerAt c hcA :=
    hconstant ⟨packet.xu, Q.hxuA⟩ hxuT
  have hsupportXu :
      (Hlate.selectedAt packet.xu Q.hxuA).toCriticalFourShell.support =
        Kc.support :=
    selectedSupports_eq_of_actualBlockers_eq Hlate Q.hxuA hcA hcenterXu
  have hdeletedKc : P.jointDeletion.deleted.1 ∈ Kc.support := by
    rw [← hsupportXu]
    exact Q.hdeletedXuRow
  have hdeletedT : P.jointDeletion.deleted.1 ∈ T := by
    rw [hTeq]
    exact hdeletedKc
  have hcenterDeleted :
      Hlate.centerAt P.jointDeletion.deleted.1 P.jointDeletion.deleted.2 =
        Hlate.centerAt c hcA :=
    hconstant P.jointDeletion.deleted hdeletedT
  have hsupportDeleted :
      (Hlate.selectedAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support =
        Kc.support :=
    selectedSupports_eq_of_actualBlockers_eq Hlate
      P.jointDeletion.deleted.2 hcA hcenterDeleted
  have hvKc : P.v.1 ∈ Kc.support := by
    rw [← hsupportDeleted]
    exact Q.hvDeletedRow
  have hcardKc :
      (Kc.support ∩ SelectedClass D.A S.oppApex2 P.rho).card ≤ 2 := by
    simpa only [Hlate, c, hcA, Kc] using
      actualLateRow_secondClass_card_le_two
        (rho := P.rho) R P.surface (⟨c, hcA⟩ : CarrierVertex D.A)
  have hxuKc : packet.xu ∈ Kc.support := by
    rw [← hTeq]
    exact hxuT
  have hxuNeDeleted : packet.xu ≠ P.jointDeletion.deleted.1 := by
    intro h
    apply P.jointDeletion.deleted_not_mem_uRow
    simpa only [← h] using hxuURow
  have hxuNeV : packet.xu ≠ P.v.1 := by
    intro h
    apply P.hvOmitted
    simpa only [← h] using hxuURow
  have hdeletedNeV : P.jointDeletion.deleted.1 ≠ P.v.1 := by
    intro h
    exact P.jointDeletion.deleted_ne_v (Subtype.ext h)
  exact
    (third_not_mem_of_card_le_two hcardKc
      (Finset.mem_inter.mpr ⟨hxuKc, hxuClass⟩)
      (Finset.mem_inter.mpr
        ⟨hdeletedKc, P.jointDeletion.deleted_mem_class⟩)
      hxuNeDeleted hxuNeV hdeletedNeV)
      (Finset.mem_inter.mpr ⟨hvKc, P.hvClass⟩)

/-- The second-cap fan contains two sources whose actual blockers are distinct
and avoid both fixed common-deletion centers. -/
theorem pentagonOffClassBlocker_secondCap_fan_two_offCenter_blockers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet) :
    let Hlate := lateFirstApexSystem R
    let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
    let T := S.capByIndex S.oppIndex2 \ Kxv.support
    let c := Hlate.centerAt packet.xv Q.hxvA
    ∃ q r : CarrierVertex D.A,
      q.1 ∈ T ∧ r.1 ∈ T ∧
        Hlate.centerAt q.1 q.2 ≠ Hlate.centerAt r.1 r.2 ∧
        Hlate.centerAt q.1 q.2 ≠ c ∧
        Hlate.centerAt q.1 q.2 ≠ S.oppApex2 ∧
        Hlate.centerAt r.1 r.2 ≠ c ∧
        Hlate.centerAt r.1 r.2 ≠ S.oppApex2 := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let T := S.capByIndex S.oppIndex2 \ Kxv.support
  let c := Hlate.centerAt packet.xv Q.hxvA
  have hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
  obtain ⟨q, hqT, hqNe⟩ :=
    pentagonOffClassBlocker_secondCap_fan_actualBlocker_not_constant Q
  have hqA : q.1 ∈ D.A :=
    S.capByIndex_subset S.oppIndex2 (Finset.mem_sdiff.mp hqT).1
  have hcT : c ∈ T :=
    Finset.mem_sdiff.mpr
      ⟨S.capInteriorByIndex_subset_capByIndex S.oppIndex2 Q.hblockerInterior,
        Kxv.center_not_mem_support⟩
  have hqBlockerNeC : Hlate.centerAt q.1 q.2 ≠ c := by
    intro hqCenter
    have hsupports :=
      selectedSupports_eq_of_actualBlockers_eq Hlate hqA Q.hxvA
        (hqCenter.trans rfl)
    exact (Finset.mem_sdiff.mp hqT).2 (hsupports ▸
      (Hlate.selectedAt q.1 q.2).toCriticalFourShell.q_mem_support)
  have hcBlockerNeC : Hlate.centerAt c hcA ≠ c := by
    exact centerAt_ne_source Hlate c hcA
  refine ⟨q, ⟨c, hcA⟩, hqT, hcT, ?_, hqBlockerNeC, ?_,
    hcBlockerNeC, ?_⟩
  · simpa only [Hlate, Kxv, T, c] using hqNe
  · exact P.surface.secondApex_robust.centerAt_ne Hlate q.1 q.2
  · exact P.surface.secondApex_robust.centerAt_ne Hlate c hcA

/-- Reselecting at the off-class blocker of the `xv` row gives a row that can
contain at most one of the three named physical-class points in the second
cap.  Two such hits would localize the new blocker to the same strict cap and
produce four distinct cap-interior points, three equidistant from it. -/
theorem pentagonOffClassBlocker_nextRow_strictTriple_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet) :
    let Hlate := lateFirstApexSystem R
    let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
    let c := Hlate.centerAt packet.xv Q.hxvA
    let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
    let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
    (Kc.support ∩ {P.u.1, packet.xu, packet.xv}).card ≤ 1 := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let c := Hlate.centerAt packet.xv Q.hxvA
  let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
  let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
  change (Kc.support ∩ {P.u.1, packet.xu, packet.xv}).card ≤ 1
  by_contra hnot
  have hone : 1 < (Kc.support ∩ {P.u.1, packet.xu, packet.xv}).card := by
    omega
  rcases Finset.one_lt_card.mp hone with ⟨a, ha, b, hb, hab⟩
  have haSupport : a ∈ Kc.support := (Finset.mem_inter.mp ha).1
  have hbSupport : b ∈ Kc.support := (Finset.mem_inter.mp hb).1
  have haTriple : a ∈ ({P.u.1, packet.xu, packet.xv} : Finset ℝ²) :=
    (Finset.mem_inter.mp ha).2
  have hbTriple : b ∈ ({P.u.1, packet.xu, packet.xv} : Finset ℝ²) :=
    (Finset.mem_inter.mp hb).2
  have triple_mem_class {z : ℝ²}
      (hz : z ∈ ({P.u.1, packet.xu, packet.xv} : Finset ℝ²)) :
      z ∈ SelectedClass D.A S.oppApex2 P.rho := by
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact P.huClass
    · rw [packet.physical_class]
      simp
    · rw [packet.physical_class]
      simp
  have triple_mem_interior {z : ℝ²}
      (hz : z ∈ ({P.u.1, packet.xu, packet.xv} : Finset ℝ²)) :
      z ∈ S.capInteriorByIndex S.oppIndex2 := by
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact pentagonOffClassBlocker_u_mem_secondCapInterior P packet
    · exact pentagonOffClassBlocker_xu_mem_secondCapInterior P packet
    · exact Q.hxvInterior
  have haClass := triple_mem_class haTriple
  have hbClass := triple_mem_class hbTriple
  have haInterior := triple_mem_interior haTriple
  have hbInterior := triple_mem_interior hbTriple
  let d := Hlate.centerAt c hcA
  have hcenterEq : dist d a = dist d b := by
    simpa only [d, Kc] using
      (Kc.support_eq_radius _ haSupport).trans
        (Kc.support_eq_radius _ hbSupport).symm
  have hphysicalEq : dist S.oppApex2 a = dist S.oppApex2 b :=
    (mem_selectedClass.mp haClass).2.trans
      (mem_selectedClass.mp hbClass).2.symm
  have hdInterior : d ∈ S.capInteriorByIndex S.oppIndex2 := by
    simpa only [d] using
      (commonPhysicalPair_center_mem_secondCapInterior
        (Finset.mem_of_mem_erase Kc.center_mem)
        (P.surface.secondApex_robust.centerAt_ne Hlate c hcA)
        haInterior hbInterior hab hcenterEq hphysicalEq)
  have hca : c ≠ a := by
    intro h
    apply Q.hblockerNotClass
    simpa only [c, Hlate, h] using haClass
  have hcb : c ≠ b := by
    intro h
    apply Q.hblockerNotClass
    simpa only [c, Hlate, h] using hbClass
  have hdNotSupport : d ∉ Kc.support := by
    simpa only [d, Kc] using Kc.center_not_mem_support
  have hdc : d ≠ c := by
    simpa only [d] using centerAt_ne_source Hlate c hcA
  have hda : d ≠ a := by
    intro h
    apply hdNotSupport
    simpa only [h] using haSupport
  have hdb : d ≠ b := by
    intro h
    apply hdNotSupport
    simpa only [h] using hbSupport
  have hdca : dist d c = dist d a := by
    simpa only [d, Kc] using
      (Kc.support_eq_radius _ Kc.q_mem_support).trans
        (Kc.support_eq_radius _ haSupport).symm
  have hdcb : dist d c = dist d b := by
    simpa only [d, Kc] using
      (Kc.support_eq_radius _ Kc.q_mem_support).trans
        (Kc.support_eq_radius _ hbSupport).symm
  exact false_of_capInterior_center_equidistant_three_points
    hdInterior Q.hblockerInterior haInterior hbInterior
    hca hcb hab hdc hda hdb hdca hdcb

/-- The exact physical five-class supplies a second fixed-center deletion
fan.  At least three physical-class points are omitted by the row reselected
at the off-class blocker's actual blocker; deleting any such point preserves
K4 both at that next blocker and at the robust physical apex. -/
theorem pentagonOffClassBlocker_physicalClass_commonDeletionFan
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet) :
    let Hlate := lateFirstApexSystem R
    let c := Hlate.centerAt packet.xv Q.hxvA
    let hcA : c ∈ D.A :=
      (Finset.mem_erase.mp
        (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell.center_mem).2
    let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
    let T := SelectedClass D.A S.oppApex2 P.rho \ Kc.support
    3 ≤ T.card ∧
      ∀ q ∈ T,
        Nonempty (CommonDeletionTwoCenterPacket
          D Hlate q (Hlate.centerAt c hcA) S.oppApex2) := by
  classical
  let Hlate := lateFirstApexSystem R
  let c := Hlate.centerAt packet.xv Q.hxvA
  have hcA : c ∈ D.A :=
    (Finset.mem_erase.mp
      (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell.center_mem).2
  let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
  let T := SelectedClass D.A S.oppApex2 P.rho \ Kc.support
  have hinter :
      (SelectedClass D.A S.oppApex2 P.rho ∩ Kc.support).card ≤ 2 := by
    have hrow := actualLateRow_secondClass_card_le_two
      (rho := P.rho) R P.surface (⟨c, hcA⟩ : CarrierVertex D.A)
    change (SelectedClass D.A S.oppApex2 P.rho ∩ Kc.support).card ≤ 2
    rw [Finset.inter_comm]
    exact hrow
  have hTCard : 3 ≤ T.card := by
    have hsplit := Finset.card_sdiff_add_card_inter
      (SelectedClass D.A S.oppApex2 P.rho) Kc.support
    dsimp only [T]
    rw [P.hclassFive] at hsplit
    omega
  refine ⟨hTCard, ?_⟩
  intro q hqT
  have hqParts := Finset.mem_sdiff.mp hqT
  have hqA : q ∈ D.A := (mem_selectedClass.mp hqParts.1).1
  have hdA : Hlate.centerAt c hcA ∈ D.A :=
    (Finset.mem_erase.mp Kc.center_mem).2
  have hOA : S.oppApex2 ∈ D.A :=
    P.surface.ingress.packet.center₂_mem_A
  have hdNeO : Hlate.centerAt c hcA ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne Hlate c hcA
  apply nonempty_commonDeletionTwoCenterPacket Hlate hqA hdA hOA hdNeO
  · exact selectedFourClass_survives_erase_of_not_mem
      Kc.toSelectedFourClass hqParts.2
  · refine ⟨P.rho, P.hrho, ?_⟩
    have hfour := selectedClass_erase_card_ge_of_succ_le
      (A := D.A) (x := q) (s := S.oppApex2)
      (d := P.rho) (n := 4) P.hfive
    simpa [SelectedClass] using hfour

/-- At the row reselected from the off-class blocker's actual blocker, either
`xu` is the unique possible hit among the three named second-cap points, or
deleting `xu` preserves K4 at both consecutive blocker centers and at the
robust physical apex.  The latter arm is expressed by two two-center packets
with their deletion and physical-apex center in common. -/
theorem pentagonOffClassBlocker_xu_commonDeletionFans_or_nextRow_onlyHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet) :
    let Hlate := lateFirstApexSystem R
    let Kxv :=
      (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
    let c := Hlate.centerAt packet.xv Q.hxvA
    let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
    let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
    (Nonempty (CommonDeletionTwoCenterPacket
        D Hlate packet.xu c S.oppApex2) ∧
      Nonempty (CommonDeletionTwoCenterPacket
        D Hlate packet.xu (Hlate.centerAt c hcA) S.oppApex2)) ∨
      (packet.xu ∈ Kc.support ∧
        P.u.1 ∉ Kc.support ∧ packet.xv ∉ Kc.support) := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxv :=
    (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let c := Hlate.centerAt packet.xv Q.hxvA
  have hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
  let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
  change
    (Nonempty (CommonDeletionTwoCenterPacket
        D Hlate packet.xu c S.oppApex2) ∧
      Nonempty (CommonDeletionTwoCenterPacket
        D Hlate packet.xu (Hlate.centerAt c hcA) S.oppApex2)) ∨
      (packet.xu ∈ Kc.support ∧
        P.u.1 ∉ Kc.support ∧ packet.xv ∉ Kc.support)
  by_cases hxuKc : packet.xu ∈ Kc.support
  · right
    have hcard :
        (Kc.support ∩ {P.u.1, packet.xu, packet.xv}).card ≤ 1 := by
      simpa only [Hlate, Kxv, c, hcA, Kc] using
        pentagonOffClassBlocker_nextRow_strictTriple_card_le_one Q
    have hxuInter :
        packet.xu ∈ Kc.support ∩ {P.u.1, packet.xu, packet.xv} :=
      Finset.mem_inter.mpr ⟨hxuKc, by simp⟩
    refine ⟨hxuKc, ?_, ?_⟩
    · intro huKc
      have huInter :
          P.u.1 ∈ Kc.support ∩ {P.u.1, packet.xu, packet.xv} :=
        Finset.mem_inter.mpr ⟨huKc, by simp⟩
      have huEqXu :=
        (Finset.card_le_one.mp hcard) P.u.1 huInter packet.xu hxuInter
      exact packet.xu_ne_u huEqXu.symm
    · intro hxvKc
      have hxvInter :
          packet.xv ∈ Kc.support ∩ {P.u.1, packet.xu, packet.xv} :=
        Finset.mem_inter.mpr ⟨hxvKc, by simp⟩
      have hxvEqXu :=
        (Finset.card_le_one.mp hcard) packet.xv hxvInter packet.xu hxuInter
      exact pentagonOffClassBlocker_xu_ne_xv P packet hxvEqXu.symm
  · left
    have hxuClass :
        packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho := by
      rw [packet.physical_class]
      simp
    have hxuInterior : packet.xu ∈ S.capInteriorByIndex S.oppIndex2 :=
      pentagonOffClassBlocker_xu_mem_secondCapInterior P packet
    have hxuNotKxv : packet.xu ∉ Kxv.support := by
      intro hxuKxv
      rcases Q.htraceBound packet.xu
          (by simpa only [Hlate, Kxv] using hxuKxv)
          hxuClass with hxuEqXv | hxuEqU
      · exact pentagonOffClassBlocker_xu_ne_xv P packet hxuEqXv
      · exact packet.xu_ne_u hxuEqU
    have hxuSecondFan :
        packet.xu ∈ S.capByIndex S.oppIndex2 \ Kxv.support :=
      Finset.mem_sdiff.mpr
        ⟨S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hxuInterior,
          hxuNotKxv⟩
    have hxuPhysicalFan :
        packet.xu ∈
          SelectedClass D.A S.oppApex2 P.rho \ Kc.support :=
      Finset.mem_sdiff.mpr ⟨hxuClass, hxuKc⟩
    constructor
    · simpa only [Hlate, Kxv, c] using
        (pentagonOffClassBlocker_secondCap_commonDeletionFan Q).2
          packet.xu hxuSecondFan
    · simpa only [Hlate, Kxv, c, hcA, Kc] using
        (pentagonOffClassBlocker_physicalClass_commonDeletionFan Q).2
          packet.xu hxuPhysicalFan

/-- The common-deletion arm can be represented by three concrete exact
`xu`-deleted rows: the selected rows at the `xv` blocker and its next blocker,
and the physical five-class with `xu` erased.  In particular, a finite
encoding does not need to identify the packet's anonymous witness rows with
arbitrary selected-cube rows. -/
theorem pentagonOffClassBlocker_xuCommonArm_threeConcreteExactRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcommon :
      let Hlate := lateFirstApexSystem R
      let Kxv :=
        (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
      let c := Hlate.centerAt packet.xv Q.hxvA
      let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
      Nonempty (CommonDeletionTwoCenterPacket
          D Hlate packet.xu c S.oppApex2) ∧
        Nonempty (CommonDeletionTwoCenterPacket
          D Hlate packet.xu (Hlate.centerAt c hcA) S.oppApex2)) :
    let Hlate := lateFirstApexSystem R
    let Kxv :=
      (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
    let c := Hlate.centerAt packet.xv Q.hxvA
    let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
    let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
    let BO := SelectedClass (D.A.erase packet.xu) S.oppApex2 P.rho
    ∃ Cxv : U5QDeletedK4Class D packet.xu c Kxv.support,
      ∃ Cc : U5QDeletedK4Class D packet.xu
          (Hlate.centerAt c hcA) Kc.support,
        ∃ CO : U5QDeletedK4Class D packet.xu S.oppApex2 BO,
          BO.card = 4 ∧
            (Kxv.support ∩ Kc.support).card ≤ 2 ∧
            (Kxv.support ∩ BO).card ≤ 2 ∧
            (Kc.support ∩ BO).card ≤ 2 := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxv :=
    (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let c := Hlate.centerAt packet.xv Q.hxvA
  have hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
  let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
  let BO := SelectedClass (D.A.erase packet.xu) S.oppApex2 P.rho
  change
    Nonempty (CommonDeletionTwoCenterPacket
        D Hlate packet.xu c S.oppApex2) ∧
      Nonempty (CommonDeletionTwoCenterPacket
        D Hlate packet.xu (Hlate.centerAt c hcA) S.oppApex2) at hcommon
  change
    ∃ Cxv : U5QDeletedK4Class D packet.xu c Kxv.support,
      ∃ Cc : U5QDeletedK4Class D packet.xu
          (Hlate.centerAt c hcA) Kc.support,
        ∃ CO : U5QDeletedK4Class D packet.xu S.oppApex2 BO,
          BO.card = 4 ∧
            (Kxv.support ∩ Kc.support).card ≤ 2 ∧
            (Kxv.support ∩ BO).card ≤ 2 ∧
            (Kc.support ∩ BO).card ≤ 2
  rcases hcommon with ⟨⟨CxvPacket⟩, ⟨CcPacket⟩⟩
  have hBxv : CxvPacket.B₁ = Kxv.support := by
    simpa only [Hlate, Kxv, c] using
      firstRow_support_eq_criticalShell_of_center_eq
        CxvPacket Q.hxvA rfl
  have hBc : CcPacket.B₁ = Kc.support := by
    simpa only [Hlate, Kxv, c, hcA, Kc] using
      firstRow_support_eq_criticalShell_of_center_eq
        CcPacket hcA rfl
  have hxuNotKxv : packet.xu ∉ Kxv.support := by
    rw [← hBxv]
    exact CxvPacket.row₁.q_not_mem
  have hxuNotKc : packet.xu ∉ Kc.support := by
    rw [← hBc]
    exact CcPacket.row₁.q_not_mem
  let Cxv : U5QDeletedK4Class D packet.xu c Kxv.support :=
    criticalFourShellToQDeletedK4ClassOfNotMem Kxv hxuNotKxv
  let Cc : U5QDeletedK4Class D packet.xu
      (Hlate.centerAt c hcA) Kc.support :=
    criticalFourShellToQDeletedK4ClassOfNotMem Kc hxuNotKc
  have hxuClass :
      packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.physical_class]
    simp
  have hBOCard : BO.card = 4 := by
    dsimp [BO]
    rw [selectedClass_erase_eq,
      Finset.card_erase_of_mem hxuClass, P.hclassFive]
  let CO : U5QDeletedK4Class D packet.xu S.oppApex2 BO :=
    selectedClassEraseToQDeletedK4Class P.hrho (by
      simpa only [BO] using hBOCard.ge)
  have hcNeNext : c ≠ Hlate.centerAt c hcA :=
    (centerAt_ne_source Hlate c hcA).symm
  have hcNeO : c ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne Hlate packet.xv Q.hxvA
  have hnextNeO : Hlate.centerAt c hcA ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne Hlate c hcA
  exact ⟨Cxv, Cc, CO, hBOCard,
    U5QDeletedK4Class.inter_card_le_two Cxv Cc hcNeNext,
    U5QDeletedK4Class.inter_card_le_two Cxv CO hcNeO,
    U5QDeletedK4Class.inter_card_le_two Cc CO hnextNeO⟩

/-- The three concrete rows used by the exact-twelve common-arm CEGAR lane
can be realized in one faithful carrier pattern.  We prescribe the physical
apex row to be the physical five-class with `xu` removed.  At the two blocker
centers, critical-shell uniqueness then forces every selected carrier row to
be exactly `Kxv` and `Kc`.

This is the checked geometric ingress for a finite classifier over
`GeneralCarrierBridge.rowPattern`; it is a producer, not a coverage result. -/
theorem pentagonOffClassBlocker_exists_faithfulCarrierPattern_for_xuConcreteRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet) :
    let Hlate := lateFirstApexSystem R
    let Kxv :=
      (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
    let c := Hlate.centerAt packet.xv Q.hxvA
    let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
    let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
    let d := Hlate.centerAt c hcA
    let hdA : d ∈ D.A := (Finset.mem_erase.mp Kc.center_mem).2
    let hOA : S.oppApex2 ∈ D.A := by
      simpa [oppositeVertexByIndex_oppIndex2] using
        S.oppositeVertexByIndex_mem S.oppIndex2
    let BO := SelectedClass (D.A.erase packet.xu) S.oppApex2 P.rho
    ∃ carrierPattern : FaithfulCarrierPattern D.A,
      (carrierPattern.classAt S.oppApex2 hOA).support = BO ∧
        (carrierPattern.classAt c hcA).support = Kxv.support ∧
        (carrierPattern.classAt d hdA).support = Kc.support := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxv :=
    (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let c := Hlate.centerAt packet.xv Q.hxvA
  have hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
  let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
  let d := Hlate.centerAt c hcA
  have hdA : d ∈ D.A := (Finset.mem_erase.mp Kc.center_mem).2
  have hOA : S.oppApex2 ∈ D.A := by
    simpa [oppositeVertexByIndex_oppIndex2] using
      S.oppositeVertexByIndex_mem S.oppIndex2
  let BO := SelectedClass (D.A.erase packet.xu) S.oppApex2 P.rho
  have hxuClass :
      packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.physical_class]
    simp
  have hBOCard : BO.card = 4 := by
    dsimp [BO]
    rw [selectedClass_erase_eq,
      Finset.card_erase_of_mem hxuClass, P.hclassFive]
  let KO : SelectedFourClass D.A S.oppApex2 :=
    { support := BO
      support_subset_A := by
        intro z hz
        exact (Finset.mem_erase.mp (mem_selectedClass.mp hz).1).2
      support_card := hBOCard
      radius := P.rho
      radius_pos := P.hrho
      support_eq_radius := by
        intro z hz
        exact (mem_selectedClass.mp hz).2
      center_not_mem := by
        intro hO
        have hzero : (0 : ℝ) = P.rho := by
          simpa using (mem_selectedClass.mp hO).2
        exact (ne_of_gt P.hrho) hzero.symm }
  rcases exists_faithfulCarrierPattern_with_classAt D.K4 hOA KO with
    ⟨carrierPattern, hphysical⟩
  have hKxv :=
    Hlate.selectedFourClass_support_eq_shell packet.xv Q.hxvA
      (carrierPattern.classAt c hcA)
  have hKc :=
    Hlate.selectedFourClass_support_eq_shell c hcA
      (carrierPattern.classAt d hdA)
  refine ⟨carrierPattern, ?_, ?_, ?_⟩
  · simpa only [KO] using hphysical
  · simpa only [c, Kxv] using hKxv
  · simpa only [d, Kc] using hKc

/-- Landing adapter for an exact-cardinality classifier over the faithful
carrier pattern constructed above.  A classifier only has to prove that
every carrier pattern with the prescribed physical-minus-`xu` row contains a
shell-aware metric core; the arbitrary-cardinality geometry bridge then
supplies the contradiction.

This is a conditional consumer boundary.  It records the required coverage
contract but is not itself a closure theorem. -/
theorem pentagonOffClassBlocker_false_of_xuConcreteRows_shellMetricCoverage
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcoverage :
      let Hlate := lateFirstApexSystem R
      let Kxv :=
        (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
      let c := Hlate.centerAt packet.xv Q.hxvA
      let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
      let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
      let d := Hlate.centerAt c hcA
      let hdA : d ∈ D.A := (Finset.mem_erase.mp Kc.center_mem).2
      let hOA : S.oppApex2 ∈ D.A := by
        simpa [oppositeVertexByIndex_oppIndex2] using
          S.oppositeVertexByIndex_mem S.oppIndex2
      let BO := SelectedClass (D.A.erase packet.xu) S.oppApex2 P.rho
      ∀ carrierPattern : FaithfulCarrierPattern D.A,
        (carrierPattern.classAt S.oppApex2 hOA).support = BO →
          (carrierPattern.classAt c hcA).support = Kxv.support →
          (carrierPattern.classAt d hdA).support = Kc.support →
          ShellMetricCoreAlternative carrierPattern Hlate) :
    False := by
  let Hlate := lateFirstApexSystem R
  let Kxv :=
    (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let c := Hlate.centerAt packet.xv Q.hxvA
  have hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
  let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
  let d := Hlate.centerAt c hcA
  have hdA : d ∈ D.A := (Finset.mem_erase.mp Kc.center_mem).2
  have hOA : S.oppApex2 ∈ D.A := by
    simpa [oppositeVertexByIndex_oppIndex2] using
      S.oppositeVertexByIndex_mem S.oppIndex2
  let BO := SelectedClass (D.A.erase packet.xu) S.oppApex2 P.rho
  rcases
      pentagonOffClassBlocker_exists_faithfulCarrierPattern_for_xuConcreteRows Q with
    ⟨carrierPattern, hphysical, hKxv, hKc⟩
  exact false_of_shellMetricCoreAlternative carrierPattern Hlate D.convex
    (hcoverage carrierPattern hphysical hKxv hKc)

/-- The two common-deletion packets also force the actual `xu` blocker to
avoid both nonphysical centers used by the concrete-row exporter.  This is a
separate finite-ingress predicate from q-freeness of the three rows. -/
theorem pentagonOffClassBlocker_xuCommonArm_blockerAvoidsConcreteCenters
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcommon :
      let Hlate := lateFirstApexSystem R
      let Kxv :=
        (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
      let c := Hlate.centerAt packet.xv Q.hxvA
      let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
      Nonempty (CommonDeletionTwoCenterPacket
          D Hlate packet.xu c S.oppApex2) ∧
        Nonempty (CommonDeletionTwoCenterPacket
          D Hlate packet.xu (Hlate.centerAt c hcA) S.oppApex2)) :
    let Hlate := lateFirstApexSystem R
    let Kxv :=
      (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
    let c := Hlate.centerAt packet.xv Q.hxvA
    let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
    Hlate.centerAt packet.xu Q.hxuA ≠ c ∧
      Hlate.centerAt packet.xu Q.hxuA ≠ Hlate.centerAt c hcA := by
  let Hlate := lateFirstApexSystem R
  let Kxv :=
    (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let c := Hlate.centerAt packet.xv Q.hxvA
  have hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
  change
    Nonempty (CommonDeletionTwoCenterPacket
        D Hlate packet.xu c S.oppApex2) ∧
      Nonempty (CommonDeletionTwoCenterPacket
        D Hlate packet.xu (Hlate.centerAt c hcA) S.oppApex2) at hcommon
  change
    Hlate.centerAt packet.xu Q.hxuA ≠ c ∧
      Hlate.centerAt packet.xu Q.hxuA ≠ Hlate.centerAt c hcA
  rcases hcommon with ⟨⟨CxvPacket⟩, ⟨CcPacket⟩⟩
  exact ⟨CxvPacket.actual_blocker_ne_center₁,
    CcPacket.actual_blocker_ne_center₁⟩

/-- Checked consumer boundary for the three concrete rows in the `xu`
common-deletion arm.  The concrete-row producer supplies the exact classes,
the common point `u` in the `xv` and physical rows, and the source point `c`
in the next row.  The five displayed positive incidences are exactly the
remaining data needed by the general planar tetrahedron incompatibility.

This theorem consumes those incidences; it does not produce them. -/
theorem pentagonOffClassBlocker_xuCommonArm_false_of_tetrahedron_incidences
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcommon :
      let Hlate := lateFirstApexSystem R
      let Kxv :=
        (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
      let c := Hlate.centerAt packet.xv Q.hxvA
      let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
      Nonempty (CommonDeletionTwoCenterPacket
          D Hlate packet.xu c S.oppApex2) ∧
        Nonempty (CommonDeletionTwoCenterPacket
          D Hlate packet.xu (Hlate.centerAt c hcA) S.oppApex2))
    (hincidences :
      let Hlate := lateFirstApexSystem R
      let Kxv :=
        (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
      let c := Hlate.centerAt packet.xv Q.hxvA
      let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
      let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
      let d := Hlate.centerAt c hcA
      let BO := SelectedClass (D.A.erase packet.xu) S.oppApex2 P.rho
      d ∈ BO ∧
        S.oppApex2 ∈ Kc.support ∧
        P.u.1 ∈ Kc.support ∧
        S.oppApex2 ∈ Kxv.support ∧
        d ∈ Kxv.support) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxv :=
    (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let c := Hlate.centerAt packet.xv Q.hxvA
  have hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
  let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
  let d := Hlate.centerAt c hcA
  let BO := SelectedClass (D.A.erase packet.xu) S.oppApex2 P.rho
  change
    d ∈ BO ∧
      S.oppApex2 ∈ Kc.support ∧
      P.u.1 ∈ Kc.support ∧
      S.oppApex2 ∈ Kxv.support ∧
      d ∈ Kxv.support at hincidences
  rcases hincidences with ⟨hdBO, hOKc, huKc, hOKxv, hdKxv⟩
  rcases pentagonOffClassBlocker_xuCommonArm_threeConcreteExactRows
      Q hcommon with
    ⟨Cxv, Cc, CO, _hBOCard, _hKxvKc, _hKxvBO, _hKcBO⟩
  have huBO : P.u.1 ∈ BO := by
    have huData := mem_selectedClass.mp P.huClass
    exact mem_selectedClass.mpr
      ⟨Finset.mem_erase.mpr ⟨packet.xu_ne_u.symm, huData.1⟩, huData.2⟩
  have hcKc : c ∈ Kc.support := Kc.q_mem_support
  have huKxv : P.u.1 ∈ Kxv.support := by
    simpa only [Hlate, Kxv] using Q.huXvRow
  exact U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility
    CO Cc Cxv hdBO huBO hOKc huKc hcKc hOKxv hdKxv huKxv

/-- The live off-class blocker residual pins all five physical-class row traces
to the five edges of the named cycle.  The source and opposite traces come
from the rigid packet; the other three are completed from the residual's
incidences, omissions, and exact five-point class description. -/
theorem pentagonOffClassBlocker_exact_physical_cycle_traces
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet) :
    let Hlate := lateFirstApexSystem R
    let C := SelectedClass D.A S.oppApex2 P.rho
    (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support ∩ C =
        {P.u.1, packet.xu} ∧
      (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.support ∩ C =
        {P.v.1, packet.xv} ∧
      (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell.support ∩ C =
        {packet.xv, P.u.1} ∧
      (Hlate.selectedAt packet.xu Q.hxuA).toCriticalFourShell.support ∩ C =
        {packet.xu, P.jointDeletion.deleted.1} ∧
      (Hlate.selectedAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support ∩ C =
        {P.jointDeletion.deleted.1, P.v.1} := by
  classical
  let Hlate := lateFirstApexSystem R
  let C := SelectedClass D.A S.oppApex2 P.rho
  have huClass : P.u.1 ∈ C := by simpa [C] using P.huClass
  have hvClass : P.v.1 ∈ C := by simpa [C] using P.hvClass
  have hxuClass : packet.xu ∈ C := by
    dsimp only [C]
    rw [packet.physical_class]
    simp
  have hxvClass : packet.xv ∈ C := by
    dsimp only [C]
    rw [packet.physical_class]
    simp
  have hdeletedClass : P.jointDeletion.deleted.1 ∈ C := by
    dsimp only [C]
    rw [packet.physical_class]
    simp
  refine ⟨by simpa [Hlate, C] using packet.source_row_trace,
    by simpa [Hlate, C] using packet.opposite_row_trace, ?_, ?_, ?_⟩
  · ext x
    simp only [Finset.mem_inter, Finset.mem_insert, Finset.mem_singleton]
    constructor
    · rintro ⟨hxRow, hxClass⟩
      exact Q.htraceBound x (by simpa only [Hlate] using hxRow)
        (by simpa only [C] using hxClass)
    · intro hx
      rcases hx with rfl | rfl
      · exact ⟨by simpa only [Hlate] using
          (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell.q_mem_support,
          hxvClass⟩
      · exact ⟨by simpa only [Hlate] using Q.huXvRow, huClass⟩
  · ext x
    simp only [Finset.mem_inter, Finset.mem_insert, Finset.mem_singleton]
    constructor
    · rintro ⟨hxRow, hxClass⟩
      exact Q.htraceBoundXu x (by simpa only [Hlate] using hxRow)
        (by simpa only [C] using hxClass)
    · intro hx
      rcases hx with rfl | rfl
      · exact ⟨by simpa only [Hlate] using
          (Hlate.selectedAt packet.xu Q.hxuA).toCriticalFourShell.q_mem_support,
          hxuClass⟩
      · exact ⟨by simpa only [Hlate] using Q.hdeletedXuRow, hdeletedClass⟩
  · ext x
    simp only [Finset.mem_inter, Finset.mem_insert, Finset.mem_singleton]
    constructor
    · rintro ⟨hxRow, hxClass⟩
      rcases Q.hclassFive x (by simpa only [C] using hxClass) with
        rfl | rfl | rfl | rfl | rfl
      · exact (Q.huNotDeletedRow (by simpa only [Hlate] using hxRow)).elim
      · exact (Q.hxuNotDeletedRow (by simpa only [Hlate] using hxRow)).elim
      · exact Or.inl rfl
      · exact Or.inr rfl
      · exact (Q.hxvNotDeletedRow (by simpa only [Hlate] using hxRow)).elim
    · intro hx
      rcases hx with rfl | rfl
      · exact ⟨by simpa only [Hlate] using
          (Hlate.selectedAt P.jointDeletion.deleted.1
            P.jointDeletion.deleted.2).toCriticalFourShell.q_mem_support,
          hdeletedClass⟩
      · exact ⟨by simpa only [Hlate] using Q.hvDeletedRow, hvClass⟩

private theorem five_cycle_edgeMap_injective
    {α : Type} [DecidableEq α] {a b c d e : α}
    (hcard : ({a, b, c, d, e} : Finset α).card = 5) :
    Function.Injective
      (fun i : Fin 5 => ![
        ({a, b} : Finset α), {b, c}, {c, d}, {d, e}, {e, a}] i) := by
  have hnodup : [a, b, c, d, e].Nodup := by
    rw [← Multiset.coe_nodup]
    apply Multiset.toFinset_card_eq_card_iff_nodup.mp
    simpa using hcard
  have hne :
      (a ≠ b ∧ a ≠ c ∧ a ≠ d ∧ a ≠ e) ∧
      (b ≠ c ∧ b ≠ d ∧ b ≠ e) ∧
      (c ≠ d ∧ c ≠ e) ∧ d ≠ e := by
    simpa [List.nodup_cons, not_or] using hnodup
  rcases hne with
    ⟨⟨hab, hac, had, hae⟩, ⟨hbc, hbd, hbe⟩, ⟨hcd, hce⟩, hde⟩
  have h01 : ({a, b} : Finset α) ≠ {b, c} := by
    intro h
    have hx := congrArg (fun s : Finset α => a ∈ s) h
    simpa [hab, hac] using hx
  have h02 : ({a, b} : Finset α) ≠ {c, d} := by
    intro h
    have hx := congrArg (fun s : Finset α => a ∈ s) h
    simpa [hac, had] using hx
  have h03 : ({a, b} : Finset α) ≠ {d, e} := by
    intro h
    have hx := congrArg (fun s : Finset α => a ∈ s) h
    simpa [had, hae] using hx
  have h04 : ({a, b} : Finset α) ≠ {e, a} := by
    intro h
    have hx := congrArg (fun s : Finset α => b ∈ s) h
    simpa [hab, hbe, Ne.symm hab, Ne.symm hbe] using hx
  have h12 : ({b, c} : Finset α) ≠ {c, d} := by
    intro h
    have hx := congrArg (fun s : Finset α => b ∈ s) h
    simpa [hbc, hbd] using hx
  have h13 : ({b, c} : Finset α) ≠ {d, e} := by
    intro h
    have hx := congrArg (fun s : Finset α => b ∈ s) h
    simpa [hbd, hbe] using hx
  have h14 : ({b, c} : Finset α) ≠ {e, a} := by
    intro h
    have hx := congrArg (fun s : Finset α => b ∈ s) h
    simpa [hab, hbe, Ne.symm hab, Ne.symm hbe] using hx
  have h23 : ({c, d} : Finset α) ≠ {d, e} := by
    intro h
    have hx := congrArg (fun s : Finset α => c ∈ s) h
    simpa [hcd, hce] using hx
  have h24 : ({c, d} : Finset α) ≠ {e, a} := by
    intro h
    have hx := congrArg (fun s : Finset α => c ∈ s) h
    simpa [hac, hce, Ne.symm hac, Ne.symm hce] using hx
  have h34 : ({d, e} : Finset α) ≠ {e, a} := by
    intro h
    have hx := congrArg (fun s : Finset α => d ∈ s) h
    simpa [had, hde, Ne.symm had, Ne.symm hde] using hx
  intro i j hij
  fin_cases i <;> fin_cases j <;> simp at hij ⊢
  all_goals
    first
    | exact h01 hij
    | exact h01 hij.symm
    | exact h02 hij
    | exact h02 hij.symm
    | exact h03 hij
    | exact h03 hij.symm
    | exact h04 hij
    | exact h04 hij.symm
    | exact h12 hij
    | exact h12 hij.symm
    | exact h13 hij
    | exact h13 hij.symm
    | exact h14 hij
    | exact h14 hij.symm
    | exact h23 hij
    | exact h23 hij.symm
    | exact h24 hij
    | exact h24 hij.symm
    | exact h34 hij
    | exact h34 hij.symm

/-- The exact five-cycle traces force the five corresponding actual blockers
to be pairwise distinct.  This is the source-level entitlement for the
labeled blocker injectivity imposed by the exact-cardinality encoding. -/
theorem pentagonOffClassBlocker_physical_cycle_actualBlockers_injective
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet) :
    let Hlate := lateFirstApexSystem R
    let sources : Fin 5 → CarrierVertex D.A := fun i => ![
      P.u, ⟨packet.xu, Q.hxuA⟩, P.jointDeletion.deleted,
      P.v, ⟨packet.xv, Q.hxvA⟩] i
    Function.Injective fun i =>
      Hlate.centerAt (sources i).1 (sources i).2 := by
  classical
  let Hlate := lateFirstApexSystem R
  let C := SelectedClass D.A S.oppApex2 P.rho
  let sources : Fin 5 → CarrierVertex D.A := fun i => ![
    P.u, ⟨packet.xu, Q.hxuA⟩, P.jointDeletion.deleted,
    P.v, ⟨packet.xv, Q.hxvA⟩] i
  let edges : Fin 5 → Finset ℝ² := fun i => ![
    ({P.u.1, packet.xu} : Finset ℝ²),
    {packet.xu, P.jointDeletion.deleted.1},
    {P.jointDeletion.deleted.1, P.v.1},
    {P.v.1, packet.xv},
    {packet.xv, P.u.1}] i
  have hnamedCard :
      ({P.u.1, packet.xu, P.jointDeletion.deleted.1,
          P.v.1, packet.xv} : Finset ℝ²).card = 5 := by
    have hsetEq :
        ({P.u.1, packet.xu, P.jointDeletion.deleted.1,
            P.v.1, packet.xv} : Finset ℝ²) =
          SelectedClass D.A S.oppApex2 P.rho := by
      rw [packet.physical_class]
      ext x
      simp only [Finset.mem_insert, Finset.mem_singleton,
        Finset.mem_union]
      tauto
    rw [hsetEq]
    exact P.hclassFive
  have hedgeInjective : Function.Injective edges := by
    simpa only [edges] using
      (five_cycle_edgeMap_injective hnamedCard)
  rcases pentagonOffClassBlocker_exact_physical_cycle_traces Q with
    ⟨huTrace, hvTrace, hxvTrace, hxuTrace, hdTrace⟩
  have htraceAt : ∀ i,
      (Hlate.selectedAt (sources i).1
          (sources i).2).toCriticalFourShell.support ∩ C = edges i := by
    intro i
    fin_cases i
    · simpa only [Hlate, C, sources, edges] using huTrace
    · simpa only [Hlate, C, sources, edges] using hxuTrace
    · simpa only [Hlate, C, sources, edges] using hdTrace
    · simpa only [Hlate, C, sources, edges] using hvTrace
    · simpa only [Hlate, C, sources, edges] using hxvTrace
  change Function.Injective fun i =>
    Hlate.centerAt (sources i).1 (sources i).2
  intro i j hcenters
  apply hedgeInjective
  have hsupports :=
    selectedSupports_eq_of_actualBlockers_eq Hlate
      (sources i).2 (sources j).2 hcenters
  rw [← htraceAt i, ← htraceAt j, hsupports]

/-- The two consecutive physical-cycle sources `xu` and `deleted` form a
source-clean fixed pair for both endpoint deletions.  Their selected rows omit
both `u` and `xv`, their actual blockers are distinct and different from the
robust physical apex, and both rows (together with the physical-apex class)
therefore survive either endpoint deletion.  This packages the strongest
uniform datum currently available to a downstream incidence or third-bisector
consumer; it is not itself a contradiction. -/
theorem pentagonOffClassBlocker_fixedPhysicalPair_biDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet) :
    let Hlate := lateFirstApexSystem R
    let sourceXu : CarrierVertex D.A := ⟨packet.xu, Q.hxuA⟩
    let sourceDeleted : CarrierVertex D.A := P.jointDeletion.deleted
    let Kxv :=
      (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
    sourceXu.1 ∉ Kxv.support ∧
      sourceDeleted.1 ∉ Kxv.support ∧
      Hlate.centerAt sourceXu.1 sourceXu.2 ≠
        Hlate.centerAt sourceDeleted.1 sourceDeleted.2 ∧
      Hlate.centerAt sourceXu.1 sourceXu.2 ≠ S.oppApex2 ∧
      Hlate.centerAt sourceDeleted.1 sourceDeleted.2 ≠ S.oppApex2 ∧
      ∀ q ∈ ({P.u.1, packet.xv} : Finset ℝ²),
        HasNEquidistantPointsAt 4 (D.A.erase q)
            (Hlate.centerAt sourceXu.1 sourceXu.2) ∧
          HasNEquidistantPointsAt 4 (D.A.erase q)
            (Hlate.centerAt sourceDeleted.1 sourceDeleted.2) ∧
          HasNEquidistantPointsAt 4 (D.A.erase q) S.oppApex2 := by
  classical
  let Hlate := lateFirstApexSystem R
  let sourceXu : CarrierVertex D.A := ⟨packet.xu, Q.hxuA⟩
  let sourceDeleted : CarrierVertex D.A := P.jointDeletion.deleted
  let Kxu :=
    (Hlate.selectedAt sourceXu.1 sourceXu.2).toCriticalFourShell
  let Kdeleted :=
    (Hlate.selectedAt sourceDeleted.1 sourceDeleted.2).toCriticalFourShell
  let Kxv :=
    (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  have hxuClass :
      packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.physical_class]
    simp
  have hdeletedClass :
      P.jointDeletion.deleted.1 ∈
        SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.physical_class]
    simp
  have hxuOutside : sourceXu.1 ∉ Kxv.support := by
    intro hxuKxv
    rcases Q.htraceBound packet.xu
        (by simpa only [Hlate, sourceXu, Kxv] using hxuKxv)
        hxuClass with hxuEqXv | hxuEqU
    · exact pentagonOffClassBlocker_xu_ne_xv P packet hxuEqXv
    · exact packet.xu_ne_u hxuEqU
  have hdeletedOutside : sourceDeleted.1 ∉ Kxv.support := by
    intro hdeletedKxv
    rcases Q.htraceBound P.jointDeletion.deleted.1
        (by simpa only [Hlate, sourceDeleted, Kxv] using hdeletedKxv)
        hdeletedClass with hdeletedEqXv | hdeletedEqU
    · apply Q.hxvNotDeletedRow
      simpa only [Hlate, sourceDeleted, hdeletedEqXv] using
        Kdeleted.q_mem_support
    · exact P.jointDeletion.deleted_ne_u (Subtype.ext hdeletedEqU)
  have hcentersNe :
      Hlate.centerAt sourceXu.1 sourceXu.2 ≠
        Hlate.centerAt sourceDeleted.1 sourceDeleted.2 := by
    intro hcenters
    have hindices : (1 : Fin 5) = 2 :=
      (pentagonOffClassBlocker_physical_cycle_actualBlockers_injective Q)
        (by simpa only [Hlate, sourceXu, sourceDeleted] using hcenters)
    omega
  have hxuCenterNeO :
      Hlate.centerAt sourceXu.1 sourceXu.2 ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne
      Hlate sourceXu.1 sourceXu.2
  have hdeletedCenterNeO :
      Hlate.centerAt sourceDeleted.1 sourceDeleted.2 ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne
      Hlate sourceDeleted.1 sourceDeleted.2
  refine ⟨hxuOutside, hdeletedOutside, hcentersNe,
    hxuCenterNeO, hdeletedCenterNeO, ?_⟩
  intro q hq
  simp only [Finset.mem_insert, Finset.mem_singleton] at hq
  have hxuSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase q)
        (Hlate.centerAt sourceXu.1 sourceXu.2) := by
    apply selectedFourClass_survives_erase_of_not_mem
      Kxu.toSelectedFourClass
    rcases hq with rfl | rfl
    · simpa only [Hlate, sourceXu, Kxu] using Q.huNotXuRow
    · simpa only [Hlate, sourceXu, Kxu] using Q.hxvNotXuRow
  have hdeletedSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase q)
        (Hlate.centerAt sourceDeleted.1 sourceDeleted.2) := by
    apply selectedFourClass_survives_erase_of_not_mem
      Kdeleted.toSelectedFourClass
    rcases hq with rfl | rfl
    · simpa only [Hlate, sourceDeleted, Kdeleted] using Q.huNotDeletedRow
    · simpa only [Hlate, sourceDeleted, Kdeleted] using Q.hxvNotDeletedRow
  have hOSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase q) S.oppApex2 := by
    refine ⟨P.rho, P.hrho, ?_⟩
    have hfour := selectedClass_erase_card_ge_of_succ_le
      (A := D.A) (x := q) (s := S.oppApex2)
      (d := P.rho) (n := 4) P.hfive
    simpa [SelectedClass] using hfour
  exact ⟨hxuSurvives, hdeletedSurvives, hOSurvives⟩

/-- If the next selected row `Kc` omits `u`, then deleting `u` preserves K4
at five named centers: the two fixed physical-cycle blockers, the physical
apex, the blocker of `v`, and the next blocker `d`.

This is the checked consumer for the `u ∉ Kc` predicate isolated by the
exact-twelve search.  It does not produce that predicate, assert that the five
centers are distinct, or derive a contradiction. -/
theorem pentagonOffClassBlocker_uDeletion_fiveCenterSurvival_of_u_not_mem_nextRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (huNotKc :
      let Hlate := lateFirstApexSystem R
      let Kxv :=
        (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
      let c := Hlate.centerAt packet.xv Q.hxvA
      let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
      let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
      P.u.1 ∉ Kc.support) :
    let Hlate := lateFirstApexSystem R
    let Kxv :=
      (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
    let c := Hlate.centerAt packet.xv Q.hxvA
    let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
    let d := Hlate.centerAt c hcA
    ATailFirstFiberOverlapDescent.FiveCenterDeletionSurvival D P.u.1
      (Hlate.centerAt packet.xu Q.hxuA)
      (Hlate.centerAt P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2)
      S.oppApex2
      (Hlate.centerAt P.v.1 P.v.2)
      d := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxv :=
    (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let c := Hlate.centerAt packet.xv Q.hxvA
  have hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
  let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
  let d := Hlate.centerAt c hcA
  let Kv := (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
  let C := SelectedClass D.A S.oppApex2 P.rho
  change P.u.1 ∉ Kc.support at huNotKc
  change
    HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        (Hlate.centerAt packet.xu Q.hxuA) ∧
      HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        (Hlate.centerAt P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2) ∧
      HasNEquidistantPointsAt 4 (D.A.erase P.u.1) S.oppApex2 ∧
      HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        (Hlate.centerAt P.v.1 P.v.2) ∧
      HasNEquidistantPointsAt 4 (D.A.erase P.u.1) d
  rcases pentagonOffClassBlocker_fixedPhysicalPair_biDeletion Q with
    ⟨_hxuOutside, _hdeletedOutside, _hcentersNe,
      _hxuCenterNeO, _hdeletedCenterNeO, hfixed⟩
  have huNamed : P.u.1 ∈ ({P.u.1, packet.xv} : Finset ℝ²) := by simp
  rcases hfixed P.u.1 huNamed with ⟨hxu, hdeleted, hO⟩
  have huNotKv : P.u.1 ∉ Kv.support := by
    rcases pentagonOffClassBlocker_exact_physical_cycle_traces Q with
      ⟨_huTrace, hvTrace, _hxvTrace, _hxuTrace, _hdeletedTrace⟩
    change Kv.support ∩ C = {P.v.1, packet.xv} at hvTrace
    intro huKv
    have huInter : P.u.1 ∈ Kv.support ∩ C :=
      Finset.mem_inter.mpr ⟨huKv, P.huClass⟩
    rw [hvTrace] at huInter
    simp only [Finset.mem_insert, Finset.mem_singleton] at huInter
    rcases huInter with huEqV | huEqXv
    · exact P.huNeV (Subtype.ext huEqV)
    · exact pentagonOffClassBlocker_u_ne_xv P packet huEqXv
  have hv :
      HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        (Hlate.centerAt P.v.1 P.v.2) := by
    exact selectedFourClass_survives_erase_of_not_mem
      Kv.toSelectedFourClass huNotKv
  have hd : HasNEquidistantPointsAt 4 (D.A.erase P.u.1) d := by
    exact selectedFourClass_survives_erase_of_not_mem
      Kc.toSelectedFourClass huNotKc
  exact ⟨hxu, hdeleted, hO, hv, hd⟩

/-- In the exact-twelve `nextRowOnlyHit` arm, deleting `u` leaves an exact
eleven-point carrier with five exact q-free K4 rows and the distinct actual
blocker where deletion fails.  This is finite ingress, not a contradiction. -/
theorem pentagonOffClassBlocker_uDeletion_exactEleven_fiveSurvivorRows_of_u_not_mem_nextRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcard : D.A.card = 12)
    (huNotKc :
      let Hlate := lateFirstApexSystem R
      let Kxv :=
        (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
      let c := Hlate.centerAt packet.xv Q.hxvA
      let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
      let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
      P.u.1 ∉ Kc.support) :
    let Hlate := lateFirstApexSystem R
    let Kxv :=
      (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
    let c := Hlate.centerAt packet.xv Q.hxvA
    let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
    let d := Hlate.centerAt c hcA
    (D.A.erase P.u.1).card = 11 ∧
      Nonempty
        (ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
          D H P.u.1 P.u.2
          (Hlate.centerAt packet.xu Q.hxuA)
          (Hlate.centerAt P.jointDeletion.deleted.1
            P.jointDeletion.deleted.2)
          S.oppApex2
          (Hlate.centerAt P.v.1 P.v.2)
          d) := by
  classical
  have hcardErase : (D.A.erase P.u.1).card = 11 := by
    rw [Finset.card_erase_of_mem P.u.2, hcard]
  refine ⟨hcardErase, ?_⟩
  exact
    ATailFiveCenterDeletionBoundary.fiveSurvivorExactRowsBoundary H P.u.2
      (pentagonOffClassBlocker_uDeletion_fiveCenterSurvival_of_u_not_mem_nextRow
        Q huNotKc)

/-- The five rows exposed by the exact-eleven deletion boundary either have
five distinct centers, or the iterated blocker row is exactly the `xu` row.
In the collision arm, equality of actual blockers identifies the selected
supports and makes `xu` and the first off-class blocker mutually incident.

The deleted-source and `v`-row collision arms are impossible from the live
row traces.  This is a source producer for a terminal consumer, not itself a
nogood. -/
theorem pentagonOffClassBlocker_nextRowOnlyHit_fiveDistinct_or_xuPositiveRowCollision
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hnextRowOnlyHit :
      let Hlate := lateFirstApexSystem R
      let Kxv :=
        (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
      let c := Hlate.centerAt packet.xv Q.hxvA
      let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
      let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
      packet.xu ∈ Kc.support ∧
        P.u.1 ∉ Kc.support ∧ packet.xv ∉ Kc.support) :
    let Hlate := lateFirstApexSystem R
    let Kxv :=
      (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
    let c := Hlate.centerAt packet.xv Q.hxvA
    let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
    let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
    let d := Hlate.centerAt c hcA
    let Kxu :=
      (Hlate.selectedAt packet.xu Q.hxuA).toCriticalFourShell
    let c0 := Hlate.centerAt packet.xu Q.hxuA
    let c1 := Hlate.centerAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2
    let c3 := Hlate.centerAt P.v.1 P.v.2
    ({c0, c1, S.oppApex2, c3, d} : Finset ℝ²).card = 5 ∨
      (d = c0 ∧ packet.xu ∈ Kc.support ∧ c ∈ Kxu.support) := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxv :=
    (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let c := Hlate.centerAt packet.xv Q.hxvA
  let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
  let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
  let d := Hlate.centerAt c hcA
  let Kxu :=
    (Hlate.selectedAt packet.xu Q.hxuA).toCriticalFourShell
  let Kdeleted :=
    (Hlate.selectedAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2).toCriticalFourShell
  let Kv := (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
  let c0 := Hlate.centerAt packet.xu Q.hxuA
  let c1 := Hlate.centerAt P.jointDeletion.deleted.1
    P.jointDeletion.deleted.2
  let c3 := Hlate.centerAt P.v.1 P.v.2
  have hxuKc : packet.xu ∈ Kc.support := by
    simpa only [Hlate, Kxv, c, hcA, Kc] using hnextRowOnlyHit.1
  have hxvNotKc : packet.xv ∉ Kc.support := by
    simpa only [Hlate, Kxv, c, hcA, Kc] using hnextRowOnlyHit.2.2
  have hc0c1 : c0 ≠ c1 := by
    intro hcenters
    have hindices : (1 : Fin 5) = 2 :=
      (pentagonOffClassBlocker_physical_cycle_actualBlockers_injective Q)
        (by simpa only [Hlate, c0, c1] using hcenters)
    omega
  have hc0c3 : c0 ≠ c3 := by
    intro hcenters
    have hindices : (1 : Fin 5) = 3 :=
      (pentagonOffClassBlocker_physical_cycle_actualBlockers_injective Q)
        (by simpa only [Hlate, c0, c3] using hcenters)
    omega
  have hc1c3 : c1 ≠ c3 := by
    intro hcenters
    have hindices : (2 : Fin 5) = 3 :=
      (pentagonOffClassBlocker_physical_cycle_actualBlockers_injective Q)
        (by simpa only [Hlate, c1, c3] using hcenters)
    omega
  have hc0O : c0 ≠ S.oppApex2 := by
    simpa only [Hlate, c0] using
      P.surface.secondApex_robust.centerAt_ne Hlate packet.xu Q.hxuA
  have hc1O : c1 ≠ S.oppApex2 := by
    simpa only [Hlate, c1] using
      P.surface.secondApex_robust.centerAt_ne Hlate
        P.jointDeletion.deleted.1 P.jointDeletion.deleted.2
  have hc3O : c3 ≠ S.oppApex2 := by
    simpa only [Hlate, c3] using
      P.surface.secondApex_robust.centerAt_ne Hlate P.v.1 P.v.2
  have hdO : d ≠ S.oppApex2 := by
    simpa only [Hlate, d] using
      P.surface.secondApex_robust.centerAt_ne Hlate c hcA
  by_cases hd0 : d = c0
  · have hsupports : Kc.support = Kxu.support := by
      simpa only [Kc, Kxu, d, c0] using
        (ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
          Hlate hcA Q.hxuA hd0)
    have hcKxu : c ∈ Kxu.support := by
      rw [← hsupports]
      exact Kc.q_mem_support
    exact Or.inr ⟨hd0, hxuKc, hcKxu⟩
  have hd1 : d ≠ c1 := by
    intro hcenters
    have hsupports : Kc.support = Kdeleted.support := by
      simpa only [Kc, Kdeleted, d, c1] using
        (ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
          Hlate hcA P.jointDeletion.deleted.2 hcenters)
    apply Q.hxuNotDeletedRow
    rw [← hsupports]
    exact hxuKc
  have hxvKv : packet.xv ∈ Kv.support := by
    have hmem :
        packet.xv ∈ Kv.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
      simpa only [Kv, Hlate] using (show
        packet.xv ∈
          ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 P.rho by
        rw [packet.opposite_row_trace]
        simp)
    exact (Finset.mem_inter.mp hmem).1
  have hd3 : d ≠ c3 := by
    intro hcenters
    have hsupports : Kc.support = Kv.support := by
      simpa only [Kc, Kv, d, c3] using
        (ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
          Hlate hcA P.v.2 hcenters)
    apply hxvNotKc
    rw [hsupports]
    exact hxvKv
  apply Or.inl
  change ({c0, c1, S.oppApex2, c3, d} : Finset ℝ²).card = 5
  simp [hc0c1, hc0O, hc0c3, Ne.symm hd0,
    hc1O, hc1c3, Ne.symm hd1,
    Ne.symm hc3O, Ne.symm hdO, Ne.symm hd3]

/-- Consumer-facing normalization of the exact-twelve `nextRowOnlyHit` arm.
Either deleting `u` gives an exact-eleven five-row boundary already installed
in one faithful carrier pattern, or the only remaining center collision is the
explicit mutually incident `xu`/next-row pair. -/
theorem pentagonOffClassBlocker_nextRowOnlyHit_exactElevenCarrier_or_xuCollision
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcard : D.A.card = 12)
    (hnextRowOnlyHit :
      let Hlate := lateFirstApexSystem R
      let Kxv :=
        (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
      let c := Hlate.centerAt packet.xv Q.hxvA
      let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
      let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
      packet.xu ∈ Kc.support ∧
        P.u.1 ∉ Kc.support ∧ packet.xv ∉ Kc.support) :
    let Hlate := lateFirstApexSystem R
    let Kxv :=
      (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
    let c := Hlate.centerAt packet.xv Q.hxvA
    let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
    let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
    let d := Hlate.centerAt c hcA
    let Kxu :=
      (Hlate.selectedAt packet.xu Q.hxuA).toCriticalFourShell
    let c0 := Hlate.centerAt packet.xu Q.hxuA
    let c1 := Hlate.centerAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2
    let c3 := Hlate.centerAt P.v.1 P.v.2
    ((D.A.erase P.u.1).card = 11 ∧
        Nonempty
          (ATailFiveCenterDeletionBoundary.FiveSurvivorFaithfulCarrierBoundary
            D H P.u.1 P.u.2 c0 c1 S.oppApex2 c3 d)) ∨
      (d = c0 ∧ packet.xu ∈ Kc.support ∧ c ∈ Kxu.support) := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxv :=
    (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let c := Hlate.centerAt packet.xv Q.hxvA
  let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
  let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
  let d := Hlate.centerAt c hcA
  let Kxu :=
    (Hlate.selectedAt packet.xu Q.hxuA).toCriticalFourShell
  let Kdeleted :=
    (Hlate.selectedAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2).toCriticalFourShell
  let Kv := (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
  let c0 := Hlate.centerAt packet.xu Q.hxuA
  let c1 := Hlate.centerAt P.jointDeletion.deleted.1
    P.jointDeletion.deleted.2
  let c3 := Hlate.centerAt P.v.1 P.v.2
  change packet.xu ∈ Kc.support ∧
    P.u.1 ∉ Kc.support ∧ packet.xv ∉ Kc.support at hnextRowOnlyHit
  have hsplit :=
    pentagonOffClassBlocker_nextRowOnlyHit_fiveDistinct_or_xuPositiveRowCollision
      Q hnextRowOnlyHit
  change
    ({c0, c1, S.oppApex2, c3, d} : Finset ℝ²).card = 5 ∨
      (d = c0 ∧ packet.xu ∈ Kc.support ∧ c ∈ Kxu.support) at hsplit
  rcases hsplit with hcenters | hcollision
  · apply Or.inl
    have hboundary :=
      pentagonOffClassBlocker_uDeletion_exactEleven_fiveSurvivorRows_of_u_not_mem_nextRow
        Q hcard hnextRowOnlyHit.2.1
    change
      (D.A.erase P.u.1).card = 11 ∧
        Nonempty
          (ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
            D H P.u.1 P.u.2 c0 c1 S.oppApex2 c3 d) at hboundary
    rcases hboundary with ⟨hcardErase, ⟨B⟩⟩
    refine ⟨hcardErase, ?_⟩
    have hc0A : c0 ∈ D.A := (Finset.mem_erase.mp Kxu.center_mem).2
    have hc1A : c1 ∈ D.A :=
      (Finset.mem_erase.mp Kdeleted.center_mem).2
    have hc3A : c3 ∈ D.A := (Finset.mem_erase.mp Kv.center_mem).2
    have hdA : d ∈ D.A := (Finset.mem_erase.mp Kc.center_mem).2
    have happ2A : S.oppApex2 ∈ D.A := by
      rcases hi : S.surplusIdx with ⟨i, hi3⟩
      interval_cases i
      · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
      · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
      · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem
    exact
      B.toFaithfulCarrierBoundary
        hc0A hc1A happ2A hc3A hdA hcenters
  · exact Or.inr hcollision

/-- After deleting `u`, the fixed physical-cycle sources `xu` and `deleted`
give two exact selected rows, while the physical-apex class gives a third.
All three contain the named physical point `deleted`.

This is a source-clean exact-row exporter.  It does not assert the five
additional center incidences required by the tetrahedron consumer below. -/
theorem pentagonOffClassBlocker_fixedPhysicalPair_uDeletion_threeExactRows_common_deleted
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet) :
    let Hlate := lateFirstApexSystem R
    let sourceXu : CarrierVertex D.A := ⟨packet.xu, Q.hxuA⟩
    let sourceDeleted : CarrierVertex D.A := P.jointDeletion.deleted
    let Kxu :=
      (Hlate.selectedAt sourceXu.1 sourceXu.2).toCriticalFourShell
    let Kdeleted :=
      (Hlate.selectedAt sourceDeleted.1 sourceDeleted.2).toCriticalFourShell
    let BO := SelectedClass (D.A.erase P.u.1) S.oppApex2 P.rho
    ∃ Cxu : U5QDeletedK4Class D P.u.1
        (Hlate.centerAt sourceXu.1 sourceXu.2) Kxu.support,
      ∃ Cdeleted : U5QDeletedK4Class D P.u.1
          (Hlate.centerAt sourceDeleted.1 sourceDeleted.2) Kdeleted.support,
        ∃ CO : U5QDeletedK4Class D P.u.1 S.oppApex2 BO,
          sourceDeleted.1 ∈ Kxu.support ∧
          sourceDeleted.1 ∈ Kdeleted.support ∧
          sourceDeleted.1 ∈ BO ∧
          BO.card = 4 ∧
          sourceXu.1 ∈ Kxu.support := by
  classical
  let Hlate := lateFirstApexSystem R
  let sourceXu : CarrierVertex D.A := ⟨packet.xu, Q.hxuA⟩
  let sourceDeleted : CarrierVertex D.A := P.jointDeletion.deleted
  let Kxu :=
    (Hlate.selectedAt sourceXu.1 sourceXu.2).toCriticalFourShell
  let Kdeleted :=
    (Hlate.selectedAt sourceDeleted.1 sourceDeleted.2).toCriticalFourShell
  let BO := SelectedClass (D.A.erase P.u.1) S.oppApex2 P.rho
  change
    ∃ Cxu : U5QDeletedK4Class D P.u.1
        (Hlate.centerAt sourceXu.1 sourceXu.2) Kxu.support,
      ∃ Cdeleted : U5QDeletedK4Class D P.u.1
          (Hlate.centerAt sourceDeleted.1 sourceDeleted.2) Kdeleted.support,
        ∃ CO : U5QDeletedK4Class D P.u.1 S.oppApex2 BO,
          sourceDeleted.1 ∈ Kxu.support ∧
          sourceDeleted.1 ∈ Kdeleted.support ∧
          sourceDeleted.1 ∈ BO ∧
          BO.card = 4 ∧
          sourceXu.1 ∈ Kxu.support
  let Cxu : U5QDeletedK4Class D P.u.1
      (Hlate.centerAt sourceXu.1 sourceXu.2) Kxu.support :=
    criticalFourShellToQDeletedK4ClassOfNotMem Kxu
      (by simpa only [Hlate, sourceXu, Kxu] using Q.huNotXuRow)
  let Cdeleted : U5QDeletedK4Class D P.u.1
      (Hlate.centerAt sourceDeleted.1 sourceDeleted.2) Kdeleted.support :=
    criticalFourShellToQDeletedK4ClassOfNotMem Kdeleted
      (by simpa only [Hlate, sourceDeleted, Kdeleted] using Q.huNotDeletedRow)
  have hBOCard : 4 ≤ BO.card := by
    have hfour := selectedClass_erase_card_ge_of_succ_le
      (A := D.A) (x := P.u.1) (s := S.oppApex2)
      (d := P.rho) (n := 4) P.hfive
    simpa [BO] using hfour
  let CO : U5QDeletedK4Class D P.u.1 S.oppApex2 BO :=
    selectedClassEraseToQDeletedK4Class P.hrho hBOCard
  have hdeletedClass :
      sourceDeleted.1 ∈ SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.physical_class]
    simp [sourceDeleted]
  have hdeletedBO : sourceDeleted.1 ∈ BO := by
    have hdata := mem_selectedClass.mp hdeletedClass
    exact mem_selectedClass.mpr
      ⟨Finset.mem_erase.mpr
          ⟨fun h => P.jointDeletion.deleted_ne_u (Subtype.ext h), hdata.1⟩,
        hdata.2⟩
  have hBOCardEq : BO.card = 4 := by
    dsimp [BO]
    rw [selectedClass_erase_eq, Finset.card_erase_of_mem P.huClass,
      P.hclassFive]
  exact ⟨Cxu, Cdeleted, CO,
    by simpa only [Hlate, sourceXu, sourceDeleted, Kxu] using Q.hdeletedXuRow,
    Kdeleted.q_mem_support, hdeletedBO, hBOCardEq, Kxu.q_mem_support⟩

/-- Checked consumer for the fixed `xu`/`deleted`/physical-apex rows after
deleting `u`.  If the five cross-center incidences hold, the three exact rows
form the forbidden planar tetrahedron pattern. -/
theorem pentagonOffClassBlocker_fixedPhysicalPair_uDeletion_false_of_tetrahedron_incidences
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hincidences :
      let Hlate := lateFirstApexSystem R
      let sourceXu : CarrierVertex D.A := ⟨packet.xu, Q.hxuA⟩
      let sourceDeleted : CarrierVertex D.A := P.jointDeletion.deleted
      let Kxu :=
        (Hlate.selectedAt sourceXu.1 sourceXu.2).toCriticalFourShell
      let Kdeleted :=
        (Hlate.selectedAt sourceDeleted.1 sourceDeleted.2).toCriticalFourShell
      let BO := SelectedClass (D.A.erase P.u.1) S.oppApex2 P.rho
      Hlate.centerAt sourceXu.1 sourceXu.2 ∈ BO ∧
        S.oppApex2 ∈ Kxu.support ∧
        Hlate.centerAt sourceDeleted.1 sourceDeleted.2 ∈ Kxu.support ∧
        S.oppApex2 ∈ Kdeleted.support ∧
        Hlate.centerAt sourceXu.1 sourceXu.2 ∈ Kdeleted.support) :
    False := by
  let Hlate := lateFirstApexSystem R
  let sourceXu : CarrierVertex D.A := ⟨packet.xu, Q.hxuA⟩
  let sourceDeleted : CarrierVertex D.A := P.jointDeletion.deleted
  let Kxu :=
    (Hlate.selectedAt sourceXu.1 sourceXu.2).toCriticalFourShell
  let Kdeleted :=
    (Hlate.selectedAt sourceDeleted.1 sourceDeleted.2).toCriticalFourShell
  let BO := SelectedClass (D.A.erase P.u.1) S.oppApex2 P.rho
  change
    Hlate.centerAt sourceXu.1 sourceXu.2 ∈ BO ∧
      S.oppApex2 ∈ Kxu.support ∧
      Hlate.centerAt sourceDeleted.1 sourceDeleted.2 ∈ Kxu.support ∧
      S.oppApex2 ∈ Kdeleted.support ∧
      Hlate.centerAt sourceXu.1 sourceXu.2 ∈ Kdeleted.support at hincidences
  rcases hincidences with ⟨hcXuBO, hOKxu, hcDeletedKxu,
    hOKdeleted, hcXuKdeleted⟩
  rcases
      pentagonOffClassBlocker_fixedPhysicalPair_uDeletion_threeExactRows_common_deleted
        Q with
    ⟨Cxu, Cdeleted, CO, hdeletedKxu, hdeletedKdeleted,
      hdeletedBO, _hBOCard, _hxuKxu⟩
  exact U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility
    CO Cxu Cdeleted hcXuBO hdeletedBO hOKxu hdeletedKxu
      hcDeletedKxu hOKdeleted hcXuKdeleted hdeletedKdeleted

/-- At the exact-cardinality-twelve endpoint the cap budgets are `(5,4,6)`,
and the strict interior of the second opposite cap is exactly the four named
points. -/
theorem pentagonOffClassBlocker_card_twelve_exact_cap_profile
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet : ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcardTwelve : D.A.card = 12) :
    S.surplusCap.card = 5 ∧
      S.oppCap1.card = 4 ∧
      S.oppCap2.card = 6 ∧
      S.capInteriorByIndex S.oppIndex2 =
        {P.u.1,
          (lateFirstApexSystem R).centerAt packet.xv Q.hxvA,
          packet.xv, packet.xu} ∧
      ExactFourSecondOppositeCapGrowth S := by
  classical
  let Hlate := lateFirstApexSystem R
  let c := Hlate.centerAt packet.xv Q.hxvA
  have hsum := S.capSum
  have hsurplus := S.surplus_card_gt_four
  have hfirst := P.surface.firstOppCap_card_ge_four
  have hsecond := Q.hsecond
  have hsurplusEq : S.surplusCap.card = 5 := by omega
  have hfirstEq : S.oppCap1.card = 4 := by omega
  have hsecondEq : S.oppCap2.card = 6 := by omega
  have hcapEq : S.capByIndex S.oppIndex2 = S.oppCap2 :=
    pentagonOffClassBlocker_capByIndex_oppIndex2_eq_oppCap2 S
  have hinteriorCard :=
    ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
      S S.oppIndex2
  have hinteriorCardFour :
      (S.capInteriorByIndex S.oppIndex2).card = 4 := by
    rw [hcapEq, hsecondEq] at hinteriorCard
    omega
  have huInterior : P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 :=
    pentagonOffClassBlocker_u_mem_secondCapInterior P packet
  have hxuInterior : packet.xu ∈ S.capInteriorByIndex S.oppIndex2 :=
    pentagonOffClassBlocker_xu_mem_secondCapInterior P packet
  have huClass : P.u.1 ∈ SelectedClass D.A S.oppApex2 P.rho := P.huClass
  have hxuClass : packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.physical_class]
    simp
  have hxvClass : packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.physical_class]
    simp
  have huNeC : P.u.1 ≠ c := by
    intro huEqC
    apply Q.hblockerNotClass
    simpa [c, huEqC] using huClass
  have hcNeXv : c ≠ packet.xv := by
    intro hcEqXv
    apply Q.hblockerNotClass
    change c ∈ SelectedClass D.A S.oppApex2 P.rho
    rw [hcEqXv]
    exact hxvClass
  have hcNeXu : c ≠ packet.xu := by
    intro hcEqXu
    apply Q.hblockerNotClass
    change c ∈ SelectedClass D.A S.oppApex2 P.rho
    rw [hcEqXu]
    exact hxuClass
  have huNeXv : P.u.1 ≠ packet.xv :=
    pentagonOffClassBlocker_u_ne_xv P packet
  have hxuNeXv : packet.xu ≠ packet.xv :=
    pentagonOffClassBlocker_xu_ne_xv P packet
  have hnamedCard :
      ({P.u.1, c, packet.xv, packet.xu} : Finset ℝ²).card = 4 := by
    rw [Finset.card_eq_four]
    exact ⟨P.u.1, c, packet.xv, packet.xu,
      huNeC, huNeXv, packet.xu_ne_u.symm,
      hcNeXv, hcNeXu, hxuNeXv.symm, rfl⟩
  have hnamedSubset :
      ({P.u.1, c, packet.xv, packet.xu} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.oppIndex2 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl | rfl
    · exact huInterior
    · exact Q.hblockerInterior
    · exact Q.hxvInterior
    · exact hxuInterior
  have hinteriorEq :
      S.capInteriorByIndex S.oppIndex2 =
        {P.u.1, c, packet.xv, packet.xu} := by
    exact (Finset.eq_of_subset_of_card_le hnamedSubset (by
      rw [hnamedCard, hinteriorCardFour])).symm
  refine ⟨hsurplusEq, hfirstEq, hsecondEq, ?_, ?_⟩
  · simpa [c] using hinteriorEq
  · exact
      { surplusCap_card_eq_five := hsurplusEq
        firstOppCap_card_eq_four := hfirstEq
        secondOppCap_card_ge_six := Q.hsecond
        secondOppCap_card_add_six_eq_carrier := by omega }

/-- Source-exact ingress for the six named-source/deletion arms used by the
exact-twelve CEGAR lane.  The selected blocker is not the first apex, and the
surviving deletion point is absent from the selected critical shell.  The
three source roles and two deletion choices therefore give exactly six arms.

This theorem only justifies the added finite clauses; it does not assert that
any arm is contradictory or close a live frontier leaf. -/
theorem pentagonOffClassBlocker_namedSource_survival_sixArm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (source : CarrierVertex D.A)
    (hsourceOutside : source ∈ outsideFirstApexFiber R)
    (hsourceNamed :
      source.1 = P.u.1 ∨
        source.1 = packet.xv ∨ source.1 = packet.xu)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2)) :
    (lateFirstApexSystem R).centerAt source.1 source.2 ≠ S.oppApex1 ∧
      ((source.1 = P.u.1 ∧
          R.interior_q ∉
            ((lateFirstApexSystem R).selectedAt source.1 source.2).toCriticalFourShell.support) ∨
        (source.1 = P.u.1 ∧
          R.interior_w ∉
            ((lateFirstApexSystem R).selectedAt source.1 source.2).toCriticalFourShell.support) ∨
        (source.1 = packet.xv ∧
          R.interior_q ∉
            ((lateFirstApexSystem R).selectedAt source.1 source.2).toCriticalFourShell.support) ∨
        (source.1 = packet.xv ∧
          R.interior_w ∉
            ((lateFirstApexSystem R).selectedAt source.1 source.2).toCriticalFourShell.support) ∨
        (source.1 = packet.xu ∧
          R.interior_q ∉
            ((lateFirstApexSystem R).selectedAt source.1 source.2).toCriticalFourShell.support) ∨
        (source.1 = packet.xu ∧
          R.interior_w ∉
            ((lateFirstApexSystem R).selectedAt source.1 source.2).toCriticalFourShell.support)) := by
  refine ⟨outsideFirstApexFiber_centerAt_ne_firstApex R hsourceOutside, ?_⟩
  rcases hsourceNamed with hu | hxv | hxu
  · rcases hsurvives with hq | hw
    · exact Or.inl ⟨hu,
        (cross_deletion_survives_iff_not_mem_selected_support
          (lateFirstApexSystem R) source.2).mp hq⟩
    · exact Or.inr (Or.inl ⟨hu,
        (cross_deletion_survives_iff_not_mem_selected_support
          (lateFirstApexSystem R) source.2).mp hw⟩)
  · rcases hsurvives with hq | hw
    · exact Or.inr (Or.inr (Or.inl ⟨hxv,
        (cross_deletion_survives_iff_not_mem_selected_support
          (lateFirstApexSystem R) source.2).mp hq⟩))
    · exact Or.inr (Or.inr (Or.inr (Or.inl ⟨hxv,
        (cross_deletion_survives_iff_not_mem_selected_support
          (lateFirstApexSystem R) source.2).mp hw⟩)))
  · rcases hsurvives with hq | hw
    · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl ⟨hxu,
        (cross_deletion_survives_iff_not_mem_selected_support
          (lateFirstApexSystem R) source.2).mp hq⟩))))
    · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr ⟨hxu,
        (cross_deletion_survives_iff_not_mem_selected_support
          (lateFirstApexSystem R) source.2).mp hw⟩))))

/-- Exact-twelve common-deletion residue after the checked tetrahedron
consumer has eliminated the complete five-incidence packet.  The final
hypothesis is the precise producer gap measured by the common-arm CEGAR lane;
`pentagonOffClassBlocker_namedSource_survival_sixArm` now kernel-checks the
six source/deletion predicates added by that lane.  The finite result remains
diagnostic until terminal six-arm coverage, certificate replay, and placement
transport are wired to this leaf. -/
theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_exactTwelve_interiorDeletion_physicalRadius_commonDeletion_missingIncidence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (_hcardTwelve : D.A.card = 12)
    (_hsurplus : S.surplusCap.card = 5)
    (_hfirst : S.oppCap1.card = 4)
    (_hsecondExact : S.oppCap2.card = 6)
    (_hinterior :
      S.capInteriorByIndex S.oppIndex2 =
        {P.u.1,
          (lateFirstApexSystem R).centerAt packet.xv Q.hxvA,
          packet.xv, packet.xu})
    (profile : ExactFourSecondOppositeCapGrowth S)
    (_hgrowth : P.surface.capGrowth =
      ExactFourRobustCapGrowth.secondOpposite profile)
    (source : CarrierVertex D.A)
    (_hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 P.rho)
    (_hsourceInterior :
      source.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (_hsourceOutside : source ∈ outsideFirstApexFiber R)
    (_hsourceNamed :
      source.1 = P.u.1 ∨
        source.1 = packet.xv ∨ source.1 = packet.xu)
    (_hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2))
    (_hcommon :
      let Hlate := lateFirstApexSystem R
      let Kxv :=
        (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
      let c := Hlate.centerAt packet.xv Q.hxvA
      let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
      Nonempty (CommonDeletionTwoCenterPacket
          D Hlate packet.xu c S.oppApex2) ∧
        Nonempty (CommonDeletionTwoCenterPacket
          D Hlate packet.xu (Hlate.centerAt c hcA) S.oppApex2))
    (_hmissingIncidence :
      ¬ (let Hlate := lateFirstApexSystem R
        let Kxv :=
          (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
        let c := Hlate.centerAt packet.xv Q.hxvA
        let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
        let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
        let d := Hlate.centerAt c hcA
        let BO := SelectedClass (D.A.erase packet.xu) S.oppApex2 P.rho
        d ∈ BO ∧
          S.oppApex2 ∈ Kc.support ∧
          P.u.1 ∈ Kc.support ∧
          S.oppApex2 ∈ Kxv.support ∧
          d ∈ Kxv.support)) :
    False := by
  sorry

/-- Exact-twelve complement of the common-deletion arm.  Here the row at the
off-class blocker's next blocker contains `xu` and omits the other two named
second-cap points. -/
theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_exactTwelve_interiorDeletion_physicalRadius_nextRowOnlyHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (_hcardTwelve : D.A.card = 12)
    (_hsurplus : S.surplusCap.card = 5)
    (_hfirst : S.oppCap1.card = 4)
    (_hsecondExact : S.oppCap2.card = 6)
    (_hinterior :
      S.capInteriorByIndex S.oppIndex2 =
        {P.u.1,
          (lateFirstApexSystem R).centerAt packet.xv Q.hxvA,
          packet.xv, packet.xu})
    (profile : ExactFourSecondOppositeCapGrowth S)
    (_hgrowth : P.surface.capGrowth =
      ExactFourRobustCapGrowth.secondOpposite profile)
    (source : CarrierVertex D.A)
    (_hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 P.rho)
    (_hsourceInterior :
      source.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (_hsourceOutside : source ∈ outsideFirstApexFiber R)
    (_hsourceNamed :
      source.1 = P.u.1 ∨
        source.1 = packet.xv ∨ source.1 = packet.xu)
    (_hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2))
    (_hnextRowOnlyHit :
      let Hlate := lateFirstApexSystem R
      let Kxv :=
        (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
      let c := Hlate.centerAt packet.xv Q.hxvA
      let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
      let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
      packet.xu ∈ Kc.support ∧
        P.u.1 ∉ Kc.support ∧ packet.xv ∉ Kc.support) :
    False := by
  sorry

/-- Physical-radius residue of the exact-twelve interior-deletion arm.  The
sharp two-radius cap bound removes the formerly arbitrary five-point radius,
and the off-class blocker condition removes the fourth named interior point.
Thus only the three physical-class points `u`, `xv`, and `xu` remain as the
source of the surviving deletion row.

Coordinator frontier: this checked dichotomy replaces the former single
physical-radius `sorry` by two on-spine leaves.  The common-deletion leaf also
uses the checked tetrahedron consumer to remove its complete-incidence arm;
only the complementary missing-incidence producer and the next-row-only-hit
arm remain.  This is a narrowing decomposition, not closure. -/
theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_exactTwelve_interiorDeletion_physicalRadius
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcardTwelve : D.A.card = 12)
    (hsurplus : S.surplusCap.card = 5)
    (hfirst : S.oppCap1.card = 4)
    (hsecondExact : S.oppCap2.card = 6)
    (hinterior :
      S.capInteriorByIndex S.oppIndex2 =
        {P.u.1,
          (lateFirstApexSystem R).centerAt packet.xv Q.hxvA,
          packet.xv, packet.xu})
    (profile : ExactFourSecondOppositeCapGrowth S)
    (hgrowth : P.surface.capGrowth =
      ExactFourRobustCapGrowth.secondOpposite profile)
    (source : CarrierVertex D.A)
    (hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 P.rho)
    (hsourceInterior :
      source.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hsourceOutside : source ∈ outsideFirstApexFiber R)
    (hsourceNamed :
      source.1 = P.u.1 ∨
        source.1 = packet.xv ∨ source.1 = packet.xu)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2)) :
    False := by
  rcases pentagonOffClassBlocker_xu_commonDeletionFans_or_nextRow_onlyHit Q with
      hcommon | hnextRowOnlyHit
  · let Hlate := lateFirstApexSystem R
    let Kxv :=
      (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
    let c := Hlate.centerAt packet.xv Q.hxvA
    have hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
    let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
    let d := Hlate.centerAt c hcA
    let BO := SelectedClass (D.A.erase packet.xu) S.oppApex2 P.rho
    by_cases hincidences :
        d ∈ BO ∧
          S.oppApex2 ∈ Kc.support ∧
          P.u.1 ∈ Kc.support ∧
          S.oppApex2 ∈ Kxv.support ∧
          d ∈ Kxv.support
    · exact pentagonOffClassBlocker_xuCommonArm_false_of_tetrahedron_incidences
        Q hcommon hincidences
    · exact
        false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_exactTwelve_interiorDeletion_physicalRadius_commonDeletion_missingIncidence
          Q hcardTwelve hsurplus hfirst hsecondExact hinterior profile hgrowth
            source hsourceClass hsourceInterior hsourceOutside hsourceNamed
            hsurvives hcommon hincidences
  · exact
      false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_exactTwelve_interiorDeletion_physicalRadius_nextRowOnlyHit
        Q hcardTwelve hsurplus hfirst hsecondExact hinterior profile hgrowth
          source hsourceClass hsourceInterior hsourceOutside hsourceNamed
          hsurvives hnextRowOnlyHit

/-- Five-point-radius arm of the exact-cardinality endpoint.  In addition to
the complete endpoint packet, it retains an actual strict-interior source,
identifies that source with one of the four named interior points, and carries
the surviving `q`- or `w`-deletion produced by the robust normal form. -/
theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_exactTwelve_interiorDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (_hcardTwelve : D.A.card = 12)
    (_hsurplus : S.surplusCap.card = 5)
    (_hfirst : S.oppCap1.card = 4)
    (_hsecondExact : S.oppCap2.card = 6)
    (_hinterior :
      S.capInteriorByIndex S.oppIndex2 =
        {P.u.1,
          (lateFirstApexSystem R).centerAt packet.xv Q.hxvA,
          packet.xv, packet.xu})
    (profile : ExactFourSecondOppositeCapGrowth S)
    (_hgrowth : P.surface.capGrowth =
      ExactFourRobustCapGrowth.secondOpposite profile)
    (rho : ℝ)
    (source : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (_hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hsourceInterior :
      source.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (_hsourceOutside : source ∈ outsideFirstApexFiber R)
    (_hsourceNamed :
      source.1 = P.u.1 ∨
        source.1 =
          (lateFirstApexSystem R).centerAt packet.xv Q.hxvA ∨
        source.1 = packet.xv ∨ source.1 = packet.xu)
    (_hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2)) :
    False := by
  have hrhoEq : rho = P.rho := by
    by_contra hne
    have hcap :=
      ATailCapApexRadiusRigidity.oppositeVertex_distinct_K4_radii_force_cap_card_ge_sum_sub_two
          S D.convex S.oppIndex2 _hrho P.hrho hne
    have hcap' :
        (SelectedClass D.A S.oppApex2 rho).card +
            (SelectedClass D.A S.oppApex2 P.rho).card ≤
          S.oppCap2.card + 2 := by
      simpa [oppositeVertexByIndex_oppIndex2,
        capByIndex_oppIndex2_eq_oppCap2_sourceHeavy] using hcap
    have hphysicalCard :
        (SelectedClass D.A S.oppApex2 P.rho).card = 5 := P.hclassFive
    omega
  subst rho
  have hsourceNamed' :
      source.1 = P.u.1 ∨
        source.1 = packet.xv ∨ source.1 = packet.xu := by
    rcases _hsourceNamed with hu | hc | hxv | hxu
    · exact Or.inl hu
    · exact False.elim (Q.hblockerNotClass (hc ▸ _hsourceClass))
    · exact Or.inr (Or.inl hxv)
    · exact Or.inr (Or.inr hxu)
  exact
    false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_exactTwelve_interiorDeletion_physicalRadius
      Q _hcardTwelve _hsurplus _hfirst _hsecondExact _hinterior profile
        _hgrowth source _hsourceClass _hsourceInterior _hsourceOutside
        hsourceNamed' _hsurvives

/-- No-five arm of the exact-cardinality endpoint.  The two distinct exact
four-point radius classes are retained together with the source-proved fact
that their strict-interior slices form an exact disjoint two-by-two partition
of the four named interior points. -/
theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_exactTwelve_twoRadiusPartition
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (_hcardTwelve : D.A.card = 12)
    (_hsurplus : S.surplusCap.card = 5)
    (_hfirst : S.oppCap1.card = 4)
    (_hsecondExact : S.oppCap2.card = 6)
    (_hinterior :
      S.capInteriorByIndex S.oppIndex2 =
        {P.u.1,
          (lateFirstApexSystem R).centerAt packet.xv Q.hxvA,
          packet.xv, packet.xu})
    (profile : ExactFourSecondOppositeCapGrowth S)
    (_hgrowth : P.surface.capGrowth =
      ExactFourRobustCapGrowth.secondOpposite profile)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (_hrho : 0 < rho)
    (_hother : 0 < otherRadius)
    (_hradii : otherRadius ≠ rho)
    (_hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (_hcardRho : (SelectedClass D.A S.oppApex2 rho).card = 4)
    (_hcardOther :
      (SelectedClass D.A S.oppApex2 otherRadius).card = 4)
    (_hfirstRadius : firstRow.radius = rho)
    (_hsecondRadius : secondRow.radius = otherRadius)
    (_hdisjoint : Disjoint firstRow.support secondRow.support)
    (_hinteriorPartition :
      let I₁ := SelectedClass D.A S.oppApex2 rho ∩
        S.capInteriorByIndex S.oppIndex2
      let I₂ := SelectedClass D.A S.oppApex2 otherRadius ∩
        S.capInteriorByIndex S.oppIndex2
      I₁.card = 2 ∧ I₂.card = 2 ∧ Disjoint I₁ I₂ ∧
        S.capInteriorByIndex S.oppIndex2 = I₁ ∪ I₂) :
    False := by
  have hphysicalClassSmall := _hnoFive P.rho P.hrho
  have hphysicalClassLarge := P.hfive
  omega

/-- Exact-cardinality endpoint of the off-class pentagon blocker branch.  The
inherited robust surface supplies the complete radius normal form.  The
five-point arm is specialized to a named interior source and surviving
deletion; the no-five arm is specialized to the exact two-by-two partition of
the four named strict-interior points. -/
theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_exactTwelve
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcardTwelve : D.A.card = 12)
    (hsurplus : S.surplusCap.card = 5)
    (hfirst : S.oppCap1.card = 4)
    (hsecondExact : S.oppCap2.card = 6)
    (hinterior :
      S.capInteriorByIndex S.oppIndex2 =
        {P.u.1,
          (lateFirstApexSystem R).centerAt packet.xv Q.hxvA,
          packet.xv, packet.xu})
    (profile : ExactFourSecondOppositeCapGrowth S)
    (hgrowth : P.surface.capGrowth =
      ExactFourRobustCapGrowth.secondOpposite profile) :
    False := by
  classical
  rcases interiorPairGood_or_twoDistinctExactFourInteriorRows R P.surface with
      ⟨rho, source, hrho, hfive, hsourceClass, hsourceInterior,
        hsourceOutside, hsurvives⟩ |
      ⟨rho, otherRadius, firstRow, secondRow, hrho, hother, hradii,
        hnoFive, hcardRho, hcardOther, hfirstRadius, hsecondRadius,
        hdisjoint, _hinteriorRho, _hinteriorOther⟩
  · have hsourceNamed :
        source.1 = P.u.1 ∨
          source.1 =
            (lateFirstApexSystem R).centerAt packet.xv Q.hxvA ∨
          source.1 = packet.xv ∨ source.1 = packet.xu := by
      have hsourceInterior' := hsourceInterior
      rw [hinterior] at hsourceInterior'
      simpa only [Finset.mem_insert, Finset.mem_singleton] using
        hsourceInterior'
    exact
      false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_exactTwelve_interiorDeletion
        Q hcardTwelve hsurplus hfirst hsecondExact hinterior profile hgrowth
          rho source hrho hfive hsourceClass hsourceInterior hsourceOutside
          hsourceNamed hsurvives
  · exact
      false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_exactTwelve_twoRadiusPartition
        Q hcardTwelve hsurplus hfirst hsecondExact hinterior profile hgrowth
          rho otherRadius firstRow secondRow hrho hother hradii hnoFive
          hcardRho hcardOther hfirstRadius hsecondRadius hdisjoint (by
            have hcapEq :
                S.capByIndex S.oppIndex2 = S.oppCap2 :=
              pentagonOffClassBlocker_capByIndex_oppIndex2_eq_oppCap2 S
            have hcapInteriorCard :=
              ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
                S S.oppIndex2
            have hcapInteriorCardFour :
                (S.capInteriorByIndex S.oppIndex2).card = 4 := by
              rw [hcapEq, hsecondExact] at hcapInteriorCard
              omega
            have hcardRhoIndexed :
                (SelectedClass D.A
                  (S.oppositeVertexByIndex S.oppIndex2) rho).card = 4 := by
              simpa [oppositeVertexByIndex_oppIndex2] using hcardRho
            have hcardOtherIndexed :
                (SelectedClass D.A
                  (S.oppositeVertexByIndex S.oppIndex2) otherRadius).card = 4 := by
              simpa [oppositeVertexByIndex_oppIndex2] using hcardOther
            simpa [oppositeVertexByIndex_oppIndex2] using
              (twoRichClassSlices_partition_of_capInterior_card_eq_four
                S D.convex S.oppIndex2 hrho hother hradii.symm
                  (by omega) (by omega) hcapInteriorCardFour))

/-- Fixed-pair residual after deleting `u` and eliminating the complete
tetrahedron-incidence packet.  The five rows in the final negated conjunction
are exactly the missing cross-center incidences for the checked
`xu`/`deleted`/physical-apex consumer. -/
theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_uDeletion_fixedPhysicalPair_missingIncidence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (_Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (_hcardThirteen : 13 ≤ D.A.card)
    (_hmissingIncidence :
      ¬ (let Hlate := lateFirstApexSystem R
        let sourceXu : CarrierVertex D.A := ⟨packet.xu, _Q.hxuA⟩
        let sourceDeleted : CarrierVertex D.A := P.jointDeletion.deleted
        let Kxu :=
          (Hlate.selectedAt sourceXu.1 sourceXu.2).toCriticalFourShell
        let Kdeleted :=
          (Hlate.selectedAt sourceDeleted.1
            sourceDeleted.2).toCriticalFourShell
        let BO := SelectedClass (D.A.erase P.u.1) S.oppApex2 P.rho
        Hlate.centerAt sourceXu.1 sourceXu.2 ∈ BO ∧
          S.oppApex2 ∈ Kxu.support ∧
          Hlate.centerAt sourceDeleted.1 sourceDeleted.2 ∈ Kxu.support ∧
          S.oppApex2 ∈ Kdeleted.support ∧
          Hlate.centerAt sourceXu.1 sourceXu.2 ∈ Kdeleted.support)) :
    False := by
  sorry

/-- Compatibility adapter for the older arbitrary-source `u`-deletion
interface.  The proof no longer depends on those witnesses: it switches to
the source-clean fixed pair `xu` and `deleted`, closes the complete-incidence
case by the checked tetrahedron consumer, and forwards only the complementary
missing-incidence case to the load-bearing leaf above. -/
theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_threeCenterDeletion_u
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcardThirteen : 13 ≤ D.A.card)
    (source₁ source₂ : CarrierVertex D.A)
    (_hsource₁Outside :
      source₁.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv Q.hxvA).toCriticalFourShell.support)
    (_hsource₂Outside :
      source₂.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv Q.hxvA).toCriticalFourShell.support)
    (_hcenters :
      (lateFirstApexSystem R).centerAt source₁.1 source₁.2 ≠
        (lateFirstApexSystem R).centerAt source₂.1 source₂.2)
    (_hcenter₁NeO :
      (lateFirstApexSystem R).centerAt source₁.1 source₁.2 ≠ S.oppApex2)
    (_hcenter₂NeO :
      (lateFirstApexSystem R).centerAt source₂.1 source₂.2 ≠ S.oppApex2)
    (_hsurvives₁ :
      HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        ((lateFirstApexSystem R).centerAt source₁.1 source₁.2))
    (_hsurvives₂ :
      HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        ((lateFirstApexSystem R).centerAt source₂.1 source₂.2))
    (_hsurvivesO :
      HasNEquidistantPointsAt 4 (D.A.erase P.u.1) S.oppApex2) :
    False := by
  let Hlate := lateFirstApexSystem R
  let sourceXu : CarrierVertex D.A := ⟨packet.xu, Q.hxuA⟩
  let sourceDeleted : CarrierVertex D.A := P.jointDeletion.deleted
  let Kxu :=
    (Hlate.selectedAt sourceXu.1 sourceXu.2).toCriticalFourShell
  let Kdeleted :=
    (Hlate.selectedAt sourceDeleted.1 sourceDeleted.2).toCriticalFourShell
  let BO := SelectedClass (D.A.erase P.u.1) S.oppApex2 P.rho
  by_cases hincidences :
      Hlate.centerAt sourceXu.1 sourceXu.2 ∈ BO ∧
        S.oppApex2 ∈ Kxu.support ∧
        Hlate.centerAt sourceDeleted.1 sourceDeleted.2 ∈ Kxu.support ∧
        S.oppApex2 ∈ Kdeleted.support ∧
        Hlate.centerAt sourceXu.1 sourceXu.2 ∈ Kdeleted.support
  · exact
      pentagonOffClassBlocker_fixedPhysicalPair_uDeletion_false_of_tetrahedron_incidences
        Q hincidences
  · exact
      false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_uDeletion_fixedPhysicalPair_missingIncidence
        Q hcardThirteen hincidences

/-- Residual `xv`-deletion endpoint after the complete tetrahedron-incidence
packet has been eliminated.  The final hypothesis says that at least one of
the five positive center incidences required by the checked consumer fails. -/
theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_threeCenterDeletion_xv_missingIncidence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (_Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (_hcardThirteen : 13 ≤ D.A.card)
    (source₁ source₂ : CarrierVertex D.A)
    (_hsource₁Outside :
      source₁.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv _Q.hxvA).toCriticalFourShell.support)
    (_hsource₂Outside :
      source₂.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv _Q.hxvA).toCriticalFourShell.support)
    (_hcenters :
      (lateFirstApexSystem R).centerAt source₁.1 source₁.2 ≠
        (lateFirstApexSystem R).centerAt source₂.1 source₂.2)
    (_hcenter₁NeO :
      (lateFirstApexSystem R).centerAt source₁.1 source₁.2 ≠ S.oppApex2)
    (_hcenter₂NeO :
      (lateFirstApexSystem R).centerAt source₂.1 source₂.2 ≠ S.oppApex2)
    (_hnotSurvivesU₁ :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        ((lateFirstApexSystem R).centerAt source₁.1 source₁.2))
    (_hnotSurvivesU₂ :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
        ((lateFirstApexSystem R).centerAt source₂.1 source₂.2))
    (_hsurvives₁ :
      HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
        ((lateFirstApexSystem R).centerAt source₁.1 source₁.2))
    (_hsurvives₂ :
      HasNEquidistantPointsAt 4 (D.A.erase packet.xv)
        ((lateFirstApexSystem R).centerAt source₂.1 source₂.2))
    (_hsurvivesO :
      HasNEquidistantPointsAt 4 (D.A.erase packet.xv) S.oppApex2)
    (_hmissingIncidence :
      ¬ (let Hlate := lateFirstApexSystem R
        let K₁ :=
          (Hlate.selectedAt source₁.1 source₁.2).toCriticalFourShell
        let K₂ :=
          (Hlate.selectedAt source₂.1 source₂.2).toCriticalFourShell
        let BO := SelectedClass (D.A.erase packet.xv) S.oppApex2 P.rho
        Hlate.centerAt source₁.1 source₁.2 ∈ BO ∧
          S.oppApex2 ∈ K₁.support ∧
          Hlate.centerAt source₂.1 source₂.2 ∈ K₁.support ∧
          S.oppApex2 ∈ K₂.support ∧
          Hlate.centerAt source₁.1 source₁.2 ∈ K₂.support)) :
    False := by
  sorry

/-- Unbounded endpoint of the off-class pentagon blocker branch.  The
endpoint deletion is split explicitly.  In the `xv` arm, the checked
tetrahedron consumer discharges the complete five-incidence packet; only its
negation remains as a child obligation. -/
theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_threeCenterDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (_hcardThirteen : 13 ≤ D.A.card)
    (deleted : ℝ²)
    (_hdeleted : deleted = P.u.1 ∨ deleted = packet.xv)
    (source₁ source₂ : CarrierVertex D.A)
    (_hsource₁Outside :
      source₁.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv Q.hxvA).toCriticalFourShell.support)
    (_hsource₂Outside :
      source₂.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv Q.hxvA).toCriticalFourShell.support)
    (_hcenters :
      (lateFirstApexSystem R).centerAt source₁.1 source₁.2 ≠
        (lateFirstApexSystem R).centerAt source₂.1 source₂.2)
    (_hcenter₁NeO :
      (lateFirstApexSystem R).centerAt source₁.1 source₁.2 ≠ S.oppApex2)
    (_hcenter₂NeO :
      (lateFirstApexSystem R).centerAt source₂.1 source₂.2 ≠ S.oppApex2)
    (_hnotSurvivesU₁ :
      deleted = packet.xv →
        ¬ HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
          ((lateFirstApexSystem R).centerAt source₁.1 source₁.2))
    (_hnotSurvivesU₂ :
      deleted = packet.xv →
        ¬ HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
          ((lateFirstApexSystem R).centerAt source₂.1 source₂.2))
    (_hsurvives₁ :
      HasNEquidistantPointsAt 4 (D.A.erase deleted)
        ((lateFirstApexSystem R).centerAt source₁.1 source₁.2))
    (_hsurvives₂ :
      HasNEquidistantPointsAt 4 (D.A.erase deleted)
        ((lateFirstApexSystem R).centerAt source₂.1 source₂.2))
    (_hsurvivesO :
      HasNEquidistantPointsAt 4 (D.A.erase deleted) S.oppApex2) :
    False := by
  rcases _hdeleted with hdeletedU | hdeletedXv
  · subst deleted
    exact
      false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_threeCenterDeletion_u
        Q _hcardThirteen source₁ source₂ _hsource₁Outside
        _hsource₂Outside _hcenters _hcenter₁NeO _hcenter₂NeO
        _hsurvives₁ _hsurvives₂ _hsurvivesO
  · subst deleted
    let Hlate := lateFirstApexSystem R
    let K₁ :=
      (Hlate.selectedAt source₁.1 source₁.2).toCriticalFourShell
    let K₂ :=
      (Hlate.selectedAt source₂.1 source₂.2).toCriticalFourShell
    let BO := SelectedClass (D.A.erase packet.xv) S.oppApex2 P.rho
    by_cases hincidences :
        Hlate.centerAt source₁.1 source₁.2 ∈ BO ∧
          S.oppApex2 ∈ K₁.support ∧
          Hlate.centerAt source₂.1 source₂.2 ∈ K₁.support ∧
          S.oppApex2 ∈ K₂.support ∧
          Hlate.centerAt source₁.1 source₁.2 ∈ K₂.support
    · exact pentagonOffClassBlocker_xvDeletion_false_of_tetrahedron_incidences
        Q source₁ source₂ _hsource₁Outside _hsource₂Outside
        (_hnotSurvivesU₁ rfl) (_hnotSurvivesU₂ rfl)
        _hsurvives₁ _hsurvives₂ hincidences
    · exact
        false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_threeCenterDeletion_xv_missingIncidence
          Q _hcardThirteen source₁ source₂ _hsource₁Outside
          _hsource₂Outside _hcenters _hcenter₁NeO _hcenter₂NeO
          (_hnotSurvivesU₁ rfl) (_hnotSurvivesU₂ rfl)
          _hsurvives₁ _hsurvives₂ _hsurvivesO hincidences

/-- Pentagon blocker leaf: the `xv`-row blocker is a strict-interior
carrier point OFF the physical class circle.  Narrowing over the parent
pentagon: the parent-proved interior localization of that blocker, the
off-class certificate, and the five-cycle class traces of the `xv` row
(exactly `{xv, u}`) and of the `xu` row (exactly `{xu, deleted}`).  The
on-class alternatives are all discharged by the parent: `u` and `xv` by
row incidence, `xu` by the equilateral convex-hull kill, and `deleted`
and `v` by the two sibling blocker leaves.

Coordinator frontier: before this declaration the immediate frontier was one
on-spine obligation.  Its proof now has checked fan-out two: the exact-twelve
profile leaf above, and the cardinality-at-least-thirteen same-deletion
three-center leaf above.  Both retain the full parent residual.  This changes
one local `sorry` into two strictly narrower on-spine `sorry`s; it is an
auditable decomposition, not closure. -/
theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (_packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (_hsecond : 6 ≤ S.oppCap2.card)
    (hxuA : _packet.xu ∈ D.A)
    (hxvA : _packet.xv ∈ D.A)
    (_huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          _packet.xv hxvA).toCriticalFourShell.support)
    (_huNotXuRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          _packet.xu hxuA).toCriticalFourShell.support)
    (_hxvNotXuRow :
      _packet.xv ∉
        ((lateFirstApexSystem R).selectedAt
          _packet.xu hxuA).toCriticalFourShell.support)
    (_hdeletedXuRow :
      P.jointDeletion.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          _packet.xu hxuA).toCriticalFourShell.support)
    (_hvDeletedRow :
      P.v.1 ∈
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support)
    (_huNotDeletedRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support)
    (_hxuNotDeletedRow :
      _packet.xu ∉
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support)
    (_hxvNotDeletedRow :
      _packet.xv ∉
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support)
    (_hclassFive :
      ∀ q ∈ SelectedClass D.A S.oppApex2 P.rho,
        q = P.u.1 ∨ q = _packet.xu ∨ q = P.jointDeletion.deleted.1 ∨
          q = P.v.1 ∨ q = _packet.xv)
    (_hxvInterior :
      _packet.xv ∈ S.capInteriorByIndex S.oppIndex2)
    (_hblockerInterior :
      (lateFirstApexSystem R).centerAt _packet.xv hxvA ∈
        S.capInteriorByIndex S.oppIndex2)
    (_hblockerNotClass :
      (lateFirstApexSystem R).centerAt _packet.xv hxvA ∉
        SelectedClass D.A S.oppApex2 P.rho)
    (_htraceBound :
      ∀ x ∈
        ((lateFirstApexSystem R).selectedAt
          _packet.xv hxvA).toCriticalFourShell.support,
        x ∈ SelectedClass D.A S.oppApex2 P.rho →
          x = _packet.xv ∨ x = P.u.1)
    (_htraceBoundXu :
      ∀ x ∈
        ((lateFirstApexSystem R).selectedAt
          _packet.xu hxuA).toCriticalFourShell.support,
        x ∈ SelectedClass D.A S.oppApex2 P.rho →
          x = _packet.xu ∨ x = P.jointDeletion.deleted.1) :
    False := by
  let Q : ExactFourRigid221PentagonOffClassBlockerResidual P _packet :=
    { hsecond := _hsecond
      hxuA := hxuA
      hxvA := hxvA
      huXvRow := _huXvRow
      huNotXuRow := _huNotXuRow
      hxvNotXuRow := _hxvNotXuRow
      hdeletedXuRow := _hdeletedXuRow
      hvDeletedRow := _hvDeletedRow
      huNotDeletedRow := _huNotDeletedRow
      hxuNotDeletedRow := _hxuNotDeletedRow
      hxvNotDeletedRow := _hxvNotDeletedRow
      hclassFive := _hclassFive
      hxvInterior := _hxvInterior
      hblockerInterior := _hblockerInterior
      hblockerNotClass := _hblockerNotClass
      htraceBound := _htraceBound
      htraceBoundXu := _htraceBoundXu }
  rcases pentagonOffClassBlocker_threeCenterDeletion_or_card_eq_twelve
      P _packet hxvA _huXvRow with hcardTwelve | hthree
  · rcases pentagonOffClassBlocker_card_twelve_exact_cap_profile
      P _packet Q hcardTwelve with
      ⟨hsurplus, hfirst, hsecondExact, hinterior, profile⟩
    exact
      false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_exactTwelve
        Q hcardTwelve hsurplus hfirst hsecondExact hinterior profile
          (Subsingleton.elim _ _)
  · rcases hthree with
      ⟨hcardThirteen, deleted, hdeleted, source₁, source₂,
        hsource₁Outside, hsource₂Outside, hcenters,
        hcenter₁NeO, hcenter₂NeO, hnotSurvivesU₁, hnotSurvivesU₂,
        hsurvives₁, hsurvives₂, hsurvivesO⟩
    exact
      false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_threeCenterDeletion
        Q hcardThirteen deleted hdeleted source₁ source₂
          hsource₁Outside hsource₂Outside hcenters hcenter₁NeO hcenter₂NeO
          hnotSurvivesU₁ hnotSurvivesU₂ hsurvives₁ hsurvives₂ hsurvivesO

/-- Checked blocker-identity split of the pentagon: the five-cycle
configuration in which the physical second-apex class consists of exactly
the five named points `{u, xu, deleted, v, xv}`, with all five class row
traces pinned into the directed five-cycle `u → xu → deleted → v → xv → u`.
The blocker identity `centerAt u = xv` makes `xv` equidistant from the
strict-interior pair `{u, xu}`, so the two-center cap localization places
`xv`, and with it the `xv`-row blocker, in the strict physical second-cap
interior.  Splitting on the physical-class membership of that blocker
covers three residual leaves: `u` and `xv` are excluded by row incidence,
`xu` by the equilateral convex-hull kill, and the surviving alternatives
are `deleted`, `v` and off-class. -/
theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagon
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (_packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (_hsecond : 6 ≤ S.oppCap2.card)
    (hxuA : _packet.xu ∈ D.A)
    (hxvA : _packet.xv ∈ D.A)
    (_huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          _packet.xv hxvA).toCriticalFourShell.support)
    (_huNotXuRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          _packet.xu hxuA).toCriticalFourShell.support)
    (_hxvNotXuRow :
      _packet.xv ∉
        ((lateFirstApexSystem R).selectedAt
          _packet.xu hxuA).toCriticalFourShell.support)
    (_hdeletedXuRow :
      P.jointDeletion.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          _packet.xu hxuA).toCriticalFourShell.support)
    (_hvDeletedRow :
      P.v.1 ∈
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support)
    (_huNotDeletedRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support)
    (_hxuNotDeletedRow :
      _packet.xu ∉
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support)
    (_hxvNotDeletedRow :
      _packet.xv ∉
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support)
    (_hclassFive :
      ∀ q ∈ SelectedClass D.A S.oppApex2 P.rho,
        q = P.u.1 ∨ q = _packet.xu ∨ q = P.jointDeletion.deleted.1 ∨
          q = P.v.1 ∨ q = _packet.xv) :
    False := by
  classical
  let Hlate := lateFirstApexSystem R
  let Ku :=
    (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
  let Kxv :=
    (Hlate.selectedAt _packet.xv hxvA).toCriticalFourShell
  have hxvInterior :=
    exactFourRigid221_sourceHeavy_xv_mem_secondCapInterior P _packet
  have htraceBound :=
    exactFourRigid221_sourceHeavy_pentagon_xvRow_trace_bound
      P _packet hxvA _huXvRow
  have htraceBoundXu :=
    exactFourRigid221_sourceHeavy_pentagon_xuRow_trace_bound
      P _packet hxuA _hdeletedXuRow _hxuNotDeletedRow
  have hcxvInterior :=
    exactFourRigid221_sourceHeavy_pentagon_blocker_mem_secondCapInterior
      P _packet hxvA _huXvRow
  by_cases hblockerClass :
      Hlate.centerAt _packet.xv hxvA ∈
        SelectedClass D.A S.oppApex2 P.rho
  · rcases _hclassFive _ hblockerClass with
      hcu | hcxu | hcdeleted | hcv | hcxv
    · apply False.elim
      apply Kxv.center_not_mem_support
      simpa only [hcu] using _huXvRow
    · have hxuInter :
          _packet.xu ∈
            (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 P.rho := by
        rw [_packet.source_row_trace]
        simp
      have hxuURow : _packet.xu ∈ Ku.support :=
        (Finset.mem_inter.mp hxuInter).1
      have hcenterU :
          Hlate.centerAt P.u.1 P.u.2 = _packet.xv := by
        simpa [Hlate, P.huSource] using _packet.blocker_eq_xv
      have hcxvEq :
          dist (Hlate.centerAt _packet.xv hxvA) _packet.xv =
            dist (Hlate.centerAt _packet.xv hxvA) P.u.1 :=
        (Kxv.support_eq_radius _ Kxv.q_mem_support).trans
          (Kxv.support_eq_radius _ _huXvRow).symm
      have huxv_eq_xuxv :
          dist P.u.1 _packet.xv = dist _packet.xu _packet.xv := by
        have h := (Ku.support_eq_radius _ Ku.q_mem_support).trans
          (Ku.support_eq_radius _ hxuURow).symm
        rw [hcenterU] at h
        simpa [dist_comm] using h
      have huxu_eq_xuxv :
          dist P.u.1 _packet.xu = dist _packet.xu _packet.xv := by
        have h := hcxvEq
        rw [hcxu] at h
        simpa [dist_comm] using h.symm
      exact exactFourRigid221_sourceHeavy_pentagon_equilateralXu_false
        P _packet hxuA hxvA huxv_eq_xuxv huxu_eq_xuxv
    · exact
        false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerDeleted
          P _packet _hsecond hxuA hxvA _huXvRow _huNotXuRow _hxvNotXuRow
          _hdeletedXuRow _hvDeletedRow _huNotDeletedRow _hxuNotDeletedRow
          _hxvNotDeletedRow _hclassFive hxvInterior hcxvInterior hcdeleted
          htraceBound htraceBoundXu
    · exact
        false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV
          P _packet _hsecond hxuA hxvA _huXvRow _huNotXuRow _hxvNotXuRow
          _hdeletedXuRow _hvDeletedRow _huNotDeletedRow _hxuNotDeletedRow
          _hxvNotDeletedRow _hclassFive hxvInterior hcxvInterior hcv
          htraceBound htraceBoundXu
    · exact (centerAt_ne_source Hlate _packet.xv hxvA hcxv).elim
  · exact
      false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker
        P _packet _hsecond hxuA hxvA _huXvRow _huNotXuRow _hxvNotXuRow
        _hdeletedXuRow _hvDeletedRow _huNotDeletedRow _hxuNotDeletedRow
        _hxvNotDeletedRow _hclassFive hxvInterior hcxvInterior hblockerClass
        htraceBound htraceBoundXu
/-- Large-cap incidence leaf with every class row trace fully pinned:
`{u, xu}`, `{v, xv}`, `{xv, u}`, `{xu, deleted}`, `{deleted, v}`.  The
rigid class carries the directed five-cycle
`u → xu → deleted → v → xv → u` of row incidences.  Splitting on the
class cardinality: any sixth class point lies outside two pinned rows,
so casing on the second class slot of its own row always leaves a
mutually omitted pair with two prescribed joint deletions and a free
blocker-distinctness certificate, closing through the two-deletion
terminal.  The residual is the pentagon leaf where the class is exactly
the five named points. -/
theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_fiveCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (_hsecond : 6 ≤ S.oppCap2.card)
    (hxuA : packet.xu ∈ D.A)
    (hxvA : packet.xv ∈ D.A)
    (_huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (_huNotXuRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support)
    (_hxvNotXuRow :
      packet.xv ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support)
    (_hdeletedXuRow :
      P.jointDeletion.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support)
    (_hvDeletedRow :
      P.v.1 ∈
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support)
    (_huNotDeletedRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support)
    (_hxuNotDeletedRow :
      packet.xu ∉
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support)
    (_hxvNotDeletedRow :
      packet.xv ∉
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support) :
    False := by
  classical
  by_cases hz :
      ∃ z ∈ SelectedClass D.A S.oppApex2 P.rho,
        z ≠ P.u.1 ∧ z ≠ packet.xu ∧ z ≠ P.jointDeletion.deleted.1 ∧
          z ≠ P.v.1 ∧ z ≠ packet.xv
  · -- A sixth class point closes through the two-deletion terminal.
    rcases hz with ⟨z, hzClass, hzNeU, hzNeXu, hzNeDel, hzNeV, hzNeXv⟩
    have hzA : z ∈ D.A := (mem_selectedClass.mp hzClass).1
    have hxuInter :
        packet.xu ∈
          ((lateFirstApexSystem R).selectedAt
              P.u.1 P.u.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho := by
      rw [packet.source_row_trace]
      simp
    have hxvInter :
        packet.xv ∈
          ((lateFirstApexSystem R).selectedAt
              P.v.1 P.v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho := by
      rw [packet.opposite_row_trace]
      simp
    have hxuClass :
        packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho :=
      (Finset.mem_inter.mp hxuInter).2
    have hxvClass :
        packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho :=
      (Finset.mem_inter.mp hxvInter).2
    have hxuURow :
        packet.xu ∈
          ((lateFirstApexSystem R).selectedAt
            P.u.1 P.u.2).toCriticalFourShell.support :=
      (Finset.mem_inter.mp hxuInter).1
    have hxvVRow :
        packet.xv ∈
          ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support :=
      (Finset.mem_inter.mp hxvInter).1
    have hcenterU :
        (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = packet.xv := by
      simpa only [P.huSource] using packet.blocker_eq_xv
    have hxvNotURow :
        packet.xv ∉
          ((lateFirstApexSystem R).selectedAt
            P.u.1 P.u.2).toCriticalFourShell.support := by
      intro h
      rw [← hcenterU] at h
      exact
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.center_not_mem_support h
    have huNeXu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
    have hxuNeXv : packet.xu ≠ packet.xv := by
      intro h
      apply hxvNotURow
      rw [← h]
      exact hxuURow
    have hxuNeV : packet.xu ≠ P.v.1 := by
      intro h
      apply P.hvOmitted
      simpa only [← h] using hxuURow
    have hvNeXv : P.v.1 ≠ packet.xv := by
      intro h
      exact packet.xv_ne_v h.symm
    have huNeVpt : P.u.1 ≠ P.v.1 := by
      intro h
      exact P.huNeV (Subtype.ext h)
    have hdeletedNeXu : P.jointDeletion.deleted.1 ≠ packet.xu := by
      intro h
      apply P.jointDeletion.deleted_not_mem_uRow
      simpa only [h] using hxuURow
    have hdeletedNeXv : P.jointDeletion.deleted.1 ≠ packet.xv := by
      intro h
      apply P.jointDeletion.deleted_not_mem_vRow
      simpa only [h] using hxvVRow
    have hdeletedNeU : P.jointDeletion.deleted.1 ≠ P.u.1 := by
      intro h
      exact P.jointDeletion.deleted_ne_u (Subtype.ext h)
    have hdeletedNeV : P.jointDeletion.deleted.1 ≠ P.v.1 := by
      intro h
      exact P.jointDeletion.deleted_ne_v (Subtype.ext h)
    have hcardU :
        (((lateFirstApexSystem R).selectedAt
              P.u.1 P.u.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho).card ≤ 2 :=
      actualLateRow_secondClass_card_le_two R P.surface P.u
    have huOwnInter :
        P.u.1 ∈
          ((lateFirstApexSystem R).selectedAt
              P.u.1 P.u.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho :=
      Finset.mem_inter.mpr
        ⟨((lateFirstApexSystem R).selectedAt
            P.u.1 P.u.2).toCriticalFourShell.q_mem_support,
          P.huClass⟩
    have hzNotURow :
        z ∉
          ((lateFirstApexSystem R).selectedAt
            P.u.1 P.u.2).toCriticalFourShell.support := by
      intro h
      exact
        third_not_mem_of_card_le_two hcardU huOwnInter hxuInter
          huNeXu hzNeU.symm hzNeXu.symm
          (Finset.mem_inter.mpr ⟨h, hzClass⟩)
    have hcardV :
        (((lateFirstApexSystem R).selectedAt
              P.v.1 P.v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho).card ≤ 2 :=
      actualLateRow_secondClass_card_le_two R P.surface P.v
    have hvOwnInter :
        P.v.1 ∈
          ((lateFirstApexSystem R).selectedAt
              P.v.1 P.v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho :=
      Finset.mem_inter.mpr
        ⟨((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.q_mem_support,
          P.hvClass⟩
    have hzNotVRow :
        z ∉
          ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support := by
      intro h
      exact
        third_not_mem_of_card_le_two hcardV hvOwnInter hxvInter
          hvNeXv hzNeV.symm hzNeXv.symm
          (Finset.mem_inter.mpr ⟨h, hzClass⟩)
    have hxuNotVRow :
        packet.xu ∉
          ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support := by
      intro h
      exact
        third_not_mem_of_card_le_two hcardV hvOwnInter hxvInter
          hvNeXv hxuNeV.symm hxuNeXv.symm
          (Finset.mem_inter.mpr ⟨h, hxuClass⟩)
    have hblockersNeZV :
        (lateFirstApexSystem R).centerAt z hzA ≠
          (lateFirstApexSystem R).centerAt P.v.1 P.v.2 := by
      intro hcenters
      have hsupports :=
        ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
          (lateFirstApexSystem R) hzA P.v.2 hcenters
      apply hzNotVRow
      rw [← hsupports]
      exact
        ((lateFirstApexSystem R).selectedAt
          z hzA).toCriticalFourShell.q_mem_support
    have hblockersNeZU :
        (lateFirstApexSystem R).centerAt z hzA ≠
          (lateFirstApexSystem R).centerAt P.u.1 P.u.2 := by
      intro hcenters
      have hsupports :=
        ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
          (lateFirstApexSystem R) hzA P.u.2 hcenters
      apply hzNotURow
      rw [← hsupports]
      exact
        ((lateFirstApexSystem R).selectedAt
          z hzA).toCriticalFourShell.q_mem_support
    have hcardZ :
        (((lateFirstApexSystem R).selectedAt
              z hzA).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho).card ≤ 2 :=
      actualLateRow_secondClass_card_le_two R P.surface ⟨z, hzA⟩
    have hzOwnInter :
        z ∈
          ((lateFirstApexSystem R).selectedAt
              z hzA).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho :=
      Finset.mem_inter.mpr
        ⟨((lateFirstApexSystem R).selectedAt
            z hzA).toCriticalFourShell.q_mem_support,
          hzClass⟩
    have hzNeUvert : (⟨z, hzA⟩ : CarrierVertex D.A) ≠ P.u := by
      intro hpair
      exact hzNeU (congrArg Subtype.val hpair)
    have hzNeVvert : (⟨z, hzA⟩ : CarrierVertex D.A) ≠ P.v := by
      intro hpair
      exact hzNeV (congrArg Subtype.val hpair)
    by_cases hU :
        P.u.1 ∈
          ((lateFirstApexSystem R).selectedAt
            z hzA).toCriticalFourShell.support
    · -- The sixth row contains `u`: pair `(z, v)` deletes `xu` and
      -- the rigid deleted point.
      have hUInter :
          P.u.1 ∈
            ((lateFirstApexSystem R).selectedAt
                z hzA).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 P.rho :=
        Finset.mem_inter.mpr ⟨hU, P.huClass⟩
      have hvNotZRow :
          P.v.1 ∉
            ((lateFirstApexSystem R).selectedAt
              z hzA).toCriticalFourShell.support := by
        intro h
        exact
          third_not_mem_of_card_le_two hcardZ hzOwnInter hUInter
            hzNeU hzNeV huNeVpt
            (Finset.mem_inter.mpr ⟨h, P.hvClass⟩)
      have hxuNotZRow :
          packet.xu ∉
            ((lateFirstApexSystem R).selectedAt
              z hzA).toCriticalFourShell.support := by
        intro h
        exact
          third_not_mem_of_card_le_two hcardZ hzOwnInter hUInter
            hzNeU hzNeXu huNeXu
            (Finset.mem_inter.mpr ⟨h, hxuClass⟩)
      have hdelNotZRow :
          P.jointDeletion.deleted.1 ∉
            ((lateFirstApexSystem R).selectedAt
              z hzA).toCriticalFourShell.support := by
        intro h
        exact
          third_not_mem_of_card_le_two hcardZ hzOwnInter hUInter
            hzNeU hzNeDel hdeletedNeU.symm
            (Finset.mem_inter.mpr
              ⟨h, P.jointDeletion.deleted_mem_class⟩)
      rcases
          exactFourMutualOmissionJointDeletion_of_prescribed
            R P.surface P.rho ⟨z, hzA⟩ P.v
              ⟨packet.xu, hxuA⟩ hxuClass hxuNotZRow hxuNotVRow
              hblockersNeZV with
        ⟨first, hfirst⟩
      rcases
          exactFourMutualOmissionJointDeletion_of_prescribed
            R P.surface P.rho ⟨z, hzA⟩ P.v
              P.jointDeletion.deleted P.jointDeletion.deleted_mem_class
              hdelNotZRow P.jointDeletion.deleted_not_mem_vRow
              hblockersNeZV with
        ⟨second, hsecond2⟩
      have hdeletionsNe : first.deleted ≠ second.deleted := by
        intro h
        exact
          hdeletedNeXu
            (congrArg Subtype.val
              (hfirst.symm.trans (h.trans hsecond2))).symm
      exact
        false_of_twoDistinctExactFourMutualOmissionJointDeletions
          R P.hcard P.surface P.rho P.hrho P.hfive
            ⟨z, hzA⟩ P.v
            hzNeVvert
            hzClass P.hvClass
            hvNotZRow hzNotVRow first second hdeletionsNe
    · by_cases hXu :
          packet.xu ∈
            ((lateFirstApexSystem R).selectedAt
              z hzA).toCriticalFourShell.support
      · -- The sixth row contains `xu`: pair `(z, v)` deletes `u` and
        -- the rigid deleted point.
        have hXuInter :
            packet.xu ∈
              ((lateFirstApexSystem R).selectedAt
                  z hzA).toCriticalFourShell.support ∩
                SelectedClass D.A S.oppApex2 P.rho :=
          Finset.mem_inter.mpr ⟨hXu, hxuClass⟩
        have hvNotZRow :
            P.v.1 ∉
              ((lateFirstApexSystem R).selectedAt
                z hzA).toCriticalFourShell.support := by
          intro h
          exact
            third_not_mem_of_card_le_two hcardZ hzOwnInter hXuInter
              hzNeXu hzNeV hxuNeV
              (Finset.mem_inter.mpr ⟨h, P.hvClass⟩)
        have hdelNotZRow :
            P.jointDeletion.deleted.1 ∉
              ((lateFirstApexSystem R).selectedAt
                z hzA).toCriticalFourShell.support := by
          intro h
          exact
            third_not_mem_of_card_le_two hcardZ hzOwnInter hXuInter
              hzNeXu hzNeDel hdeletedNeXu.symm
              (Finset.mem_inter.mpr
                ⟨h, P.jointDeletion.deleted_mem_class⟩)
        rcases
            exactFourMutualOmissionJointDeletion_of_prescribed
              R P.surface P.rho ⟨z, hzA⟩ P.v
                P.u P.huClass hU P.huOmitted hblockersNeZV with
          ⟨first, hfirst⟩
        rcases
            exactFourMutualOmissionJointDeletion_of_prescribed
              R P.surface P.rho ⟨z, hzA⟩ P.v
                P.jointDeletion.deleted
                P.jointDeletion.deleted_mem_class
                hdelNotZRow P.jointDeletion.deleted_not_mem_vRow
                hblockersNeZV with
          ⟨second, hsecond2⟩
        have hdeletionsNe : first.deleted ≠ second.deleted := by
          intro h
          exact
            hdeletedNeU
              (congrArg Subtype.val
                (hfirst.symm.trans (h.trans hsecond2))).symm
        exact
          false_of_twoDistinctExactFourMutualOmissionJointDeletions
            R P.hcard P.surface P.rho P.hrho P.hfive
              ⟨z, hzA⟩ P.v
              hzNeVvert
              hzClass P.hvClass
              hvNotZRow hzNotVRow first second hdeletionsNe
      · by_cases hDel :
            P.jointDeletion.deleted.1 ∈
              ((lateFirstApexSystem R).selectedAt
                z hzA).toCriticalFourShell.support
        · -- The sixth row contains the rigid deleted point: pair
          -- `(z, v)` deletes `u` and `xu`.
          have hDelInter :
              P.jointDeletion.deleted.1 ∈
                ((lateFirstApexSystem R).selectedAt
                    z hzA).toCriticalFourShell.support ∩
                  SelectedClass D.A S.oppApex2 P.rho :=
            Finset.mem_inter.mpr
              ⟨hDel, P.jointDeletion.deleted_mem_class⟩
          have hvNotZRow :
              P.v.1 ∉
                ((lateFirstApexSystem R).selectedAt
                  z hzA).toCriticalFourShell.support := by
            intro h
            exact
              third_not_mem_of_card_le_two hcardZ hzOwnInter hDelInter
                hzNeDel hzNeV hdeletedNeV
                (Finset.mem_inter.mpr ⟨h, P.hvClass⟩)
          rcases
              exactFourMutualOmissionJointDeletion_of_prescribed
                R P.surface P.rho ⟨z, hzA⟩ P.v
                  P.u P.huClass hU P.huOmitted hblockersNeZV with
            ⟨first, hfirst⟩
          rcases
              exactFourMutualOmissionJointDeletion_of_prescribed
                R P.surface P.rho ⟨z, hzA⟩ P.v
                  ⟨packet.xu, hxuA⟩ hxuClass hXu hxuNotVRow
                  hblockersNeZV with
            ⟨second, hsecond2⟩
          have hdeletionsNe : first.deleted ≠ second.deleted := by
            intro h
            exact
              huNeXu
                (congrArg Subtype.val
                  (hfirst.symm.trans (h.trans hsecond2)))
          exact
            false_of_twoDistinctExactFourMutualOmissionJointDeletions
              R P.hcard P.surface P.rho P.hrho P.hfive
                ⟨z, hzA⟩ P.v
                hzNeVvert
                hzClass P.hvClass
                hvNotZRow hzNotVRow first second hdeletionsNe
        · by_cases hV :
              P.v.1 ∈
                ((lateFirstApexSystem R).selectedAt
                  z hzA).toCriticalFourShell.support
          · -- The sixth row contains `v`: pair `(z, u)` deletes the
            -- rigid deleted point and `xv`.
            have hVInter :
                P.v.1 ∈
                  ((lateFirstApexSystem R).selectedAt
                      z hzA).toCriticalFourShell.support ∩
                    SelectedClass D.A S.oppApex2 P.rho :=
              Finset.mem_inter.mpr ⟨hV, P.hvClass⟩
            have hxvNotZRow :
                packet.xv ∉
                  ((lateFirstApexSystem R).selectedAt
                    z hzA).toCriticalFourShell.support := by
              intro h
              exact
                third_not_mem_of_card_le_two hcardZ hzOwnInter hVInter
                  hzNeV hzNeXv hvNeXv
                  (Finset.mem_inter.mpr ⟨h, hxvClass⟩)
            rcases
                exactFourMutualOmissionJointDeletion_of_prescribed
                  R P.surface P.rho ⟨z, hzA⟩ P.u
                    P.jointDeletion.deleted
                    P.jointDeletion.deleted_mem_class
                    hDel P.jointDeletion.deleted_not_mem_uRow
                    hblockersNeZU with
              ⟨first, hfirst⟩
            rcases
                exactFourMutualOmissionJointDeletion_of_prescribed
                  R P.surface P.rho ⟨z, hzA⟩ P.u
                    ⟨packet.xv, hxvA⟩ hxvClass hxvNotZRow hxvNotURow
                    hblockersNeZU with
              ⟨second, hsecond2⟩
            have hdeletionsNe : first.deleted ≠ second.deleted := by
              intro h
              exact
                hdeletedNeXv
                  (congrArg Subtype.val
                    (hfirst.symm.trans (h.trans hsecond2)))
            exact
              false_of_twoDistinctExactFourMutualOmissionJointDeletions
                R P.hcard P.surface P.rho P.hrho P.hfive
                  ⟨z, hzA⟩ P.u
                  hzNeUvert
                  hzClass P.huClass
                  hU hzNotURow first second hdeletionsNe
          · -- The sixth row contains none of `u`, `xu`, `deleted`, `v`:
            -- pair `(z, v)` deletes `u` and the rigid deleted point.
            rcases
                exactFourMutualOmissionJointDeletion_of_prescribed
                  R P.surface P.rho ⟨z, hzA⟩ P.v
                    P.u P.huClass hU P.huOmitted hblockersNeZV with
              ⟨first, hfirst⟩
            rcases
                exactFourMutualOmissionJointDeletion_of_prescribed
                  R P.surface P.rho ⟨z, hzA⟩ P.v
                    P.jointDeletion.deleted
                    P.jointDeletion.deleted_mem_class
                    hDel P.jointDeletion.deleted_not_mem_vRow
                    hblockersNeZV with
              ⟨second, hsecond2⟩
            have hdeletionsNe : first.deleted ≠ second.deleted := by
              intro h
              exact
                hdeletedNeU
                  (congrArg Subtype.val
                    (hfirst.symm.trans (h.trans hsecond2))).symm
            exact
              false_of_twoDistinctExactFourMutualOmissionJointDeletions
                R P.hcard P.surface P.rho P.hrho P.hfive
                  ⟨z, hzA⟩ P.v
                  hzNeVvert
                  hzClass P.hvClass
                  hV hzNotVRow first second hdeletionsNe
  · -- No sixth class point: the class is exactly the five named points.
    have hclassFive :
        ∀ q ∈ SelectedClass D.A S.oppApex2 P.rho,
          q = P.u.1 ∨ q = packet.xu ∨ q = P.jointDeletion.deleted.1 ∨
            q = P.v.1 ∨ q = packet.xv := by
      intro q hqClass
      by_contra hcon
      push_neg at hcon
      exact
        hz
          ⟨q, hqClass, hcon.1, hcon.2.1, hcon.2.2.1, hcon.2.2.2.1,
            hcon.2.2.2.2⟩
    exact
      false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagon
        P packet _hsecond hxuA hxvA _huXvRow _huNotXuRow _hxvNotXuRow
          _hdeletedXuRow _hvDeletedRow _huNotDeletedRow
          _hxuNotDeletedRow _hxvNotDeletedRow hclassFive

/-- Large-cap incidence leaf with `u` in the `xv` row and the rigid deleted
point in the `xu` row, both reverse incidences absent.  The row traces are
pinned to `{u, xu}`, `{v, xv}`, `{xv, u}`, `{xu, deleted}`.  Casing on the
second class slot of the deleted row closes every branch through a
prescribed joint-deletion pair except `v ∈ deleted`-row, which is the
five-cycle leaf. -/
theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_deletedXuRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hsecond : 6 ≤ S.oppCap2.card)
    (hxuA : packet.xu ∈ D.A)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support)
    (huNotXuRow :
      P.u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support)
    (hxvNotXuRow :
      packet.xv ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support)
    (hdeletedXuRow :
      P.jointDeletion.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support) :
    False := by
  classical
  have hxuInter :
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
            P.u.1 P.u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.source_row_trace]
    simp
  have hxvInter :
      packet.xv ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.opposite_row_trace]
    simp
  have hxuClass :
      packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxuInter).2
  have hxvClass :
      packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxvInter).2
  have hxuURow :
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support :=
    (Finset.mem_inter.mp hxuInter).1
  have hxvVRow :
      packet.xv ∈
        ((lateFirstApexSystem R).selectedAt
          P.v.1 P.v.2).toCriticalFourShell.support :=
    (Finset.mem_inter.mp hxvInter).1
  have hcenterU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [P.huSource] using packet.blocker_eq_xv
  have hxvNotURow :
      packet.xv ∉
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support := by
    intro h
    rw [← hcenterU] at h
    exact
      ((lateFirstApexSystem R).selectedAt
        P.u.1 P.u.2).toCriticalFourShell.center_not_mem_support h
  have huNeXu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply hxvNotURow
    rw [← h]
    exact
      ((lateFirstApexSystem R).selectedAt
        P.u.1 P.u.2).toCriticalFourShell.q_mem_support
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply hxvNotURow
    rw [← h]
    exact hxuURow
  have hxuNeV : packet.xu ≠ P.v.1 := by
    intro h
    apply P.hvOmitted
    simpa only [← h] using hxuURow
  have hvNeXv : P.v.1 ≠ packet.xv := by
    intro h
    exact packet.xv_ne_v h.symm
  have huNeVpt : P.u.1 ≠ P.v.1 := by
    intro h
    exact P.huNeV (Subtype.ext h)
  have hdeletedNeXu : P.jointDeletion.deleted.1 ≠ packet.xu := by
    intro h
    apply P.jointDeletion.deleted_not_mem_uRow
    simpa only [h] using hxuURow
  have hdeletedNeXv : P.jointDeletion.deleted.1 ≠ packet.xv := by
    intro h
    apply P.jointDeletion.deleted_not_mem_vRow
    simpa only [h] using hxvVRow
  have hdeletedNeU : P.jointDeletion.deleted.1 ≠ P.u.1 := by
    intro h
    exact P.jointDeletion.deleted_ne_u (Subtype.ext h)
  have hdeletedNeV : P.jointDeletion.deleted.1 ≠ P.v.1 := by
    intro h
    exact P.jointDeletion.deleted_ne_v (Subtype.ext h)
  have hcardXv :
      (((lateFirstApexSystem R).selectedAt
            packet.xv hxvA).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho).card ≤ 2 :=
    actualLateRow_secondClass_card_le_two R P.surface ⟨packet.xv, hxvA⟩
  have hxvOwnInter :
      packet.xv ∈
        ((lateFirstApexSystem R).selectedAt
            packet.xv hxvA).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho :=
    Finset.mem_inter.mpr
      ⟨((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.q_mem_support,
        hxvClass⟩
  have huXvInter :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
            packet.xv hxvA).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho :=
    Finset.mem_inter.mpr ⟨huXvRow, P.huClass⟩
  have hvNotXvRow :
      P.v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support := by
    intro h
    exact
      third_not_mem_of_card_le_two hcardXv hxvOwnInter huXvInter
        huNeXv.symm hvNeXv.symm huNeVpt
        (Finset.mem_inter.mpr ⟨h, P.hvClass⟩)
  have hxuNotXvRow :
      packet.xu ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support := by
    intro h
    exact
      third_not_mem_of_card_le_two hcardXv hxvOwnInter huXvInter
        huNeXv.symm hxuNeXv.symm huNeXu
        (Finset.mem_inter.mpr ⟨h, hxuClass⟩)
  have hdeletedNotXvRow :
      P.jointDeletion.deleted.1 ∉
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support := by
    intro h
    exact
      third_not_mem_of_card_le_two hcardXv hxvOwnInter huXvInter
        huNeXv.symm hdeletedNeXv.symm hdeletedNeU.symm
        (Finset.mem_inter.mpr ⟨h, P.jointDeletion.deleted_mem_class⟩)
  have hxuNotVRow :
      packet.xu ∉
        ((lateFirstApexSystem R).selectedAt
          P.v.1 P.v.2).toCriticalFourShell.support := by
    intro h
    have hmem :
        packet.xu ∈
          ((lateFirstApexSystem R).selectedAt
              P.v.1 P.v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho :=
      Finset.mem_inter.mpr ⟨h, hxuClass⟩
    rw [packet.opposite_row_trace] at hmem
    simp only [Finset.mem_insert, Finset.mem_singleton] at hmem
    rcases hmem with h1 | h1
    · exact hxuNeV h1
    · exact hxuNeXv h1
  have hcardDel :
      (((lateFirstApexSystem R).selectedAt
            P.jointDeletion.deleted.1
            P.jointDeletion.deleted.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho).card ≤ 2 :=
    actualLateRow_secondClass_card_le_two R P.surface
      P.jointDeletion.deleted
  have hdelOwnInter :
      P.jointDeletion.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
            P.jointDeletion.deleted.1
            P.jointDeletion.deleted.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho :=
    Finset.mem_inter.mpr
      ⟨((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.q_mem_support,
        P.jointDeletion.deleted_mem_class⟩
  by_cases hVDel :
      P.v.1 ∈
        ((lateFirstApexSystem R).selectedAt
          P.jointDeletion.deleted.1
          P.jointDeletion.deleted.2).toCriticalFourShell.support
  · -- The deleted-row second class slot is `v`: all five row traces are
    -- pinned, which is the five-cycle leaf.
    have hvDelInter :
        P.v.1 ∈
          ((lateFirstApexSystem R).selectedAt
              P.jointDeletion.deleted.1
              P.jointDeletion.deleted.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho :=
      Finset.mem_inter.mpr ⟨hVDel, P.hvClass⟩
    have huNotDelRow :
        P.u.1 ∉
          ((lateFirstApexSystem R).selectedAt
            P.jointDeletion.deleted.1
            P.jointDeletion.deleted.2).toCriticalFourShell.support := by
      intro h
      exact
        third_not_mem_of_card_le_two hcardDel hdelOwnInter hvDelInter
          hdeletedNeV hdeletedNeU huNeVpt.symm
          (Finset.mem_inter.mpr ⟨h, P.huClass⟩)
    have hxuNotDelRow :
        packet.xu ∉
          ((lateFirstApexSystem R).selectedAt
            P.jointDeletion.deleted.1
            P.jointDeletion.deleted.2).toCriticalFourShell.support := by
      intro h
      exact
        third_not_mem_of_card_le_two hcardDel hdelOwnInter hvDelInter
          hdeletedNeV hdeletedNeXu hxuNeV.symm
          (Finset.mem_inter.mpr ⟨h, hxuClass⟩)
    have hxvNotDelRow :
        packet.xv ∉
          ((lateFirstApexSystem R).selectedAt
            P.jointDeletion.deleted.1
            P.jointDeletion.deleted.2).toCriticalFourShell.support := by
      intro h
      exact
        third_not_mem_of_card_le_two hcardDel hdelOwnInter hvDelInter
          hdeletedNeV hdeletedNeXv hvNeXv
          (Finset.mem_inter.mpr ⟨h, hxvClass⟩)
    exact
      false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_fiveCycle
        P packet hsecond hxuA hxvA huXvRow huNotXuRow hxvNotXuRow
          hdeletedXuRow hVDel huNotDelRow hxuNotDelRow hxvNotDelRow
  · by_cases hUDel :
        P.u.1 ∈
          ((lateFirstApexSystem R).selectedAt
            P.jointDeletion.deleted.1
            P.jointDeletion.deleted.2).toCriticalFourShell.support
    · -- Deleted-row class trace `{deleted, u}`: two prescribed joint
      -- deletions for the mutually omitted pair `(deleted, xv)`.
      have huDelInter :
          P.u.1 ∈
            ((lateFirstApexSystem R).selectedAt
                P.jointDeletion.deleted.1
                P.jointDeletion.deleted.2).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 P.rho :=
        Finset.mem_inter.mpr ⟨hUDel, P.huClass⟩
      have hxuNotDelRow :
          packet.xu ∉
            ((lateFirstApexSystem R).selectedAt
              P.jointDeletion.deleted.1
              P.jointDeletion.deleted.2).toCriticalFourShell.support := by
        intro h
        exact
          third_not_mem_of_card_le_two hcardDel hdelOwnInter huDelInter
            hdeletedNeU hdeletedNeXu huNeXu
            (Finset.mem_inter.mpr ⟨h, hxuClass⟩)
      have hxvNotDelRow :
          packet.xv ∉
            ((lateFirstApexSystem R).selectedAt
              P.jointDeletion.deleted.1
              P.jointDeletion.deleted.2).toCriticalFourShell.support := by
        intro h
        exact
          third_not_mem_of_card_le_two hcardDel hdelOwnInter huDelInter
            hdeletedNeU hdeletedNeXv huNeXv
            (Finset.mem_inter.mpr ⟨h, hxvClass⟩)
      have hblockersNe :
          (lateFirstApexSystem R).centerAt
              P.jointDeletion.deleted.1 P.jointDeletion.deleted.2 ≠
            (lateFirstApexSystem R).centerAt packet.xv hxvA := by
        intro hcenters
        have hsupports :=
          ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
            (lateFirstApexSystem R) P.jointDeletion.deleted.2 hxvA
              hcenters
        apply hdeletedNotXvRow
        rw [← hsupports]
        exact
          ((lateFirstApexSystem R).selectedAt
            P.jointDeletion.deleted.1
            P.jointDeletion.deleted.2).toCriticalFourShell.q_mem_support
      rcases
          exactFourMutualOmissionJointDeletion_of_prescribed
            R P.surface P.rho P.jointDeletion.deleted ⟨packet.xv, hxvA⟩
              P.v P.hvClass hVDel hvNotXvRow hblockersNe with
        ⟨first, hfirst⟩
      rcases
          exactFourMutualOmissionJointDeletion_of_prescribed
            R P.surface P.rho P.jointDeletion.deleted ⟨packet.xv, hxvA⟩
              ⟨packet.xu, hxuA⟩ hxuClass hxuNotDelRow hxuNotXvRow
              hblockersNe with
        ⟨second, hsecond2⟩
      have hdeletionsNe : first.deleted ≠ second.deleted := by
        intro h
        exact
          hxuNeV
            (congrArg Subtype.val
              (hfirst.symm.trans (h.trans hsecond2))).symm
      exact
        false_of_twoDistinctExactFourMutualOmissionJointDeletions
          R P.hcard P.surface P.rho P.hrho P.hfive
            P.jointDeletion.deleted ⟨packet.xv, hxvA⟩
            (by
              intro hpair
              exact hdeletedNeXv (congrArg Subtype.val hpair))
            P.jointDeletion.deleted_mem_class hxvClass
            hxvNotDelRow hdeletedNotXvRow
            first second hdeletionsNe
    · by_cases hXvDel :
          packet.xv ∈
            ((lateFirstApexSystem R).selectedAt
              P.jointDeletion.deleted.1
              P.jointDeletion.deleted.2).toCriticalFourShell.support
      · -- Deleted-row class trace `{deleted, xv}`: two prescribed joint
        -- deletions for the mutually omitted pair `(deleted, v)`.
        have hxvDelInter :
            packet.xv ∈
              ((lateFirstApexSystem R).selectedAt
                  P.jointDeletion.deleted.1
                  P.jointDeletion.deleted.2).toCriticalFourShell.support
                ∩ SelectedClass D.A S.oppApex2 P.rho :=
          Finset.mem_inter.mpr ⟨hXvDel, hxvClass⟩
        have hxuNotDelRow :
            packet.xu ∉
              ((lateFirstApexSystem R).selectedAt
                P.jointDeletion.deleted.1
                P.jointDeletion.deleted.2).toCriticalFourShell.support := by
          intro h
          exact
            third_not_mem_of_card_le_two hcardDel hdelOwnInter
              hxvDelInter hdeletedNeXv hdeletedNeXu hxuNeXv.symm
              (Finset.mem_inter.mpr ⟨h, hxuClass⟩)
        have hblockersNe :
            (lateFirstApexSystem R).centerAt
                P.jointDeletion.deleted.1 P.jointDeletion.deleted.2 ≠
              (lateFirstApexSystem R).centerAt P.v.1 P.v.2 := by
          intro hcenters
          have hsupports :=
            ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
              (lateFirstApexSystem R) P.jointDeletion.deleted.2 P.v.2
                hcenters
          apply P.jointDeletion.deleted_not_mem_vRow
          rw [← hsupports]
          exact
            ((lateFirstApexSystem R).selectedAt
              P.jointDeletion.deleted.1
              P.jointDeletion.deleted.2).toCriticalFourShell.q_mem_support
        rcases
            exactFourMutualOmissionJointDeletion_of_prescribed
              R P.surface P.rho P.jointDeletion.deleted P.v
                P.u P.huClass hUDel P.huOmitted hblockersNe with
          ⟨first, hfirst⟩
        rcases
            exactFourMutualOmissionJointDeletion_of_prescribed
              R P.surface P.rho P.jointDeletion.deleted P.v
                ⟨packet.xu, hxuA⟩ hxuClass hxuNotDelRow hxuNotVRow
                hblockersNe with
          ⟨second, hsecond2⟩
        have hdeletionsNe : first.deleted ≠ second.deleted := by
          intro h
          exact
            huNeXu
              (congrArg Subtype.val
                (hfirst.symm.trans (h.trans hsecond2)))
        exact
          false_of_twoDistinctExactFourMutualOmissionJointDeletions
            R P.hcard P.surface P.rho P.hrho P.hfive
              P.jointDeletion.deleted P.v
              P.jointDeletion.deleted_ne_v
              P.jointDeletion.deleted_mem_class P.hvClass
              hVDel P.jointDeletion.deleted_not_mem_vRow
              first second hdeletionsNe
      · -- The deleted row omits `u`, `v`, and `xv`: two prescribed joint
        -- deletions for the mutually omitted pair `(deleted, u)`.
        have hblockersNe :
            (lateFirstApexSystem R).centerAt
                P.jointDeletion.deleted.1 P.jointDeletion.deleted.2 ≠
              (lateFirstApexSystem R).centerAt P.u.1 P.u.2 := by
          intro hcenters
          have hsupports :=
            ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
              (lateFirstApexSystem R) P.jointDeletion.deleted.2 P.u.2
                hcenters
          apply P.jointDeletion.deleted_not_mem_uRow
          rw [← hsupports]
          exact
            ((lateFirstApexSystem R).selectedAt
              P.jointDeletion.deleted.1
              P.jointDeletion.deleted.2).toCriticalFourShell.q_mem_support
        rcases
            exactFourMutualOmissionJointDeletion_of_prescribed
              R P.surface P.rho P.jointDeletion.deleted P.u
                P.v P.hvClass hVDel P.hvOmitted hblockersNe with
          ⟨first, hfirst⟩
        rcases
            exactFourMutualOmissionJointDeletion_of_prescribed
              R P.surface P.rho P.jointDeletion.deleted P.u
                ⟨packet.xv, hxvA⟩ hxvClass hXvDel hxvNotURow
                hblockersNe with
          ⟨second, hsecond2⟩
        have hdeletionsNe : first.deleted ≠ second.deleted := by
          intro h
          exact
            hvNeXv
              (congrArg Subtype.val
                (hfirst.symm.trans (h.trans hsecond2)))
        exact
          false_of_twoDistinctExactFourMutualOmissionJointDeletions
            R P.hcard P.surface P.rho P.hrho P.hfive
              P.jointDeletion.deleted P.u
              P.jointDeletion.deleted_ne_u
              P.jointDeletion.deleted_mem_class P.huClass
              hUDel P.jointDeletion.deleted_not_mem_uRow
              first second hdeletionsNe

/-- Checked incidence split for the large physical-second-cap residual of
the source-heavy arm.  The two-point class-trace bound localizes the row
incidences of the four named class points, and the prescribed
joint-deletion machinery closes every branch except the two `xu`-row
occupation leaves above, which are the remaining obligations.  No
cap-profile counting is consumed by the split itself. -/
theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hsecond : 6 ≤ S.oppCap2.card) :
    False := by
  classical
  have hxuInter :
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
            P.u.1 P.u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.source_row_trace]
    simp
  have hxvInter :
      packet.xv ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [packet.opposite_row_trace]
    simp
  have hxuClass :
      packet.xu ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxuInter).2
  have hxvClass :
      packet.xv ∈ SelectedClass D.A S.oppApex2 P.rho :=
    (Finset.mem_inter.mp hxvInter).2
  have hxuA : packet.xu ∈ D.A := (mem_selectedClass.mp hxuClass).1
  have hxvA : packet.xv ∈ D.A := (mem_selectedClass.mp hxvClass).1
  have hxuURow :
      packet.xu ∈
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support :=
    (Finset.mem_inter.mp hxuInter).1
  have hxvVRow :
      packet.xv ∈
        ((lateFirstApexSystem R).selectedAt
          P.v.1 P.v.2).toCriticalFourShell.support :=
    (Finset.mem_inter.mp hxvInter).1
  have hcenterU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = packet.xv := by
    simpa only [P.huSource] using packet.blocker_eq_xv
  have hxvNotURow :
      packet.xv ∉
        ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support := by
    intro h
    rw [← hcenterU] at h
    exact
      ((lateFirstApexSystem R).selectedAt
        P.u.1 P.u.2).toCriticalFourShell.center_not_mem_support h
  have huNeXu : P.u.1 ≠ packet.xu := packet.xu_ne_u.symm
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply hxvNotURow
    rw [← h]
    exact
      ((lateFirstApexSystem R).selectedAt
        P.u.1 P.u.2).toCriticalFourShell.q_mem_support
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply hxvNotURow
    rw [← h]
    exact hxuURow
  have hxuNeV : packet.xu ≠ P.v.1 := by
    intro h
    apply P.hvOmitted
    simpa only [← h] using hxuURow
  have hvNeXv : P.v.1 ≠ packet.xv := by
    intro h
    exact packet.xv_ne_v h.symm
  have huNeVpt : P.u.1 ≠ P.v.1 := by
    intro h
    exact P.huNeV (Subtype.ext h)
  have hdeletedNeXu : P.jointDeletion.deleted.1 ≠ packet.xu := by
    intro h
    apply P.jointDeletion.deleted_not_mem_uRow
    simpa only [h] using hxuURow
  have hdeletedNeXv : P.jointDeletion.deleted.1 ≠ packet.xv := by
    intro h
    apply P.jointDeletion.deleted_not_mem_vRow
    simpa only [h] using hxvVRow
  have hdeletedNeU : P.jointDeletion.deleted.1 ≠ P.u.1 := by
    intro h
    exact P.jointDeletion.deleted_ne_u (Subtype.ext h)
  have hdeletedNeV : P.jointDeletion.deleted.1 ≠ P.v.1 := by
    intro h
    exact P.jointDeletion.deleted_ne_v (Subtype.ext h)
  have hcardXv :
      (((lateFirstApexSystem R).selectedAt
            packet.xv hxvA).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho).card ≤ 2 :=
    actualLateRow_secondClass_card_le_two R P.surface ⟨packet.xv, hxvA⟩
  have hxvOwnInter :
      packet.xv ∈
        ((lateFirstApexSystem R).selectedAt
            packet.xv hxvA).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho :=
    Finset.mem_inter.mpr
      ⟨((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.q_mem_support,
        hxvClass⟩
  by_cases huXvRow :
      P.u.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xv hxvA).toCriticalFourShell.support
  · -- The `xv`-row class trace is `{xv, u}`.
    have huXvInter :
        P.u.1 ∈
          ((lateFirstApexSystem R).selectedAt
              packet.xv hxvA).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 P.rho :=
      Finset.mem_inter.mpr ⟨huXvRow, P.huClass⟩
    have hxuNotXvRow :
        packet.xu ∉
          ((lateFirstApexSystem R).selectedAt
            packet.xv hxvA).toCriticalFourShell.support := by
      intro h
      exact
        third_not_mem_of_card_le_two hcardXv hxvOwnInter huXvInter
          huNeXv.symm hxuNeXv.symm huNeXu
          (Finset.mem_inter.mpr ⟨h, hxuClass⟩)
    have hvNotXvRow :
        P.v.1 ∉
          ((lateFirstApexSystem R).selectedAt
            packet.xv hxvA).toCriticalFourShell.support := by
      intro h
      exact
        third_not_mem_of_card_le_two hcardXv hxvOwnInter huXvInter
          huNeXv.symm hvNeXv.symm huNeVpt
          (Finset.mem_inter.mpr ⟨h, P.hvClass⟩)
    have hdeletedNotXvRow :
        P.jointDeletion.deleted.1 ∉
          ((lateFirstApexSystem R).selectedAt
            packet.xv hxvA).toCriticalFourShell.support := by
      intro h
      exact
        third_not_mem_of_card_le_two hcardXv hxvOwnInter huXvInter
          huNeXv.symm hdeletedNeXv.symm hdeletedNeU.symm
          (Finset.mem_inter.mpr ⟨h, P.jointDeletion.deleted_mem_class⟩)
    by_cases huXuRow :
        P.u.1 ∈
          ((lateFirstApexSystem R).selectedAt
            packet.xu hxuA).toCriticalFourShell.support
    · exact
        false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_reciprocalArm
          P packet hxuA hxvA huXvRow huXuRow
    · by_cases hxvXuRow :
          packet.xv ∈
            ((lateFirstApexSystem R).selectedAt
              packet.xu hxuA).toCriticalFourShell.support
      · -- The `xu`-row class trace is `{xu, xv}`: two prescribed joint
        -- deletions for the mutually omitted pair `(v, xu)`.
        have hcardXu :
            (((lateFirstApexSystem R).selectedAt
                  packet.xu hxuA).toCriticalFourShell.support ∩
                SelectedClass D.A S.oppApex2 P.rho).card ≤ 2 :=
          actualLateRow_secondClass_card_le_two R P.surface
            ⟨packet.xu, hxuA⟩
        have hxuOwnInter :
            packet.xu ∈
              ((lateFirstApexSystem R).selectedAt
                  packet.xu hxuA).toCriticalFourShell.support ∩
                SelectedClass D.A S.oppApex2 P.rho :=
          Finset.mem_inter.mpr
            ⟨((lateFirstApexSystem R).selectedAt
                packet.xu hxuA).toCriticalFourShell.q_mem_support,
              hxuClass⟩
        have hxvXuInter :
            packet.xv ∈
              ((lateFirstApexSystem R).selectedAt
                  packet.xu hxuA).toCriticalFourShell.support ∩
                SelectedClass D.A S.oppApex2 P.rho :=
          Finset.mem_inter.mpr ⟨hxvXuRow, hxvClass⟩
        have hvNotXuRow :
            P.v.1 ∉
              ((lateFirstApexSystem R).selectedAt
                packet.xu hxuA).toCriticalFourShell.support := by
          intro h
          exact
            third_not_mem_of_card_le_two hcardXu hxuOwnInter hxvXuInter
              hxuNeXv hxuNeV hvNeXv.symm
              (Finset.mem_inter.mpr ⟨h, P.hvClass⟩)
        have hdeletedNotXuRow :
            P.jointDeletion.deleted.1 ∉
              ((lateFirstApexSystem R).selectedAt
                packet.xu hxuA).toCriticalFourShell.support := by
          intro h
          exact
            third_not_mem_of_card_le_two hcardXu hxuOwnInter hxvXuInter
              hxuNeXv hdeletedNeXu.symm hdeletedNeXv.symm
              (Finset.mem_inter.mpr
                ⟨h, P.jointDeletion.deleted_mem_class⟩)
        have hxuNotVRow :
            packet.xu ∉
              ((lateFirstApexSystem R).selectedAt
                P.v.1 P.v.2).toCriticalFourShell.support := by
          intro h
          have hmem :
              packet.xu ∈
                ((lateFirstApexSystem R).selectedAt
                    P.v.1 P.v.2).toCriticalFourShell.support ∩
                  SelectedClass D.A S.oppApex2 P.rho :=
            Finset.mem_inter.mpr ⟨h, hxuClass⟩
          rw [packet.opposite_row_trace] at hmem
          simp only [Finset.mem_insert, Finset.mem_singleton] at hmem
          rcases hmem with h1 | h1
          · exact hxuNeV h1
          · exact hxuNeXv h1
        have hblockersNeVXu :
            (lateFirstApexSystem R).centerAt P.v.1 P.v.2 ≠
              (lateFirstApexSystem R).centerAt packet.xu hxuA := by
          intro hcenters
          have hsupports :=
            ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
              (lateFirstApexSystem R) P.v.2 hxuA hcenters
          apply hvNotXuRow
          rw [← hsupports]
          exact
            ((lateFirstApexSystem R).selectedAt
              P.v.1 P.v.2).toCriticalFourShell.q_mem_support
        rcases
            exactFourMutualOmissionJointDeletion_of_prescribed
              R P.surface P.rho P.v ⟨packet.xu, hxuA⟩ P.u
                P.huClass P.huOmitted huXuRow hblockersNeVXu with
          ⟨first, hfirst⟩
        rcases
            exactFourMutualOmissionJointDeletion_of_prescribed
              R P.surface P.rho P.v ⟨packet.xu, hxuA⟩
                P.jointDeletion.deleted
                P.jointDeletion.deleted_mem_class
                P.jointDeletion.deleted_not_mem_vRow
                hdeletedNotXuRow hblockersNeVXu with
          ⟨second, hsecond2⟩
        have hdeletionsNe : first.deleted ≠ second.deleted := by
          intro h
          exact
            P.jointDeletion.deleted_ne_u
              ((hfirst.symm.trans (h.trans hsecond2)).symm)
        exact
          false_of_twoDistinctExactFourMutualOmissionJointDeletions
            R P.hcard P.surface P.rho P.hrho P.hfive
              P.v ⟨packet.xu, hxuA⟩
              (by
                intro hpair
                exact hxuNeV (congrArg Subtype.val hpair).symm)
              P.hvClass hxuClass
              hxuNotVRow hvNotXuRow
              first second hdeletionsNe
      · by_cases hvXuRow :
            P.v.1 ∈
              ((lateFirstApexSystem R).selectedAt
                packet.xu hxuA).toCriticalFourShell.support
        · exact
            false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_vXuRow
              P packet hsecond hxuA hxvA huXvRow huXuRow hxvXuRow
                hvXuRow
        · by_cases hdeletedXuRow :
              P.jointDeletion.deleted.1 ∈
                ((lateFirstApexSystem R).selectedAt
                  packet.xu hxuA).toCriticalFourShell.support
          · exact
              false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_deletedXuRow
                P packet hsecond hxuA hxvA huXvRow huXuRow hxvXuRow
                  hdeletedXuRow
          · -- Empty second `xu`-row class slot: two prescribed joint
            -- deletions for the mutually omitted pair `(xu, xv)`.
            have hblockersNeXuXv :
                (lateFirstApexSystem R).centerAt packet.xu hxuA ≠
                  (lateFirstApexSystem R).centerAt packet.xv hxvA := by
              intro hcenters
              have hsupports :=
                ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
                  (lateFirstApexSystem R) hxuA hxvA hcenters
              apply hxvXuRow
              rw [hsupports]
              exact
                ((lateFirstApexSystem R).selectedAt
                  packet.xv hxvA).toCriticalFourShell.q_mem_support
            rcases
                exactFourMutualOmissionJointDeletion_of_prescribed
                  R P.surface P.rho ⟨packet.xu, hxuA⟩ ⟨packet.xv, hxvA⟩
                    P.v P.hvClass hvXuRow hvNotXvRow
                    hblockersNeXuXv with
              ⟨first, hfirst⟩
            rcases
                exactFourMutualOmissionJointDeletion_of_prescribed
                  R P.surface P.rho ⟨packet.xu, hxuA⟩ ⟨packet.xv, hxvA⟩
                    P.jointDeletion.deleted
                    P.jointDeletion.deleted_mem_class
                    hdeletedXuRow hdeletedNotXvRow
                    hblockersNeXuXv with
              ⟨second, hsecond2⟩
            have hdeletionsNe : first.deleted ≠ second.deleted := by
              intro h
              exact
                P.jointDeletion.deleted_ne_v
                  ((hfirst.symm.trans (h.trans hsecond2)).symm)
            exact
              false_of_twoDistinctExactFourMutualOmissionJointDeletions
                R P.hcard P.surface P.rho P.hrho P.hfive
                  ⟨packet.xu, hxuA⟩ ⟨packet.xv, hxvA⟩
                  (by
                    intro hpair
                    exact hxuNeXv (congrArg Subtype.val hpair))
                  hxuClass hxvClass
                  hxvXuRow hxuNotXvRow
                  first second hdeletionsNe
  · -- `u` is outside the `xv` row: prescribed-deletion dispatcher.
    by_cases hxuXvRow :
        packet.xu ∈
          ((lateFirstApexSystem R).selectedAt
            packet.xv hxvA).toCriticalFourShell.support
    · -- The `xv`-row class trace is `{xv, xu}`: `v` and the rigid deleted
      -- point are both outside, so the two-deletion terminal applies.
      have hxuXvInter :
          packet.xu ∈
            ((lateFirstApexSystem R).selectedAt
                packet.xv hxvA).toCriticalFourShell.support ∩
              SelectedClass D.A S.oppApex2 P.rho :=
        Finset.mem_inter.mpr ⟨hxuXvRow, hxuClass⟩
      have hvNotXvRow :
          P.v.1 ∉
            ((lateFirstApexSystem R).selectedAt
              packet.xv hxvA).toCriticalFourShell.support := by
        intro h
        exact
          third_not_mem_of_card_le_two hcardXv hxvOwnInter hxuXvInter
            hxuNeXv.symm hvNeXv.symm hxuNeV
            (Finset.mem_inter.mpr ⟨h, P.hvClass⟩)
      have hdeletedNotXvRow :
          P.jointDeletion.deleted.1 ∉
            ((lateFirstApexSystem R).selectedAt
              packet.xv hxvA).toCriticalFourShell.support := by
        intro h
        exact
          third_not_mem_of_card_le_two hcardXv hxvOwnInter hxuXvInter
            hxuNeXv.symm hdeletedNeXv.symm hdeletedNeXu.symm
            (Finset.mem_inter.mpr
              ⟨h, P.jointDeletion.deleted_mem_class⟩)
      exact
        false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_uXvMutualOmission_twoDeletions
          P packet hxvA huXvRow hvNotXvRow hdeletedNotXvRow
    · by_cases hvXvRow :
          P.v.1 ∈
            ((lateFirstApexSystem R).selectedAt
              packet.xv hxvA).toCriticalFourShell.support
      · have hvXvInter :
            P.v.1 ∈
              ((lateFirstApexSystem R).selectedAt
                  packet.xv hxvA).toCriticalFourShell.support ∩
                SelectedClass D.A S.oppApex2 P.rho :=
          Finset.mem_inter.mpr ⟨hvXvRow, P.hvClass⟩
        have hxuNotXvRow :
            packet.xu ∉
              ((lateFirstApexSystem R).selectedAt
                packet.xv hxvA).toCriticalFourShell.support := by
          intro h
          exact
            third_not_mem_of_card_le_two hcardXv hxvOwnInter hvXvInter
              hvNeXv.symm hxuNeXv.symm hxuNeV.symm
              (Finset.mem_inter.mpr ⟨h, hxuClass⟩)
        exact
          false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_uXvMutualOmission_vXvRow_direct
            P packet hxvA huXvRow hxuNotXvRow hvXvRow
      · by_cases hdeletedXvRow :
            P.jointDeletion.deleted.1 ∈
              ((lateFirstApexSystem R).selectedAt
                packet.xv hxvA).toCriticalFourShell.support
        · have hdeletedXvInter :
              P.jointDeletion.deleted.1 ∈
                ((lateFirstApexSystem R).selectedAt
                    packet.xv hxvA).toCriticalFourShell.support ∩
                  SelectedClass D.A S.oppApex2 P.rho :=
            Finset.mem_inter.mpr
              ⟨hdeletedXvRow, P.jointDeletion.deleted_mem_class⟩
          have hxuNotXvRow :
              packet.xu ∉
                ((lateFirstApexSystem R).selectedAt
                  packet.xv hxvA).toCriticalFourShell.support := by
            intro h
            exact
              third_not_mem_of_card_le_two hcardXv hxvOwnInter
                hdeletedXvInter hdeletedNeXv.symm hxuNeXv.symm
                hdeletedNeXu
                (Finset.mem_inter.mpr ⟨h, hxuClass⟩)
          exact
            false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_uXvMutualOmission_deletedXvRow_direct
              P packet hxvA huXvRow hxuNotXvRow hdeletedXvRow
        · exact
            false_of_exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_uXvMutualOmission_twoDeletions
              P packet hxvA huXvRow hvXvRow hdeletedXvRow

/-- Source-row-heavy arm of the cross-row blocker branch.  This arm is
strictly narrower than its parent: both points of the rigid source row are
fixed in the strict physical-cap interior. -/
theorem false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRowOther_sourceRowHeavy
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (_hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho)
    (_hblockerNeV :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1)
    (hsourceRowHeavy : P.sourceRowInteriorCount = 2) :
    False := by
  classical
  let packet :=
    exactFourRigid221_sourceEqU_blockerVRowOther_sourceHeavyPacket
      P _hblockerVRow _hblockerNeV hsourceRowHeavy
  have hxvInterior :=
    exactFourRigid221_sourceHeavy_xv_mem_secondCapInterior P packet
  cases exactFourRigid221_sourceHeavyOtherXv_capProfile P with
  | secondOppositeLarge hsecond _ _ =>
      exact
        false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge
          P packet hsecond
  | secondOppositeExactFiveSurplusGrowth hsecond hinterior hsurplus
      hbudget hten =>
      exact
        false_of_exactFourRigid221_sourceHeavyOtherXv_exactFiveSurplusGrowth
          P _hblockerVRow _hblockerNeV packet
            (exactFourRigid221_sourceHeavy_exactFive_other_eq_xv
              P packet hxvInterior hinterior)
            hsecond hinterior hsurplus hbudget hten
  | secondOppositeExactFiveFirstGrowth hsecond hinterior hfirst hbudget =>
      exact
        false_of_exactFourRigid221_sourceHeavyOtherXv_exactFiveFirstGrowth
          P _hblockerVRow _hblockerNeV packet
            (exactFourRigid221_sourceHeavy_exactFive_other_eq_xv
              P packet hxvInterior hinterior)
            hsecond hinterior hfirst hbudget

/-- Exact source-equals-`u` leaf where the actual source blocker is the
non-`v` member of the rigid two-point `v` block.  The two sequential count
splits are exhaustive.  Its non-source-heavy branches delegate to the same
membership-based terminals as the blocker-`v` coordinator. -/
theorem false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRowOther
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho)
    (hblockerNeV :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1) :
    False := by
  by_cases hsource : P.sourceRowInteriorCount = 2
  · exact
      false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRowOther_sourceRowHeavy
        P hblockerVRow hblockerNeV hsource
  · by_cases hopposite : P.oppositeRowInteriorCount = 2
    · exact
        false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRow_oppositeRowHeavy
          P hblockerVRow hsource hopposite
    · exact
        false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRow_sparseRows
          P hblockerVRow hsource hopposite

/-- Physical-apex finite coordinator with `u` equal to the retained
contextual source.  The checked placement split leaves exactly the
distinguished deletion, `v`, and the other point of the two-point `v` block.
-/
theorem false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU
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
    (_huSource : u = source)
    (_hsourceBlockerPlacement :
      (lateFirstApexSystem R).centerAt source.1 source.2 =
          jointDeletion.deleted.1 ∨
        (lateFirstApexSystem R).centerAt source.1 source.2 ∈
          ((lateFirstApexSystem R).selectedAt
              v.1 v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 rho) :
    False := by
  let P : ExactFourRigid221PhysicalApexSourceEqUContext R :=
    { hcard := _hcard
      surface := surface
      rho := rho
      source := source
      other := other
      hrho := _hrho
      hfive := _hfive
      u := u
      v := v
      huNeV := _huNeV
      huClass := _huClass
      hvClass := _hvClass
      hvOmitted := _hvOmitted
      huOmitted := _huOmitted
      context := _context
      jointDeletion := jointDeletion
      hclassFive := _hclassFive
      globalDeletion := globalDeletion
      hcenter := _hcenter
      hsourceBlockerClass := _hsourceBlockerClass
      huSource := _huSource }
  rcases _hsourceBlockerPlacement with hdeleted | hvRow
  · exact
      false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerDeleted
        P (by simpa [P] using hdeleted)
  · by_cases hv :
      (lateFirstApexSystem R).centerAt source.1 source.2 = v.1
    · exact
        false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV
          P (by simpa [P] using hv)
    · exact
        false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRowOther
          P (by simpa [P] using hvRow) (by simpa [P] using hv)

end ATailFrontierLiveClosure
end Problem97
