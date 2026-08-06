/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Placement

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

/-- Pentagon blocker leaf: the `xv`-row blocker is the opposite source `v`.
Narrowing over the parent pentagon: the blocker is pinned to a named class
point, which also puts `v` in the strict second-cap interior via the
parent-proved blocker localization, and `v` is therefore equidistant from
the pinned edge `{xv, u}` while being off the `xv` row.  This is the
rotationally continued five-cycle: `centerAt u = xv` and
`centerAt xv = v` both send a row source to its cycle predecessor. -/
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
  sorry

/-- Pentagon blocker leaf: the `xv`-row blocker is a strict-interior
carrier point OFF the physical class circle.  Narrowing over the parent
pentagon: the parent-proved interior localization of that blocker, the
off-class certificate, and the five-cycle class traces of the `xv` row
(exactly `{xv, u}`) and of the `xu` row (exactly `{xu, deleted}`).  The
on-class alternatives are all discharged by the parent: `u` and `xv` by
row incidence, `xu` by the equilateral convex-hull kill, and `deleted`
and `v` by the two sibling blocker leaves. -/
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
  sorry

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
