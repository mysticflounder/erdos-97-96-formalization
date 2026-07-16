/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import F1F3Handler
import RTwoOffLiveHandler
import CapFiveApexRigidity

/-!
# Scratch: exact outcome reduction for the F1/F3 outside source

`F1F3Handler` produces one exact off-live source in the retained second-apex
row.  Its transition has two outcomes:

* a successor common-deletion packet at that source; or
* a prescribed critical shell at the physical second apex, with support equal
  to the retained second row.

The critical outcome already has a checked consumer: reciprocal reorientation
turns it into the existing swapped first-apex unique-card-four frontier.  This
file classifies the only remaining outcome, the successor, without weakening
its source or row roles.

At the second apex the successor either reuses the retained radius, producing
an ambient radius class of cardinality at least five, or uses a distinct
radius.  In the latter case the selected supports are disjoint, their strict
second-cap parts contain at least four points in total, and full cap geometry
forces `oppCap2.card ≥ 6`.

This is a checked residual reduction, not an unconditional contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF1F3OutcomeReductionScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailBlockerDistinctRadiusScratch
open ATailCommonDeletionCriticalExpansionScratch
open ATailContinuationBankMatchScratch
open ATailCriticalPairFrontier
open ATailFullGeometryProducerScratch
open ATailRF1F3HandlerScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRParentDangerousRowCouplingScratch
open ATailRReciprocalSwapReductionScratch
open ATailRTwoOffLiveHandlerScratch
open ATailRTwoOffLiveFailureScratch

attribute [local instance] Classical.propDecidable

private theorem oppApex2_eq_oppositeVertex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppositeVertexByIndex, hi]

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- Forget only the transition wrapper: the F1/F3 source has exactly the
off-live second-row fields expected by the existing successor classifier. -/
def toOffLiveSecondRowFreshSource
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2}
    (X : SingleOutsideSourceTransition S W C) :
    OffLiveSecondRowFreshSource W C where
  source := X.source
  not_mem_live := X.source_not_mem_live
  mem_secondRow := X.source_mem_secondRow

/-- The prescribed-critical arm is not a new residual: it reorients to the
already exposed swapped first-apex unique-card-four frontier. -/
inductive SingleOutsideReducedOutcome
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (X : SingleOutsideSourceTransition S W C) : Type
  | successor
      (next : OffLiveCommonDeletionSuccessor W C) :
      SingleOutsideReducedOutcome S W C X
  | swappedFirstApexUniqueFour
      (critical :
        PrescribedCriticalAt D X.source.point S.oppApex2)
      (support_eq_secondRow :
        critical.shell.toCriticalFourShell.support = C.B₂)
      (terminal :
        Nonempty (SwappedFirstApexUniqueFourFrontier D S W.H)) :
      SingleOutsideReducedOutcome S W C X

/-- Consume the critical arm and classify any successor with the exact
off-live source retained. -/
def reduceSingleOutsideSourceOutcome
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2}
    {X : SingleOutsideSourceTransition S W C}
    (O : SingleOutsideSourceOutcome S W C X) :
    SingleOutsideReducedOutcome S W C X := by
  cases O with
  | successor packet =>
    exact SingleOutsideReducedOutcome.successor
      (OffLiveCommonDeletionSuccessor.ofPacket
        (toOffLiveSecondRowFreshSource X) packet)
  | secondApexCritical critical support_eq =>
    exact SingleOutsideReducedOutcome.swappedFirstApexUniqueFour
      critical support_eq
      (secondApexCritical_reorients_to_firstApexUniqueFour
        critical.shell critical.blocks)

/-- A selected q-deleted second row supplies four ambient points at its exact
radius. -/
private theorem secondRow_selectedClass_card_ge_four
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket
      D H deleted center₁ center₂) :
    4 ≤ (SelectedClass D.A center₂ C.row₂.radius).card := by
  have hsubset :
      C.B₂ ⊆ SelectedClass D.A center₂ C.row₂.radius := by
    intro z hz
    exact mem_selectedClass.mpr
      ⟨(Finset.mem_erase.mp
          (Finset.mem_erase.mp (C.row₂.subset hz)).2).2,
        C.row₂.same_radius z hz⟩
  calc
    4 = C.B₂.card := C.B₂_card.symm
    _ ≤ (SelectedClass D.A center₂ C.row₂.radius).card :=
      Finset.card_le_card hsubset

/-- Full geometry attached to the successor's exact radius split.  The
alternate-radius arm records both the row-level disjointness and its cap-level
growth consequence. -/
inductive SingleOutsideSuccessorGeometry
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (_cap : SecondApexRowCapProfile S C)
    (next : OffLiveCommonDeletionSuccessor W C) : Prop
  | sameRadiusOverflow
      (radius_eq :
        next.packet.row₂.radius = C.row₂.radius)
      (five_on_radius :
        5 ≤
          (SelectedClass D.A S.oppApex2
            next.packet.row₂.radius).card) :
      SingleOutsideSuccessorGeometry S W C _cap next
  | alternateRadius
      (radius_ne :
        next.packet.row₂.radius ≠ C.row₂.radius)
      (supports_disjoint :
        Disjoint C.B₂ next.packet.B₂)
      (strict_union_card_ge_four :
        4 ≤
          ((C.B₂ ∩ strictSecondCap S) ∪
            (next.packet.B₂ ∩ strictSecondCap S)).card)
      (oppCap2_card_ge_six :
        6 ≤ S.oppCap2.card) :
      SingleOutsideSuccessorGeometry S W C _cap next

/-- Two distinct successor radii at the physical second apex force the
opposite cap to have cardinality at least six. -/
theorem successor_alternateRadius_oppCap2_card_ge_six
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (next : OffLiveCommonDeletionSuccessor W C)
    (hradius :
      next.packet.row₂.radius ≠ C.row₂.radius) :
    6 ≤ S.oppCap2.card := by
  have hcenter :
      S.oppApex2 =
        S.oppositeVertexByIndex S.oppIndex2 :=
    oppApex2_eq_oppositeVertex_oppIndex2 S
  have hnext :
      4 ≤
        (SelectedClass D.A
          (S.oppositeVertexByIndex S.oppIndex2)
          next.packet.row₂.radius).card := by
    simpa only [← hcenter] using
      secondRow_selectedClass_card_ge_four next.packet
  have hold :
      4 ≤
        (SelectedClass D.A
          (S.oppositeVertexByIndex S.oppIndex2)
          C.row₂.radius).card := by
    simpa only [← hcenter] using
      secondRow_selectedClass_card_ge_four C
  have hraw :
      6 ≤ (S.capByIndex S.oppIndex2).card :=
    oppositeVertex_distinct_K4_radii_force_cap_card_ge_six
      S D.convex S.oppIndex2
      next.packet.row₂.radius_pos C.row₂.radius_pos
      hnext hold hradius
  simpa only [capByIndex_oppIndex2_eq_oppCap2] using hraw

/-- Construct the exact geometric successor residual. -/
theorem singleOutsideSuccessorGeometry
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (cap : SecondApexRowCapProfile S C)
    (next : OffLiveCommonDeletionSuccessor W C) :
    SingleOutsideSuccessorGeometry S W C cap next := by
  rcases next.secondApexShape with
    ⟨radius_eq, five_on_radius⟩ |
      ⟨radius_ne, supports_disjoint⟩
  · exact SingleOutsideSuccessorGeometry.sameRadiusOverflow
      radius_eq five_on_radius
  · let nextCap : SecondApexRowCapProfile S next.packet :=
      secondApexRow_to_capProfile S next.packet
    have hinter :
        Disjoint
          (C.B₂ ∩ strictSecondCap S)
          (next.packet.B₂ ∩ strictSecondCap S) :=
      supports_disjoint.mono
        Finset.inter_subset_left Finset.inter_subset_left
    have hunion :
        4 ≤
          ((C.B₂ ∩ strictSecondCap S) ∪
            (next.packet.B₂ ∩ strictSecondCap S)).card := by
      rw [Finset.card_union_of_disjoint hinter]
      have hold := cap.strict_second_cap_card_ge_two
      have hnext := nextCap.strict_second_cap_card_ge_two
      omega
    exact SingleOutsideSuccessorGeometry.alternateRadius
      radius_ne supports_disjoint hunion
      (successor_alternateRadius_oppCap2_card_ge_six
        S W C next radius_ne)

/-- On a cap of cardinality at most five, the alternate-radius successor is
impossible.  The exact residual is therefore the same-radius class of
cardinality at least five. -/
theorem successor_sameRadiusOverflow_of_oppCap2_card_le_five
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (cap : SecondApexRowCapProfile S C)
    (next : OffLiveCommonDeletionSuccessor W C)
    (hcap : S.oppCap2.card ≤ 5) :
    next.packet.row₂.radius = C.row₂.radius ∧
      5 ≤
        (SelectedClass D.A S.oppApex2
          next.packet.row₂.radius).card := by
  rcases singleOutsideSuccessorGeometry S W C cap next with
    ⟨radius_eq, five_on_radius⟩ |
      ⟨_radius_ne, _supports_disjoint,
        _strict_union_card_ge_four, oppCap2_card_ge_six⟩
  · exact ⟨radius_eq, five_on_radius⟩
  · omega

private noncomputable def counterexampleWithPacket
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    CounterexampleData := {
  A := D.A
  nonempty := D.nonempty
  convex := D.convex
  K4 := D.K4
  packet := S }

private theorem transportedPacket_oppApex1
    {A B : Finset ℝ²} (h : A = B) (S : SurplusCapPacket A) :
    (h ▸ S).oppApex1 = S.oppApex1 := by
  subst B
  rfl

private theorem transportedPacket_oppApex2
    {A B : Finset ℝ²} (h : A = B) (S : SurplusCapPacket A) :
    (h ▸ S).oppApex2 = S.oppApex2 := by
  subst B
  rfl

private theorem transportedPacket_oppCap1
    {A B : Finset ℝ²} (h : A = B) (S : SurplusCapPacket A) :
    (h ▸ S).oppCap1 = S.oppCap1 := by
  subst B
  rfl

private theorem transportedPacket_oppCap2
    {A B : Finset ℝ²} (h : A = B) (S : SurplusCapPacket A) :
    (h ▸ S).oppCap2 = S.oppCap2 := by
  subst B
  rfl

private theorem transportedPacket_surplusCap
    {A B : Finset ℝ²} (h : A = B) (S : SurplusCapPacket A) :
    (h ▸ S).surplusCap = S.surplusCap := by
  subst B
  rfl

private theorem frontier_pair_q_mem_firstClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) :
    F.pair.q ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases Finset.mem_sdiff.mp F.pair.q_mem_marginal with
    ⟨hqFilter, _⟩
  rcases Finset.mem_filter.mp hqFilter with ⟨hqA, hqRadius⟩
  exact mem_selectedClass.mpr
    ⟨hqA, by simpa only [dist_comm] using hqRadius⟩

private theorem frontier_pair_w_mem_firstClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) :
    F.pair.w ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases Finset.mem_sdiff.mp F.pair.w_mem_marginal with
    ⟨hwFilter, _⟩
  rcases Finset.mem_filter.mp hwFilter with ⟨hwA, hwRadius⟩
  exact mem_selectedClass.mpr
    ⟨hwA, by simpa only [dist_comm] using hwRadius⟩

/-- Removing the two frontier sources from a unique ambient class of
cardinality five leaves only three points at the unique K4 radius. -/
private theorem firstApexDouble_blocked_of_unique_card_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hcard :
      (SelectedClass D.A S.oppApex1 radius).card = 5)
    (hunique : ∀ tau : ℝ, 0 < tau →
      4 ≤ (SelectedClass D.A S.oppApex1 tau).card →
      tau = radius) :
    ¬ HasNEquidistantPointsAt 4
      ((D.A.erase F.pair.q).erase F.pair.w)
        S.oppApex1 := by
  rintro ⟨tau, htau, hfour⟩
  have hfourErased :
      4 ≤
        (SelectedClass
          ((D.A.erase F.pair.q).erase F.pair.w)
          S.oppApex1 tau).card := by
    simpa [SelectedClass] using hfour
  have hfourAmbient :
      4 ≤ (SelectedClass D.A S.oppApex1 tau).card := by
    rw [selectedClass_erase_eq, selectedClass_erase_eq] at hfourErased
    exact hfourErased.trans
      (Finset.card_le_card
        ((Finset.erase_subset _ _).trans
          (Finset.erase_subset _ _)))
  have htauEq : tau = radius :=
    hunique tau htau hfourAmbient
  subst tau
  have hwAfterQ :
      F.pair.w ∈
        (SelectedClass D.A S.oppApex1 radius).erase
          F.pair.q :=
    Finset.mem_erase.mpr
      ⟨F.pair.q_ne_w.symm,
        frontier_pair_w_mem_firstClass F⟩
  rw [selectedClass_erase_eq, selectedClass_erase_eq,
    Finset.card_erase_of_mem hwAfterQ,
    Finset.card_erase_of_mem
      (frontier_pair_q_mem_firstClass F),
    hcard] at hfourErased
  omega

/-- A fresh fixed-surplus swap frontier carrying exactly the protected
`FA-UNIQ5` data. -/
structure SwappedFirstApexUniqueFiveFrontier
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) : Type where
  packet : SurplusCapPacket D.A
  firstApex_eq : packet.oppApex1 = S.oppApex2
  secondApex_eq : packet.oppApex2 = S.oppApex1
  firstCap_eq : packet.oppCap1 = S.oppCap2
  secondCap_eq : packet.oppCap2 = S.oppCap1
  surplusCap_eq : packet.surplusCap = S.surplusCap
  radius : ℝ
  radius_pos : 0 < radius
  frontier : CriticalPairFrontier D packet radius H
  firstClass_card_eq_five :
    (SelectedClass D.A packet.oppApex1 radius).card = 5
  firstClass_unique_radius :
    ∀ tau : ℝ, 0 < tau →
      4 ≤ (SelectedClass D.A packet.oppApex1 tau).card →
      tau = radius
  firstApexDouble_blocked :
    ¬ HasNEquidistantPointsAt 4
      ((D.A.erase frontier.pair.q).erase frontier.pair.w)
        packet.oppApex1

/-- If the physical second opposite cap has cardinality five, every F1/F3
successor reorients to a fresh protected `FA-UNIQ5` frontier. -/
theorem successor_of_oppCap2_card_eq_five_reorients_to_FAUNIQ5
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (cap : SecondApexRowCapProfile S C)
    (next : OffLiveCommonDeletionSuccessor W C)
    (hcap : S.oppCap2.card = 5) :
    Nonempty (SwappedFirstApexUniqueFiveFrontier D S W.H) := by
  rcases
      successor_sameRadiusOverflow_of_oppCap2_card_le_five
        S W C cap next (by omega) with
    ⟨_radius_eq, five_on_radius⟩
  have hcapByIndex :
      (S.capByIndex S.oppIndex2).card = 5 := by
    simpa only [capByIndex_oppIndex2_eq_oppCap2] using hcap
  have hcenter :
      S.oppApex2 =
        S.oppositeVertexByIndex S.oppIndex2 :=
    oppApex2_eq_oppositeVertex_oppIndex2 S
  have hclass_le_five :
      (SelectedClass D.A S.oppApex2
        next.packet.row₂.radius).card ≤ 5 := by
    simpa only [← hcenter] using
      oppositeVertex_selectedClass_card_le_five_of_cap_card_eq_five
        S D.convex S.oppIndex2 hcapByIndex
        next.packet.row₂.radius_pos
  have hclass_eq_five :
      (SelectedClass D.A S.oppApex2
        next.packet.row₂.radius).card = 5 := by
    omega
  have huniquePhysical :
      ∀ tau : ℝ, 0 < tau →
        4 ≤ (SelectedClass D.A S.oppApex2 tau).card →
        tau = next.packet.row₂.radius := by
    intro tau htau hfour
    have hfour' :
        4 ≤
          (SelectedClass D.A
            (S.oppositeVertexByIndex S.oppIndex2) tau).card := by
      simpa only [← hcenter] using hfour
    have hnextFour :
        4 ≤
          (SelectedClass D.A
            (S.oppositeVertexByIndex S.oppIndex2)
            next.packet.row₂.radius).card := by
      have hnextFive :
          5 ≤
            (SelectedClass D.A
              (S.oppositeVertexByIndex S.oppIndex2)
              next.packet.row₂.radius).card := by
        simpa only [← hcenter] using five_on_radius
      omega
    exact oppositeVertex_K4_radius_unique_of_cap_card_eq_five
      S D.convex S.oppIndex2 hcapByIndex
      htau next.packet.row₂.radius_pos hfour' hnextFour
  let Dleaf := counterexampleWithPacket D S
  obtain ⟨Dsw, hswap⟩ :=
    exists_completeNonSurplusSwap Dleaf
  let Ssw : SurplusCapPacket D.A :=
    hswap.toNonSurplusSwap.carrier_eq ▸ Dsw.packet
  have hfirstApex : Ssw.oppApex1 = S.oppApex2 := by
    calc
      Ssw.oppApex1 = Dsw.packet.oppApex1 := by
        exact transportedPacket_oppApex1
          hswap.toNonSurplusSwap.carrier_eq Dsw.packet
      _ = Dleaf.packet.oppApex2 :=
        hswap.toNonSurplusSwap.oppApex1_eq
      _ = S.oppApex2 := rfl
  have hsecondApex : Ssw.oppApex2 = S.oppApex1 := by
    calc
      Ssw.oppApex2 = Dsw.packet.oppApex2 := by
        exact transportedPacket_oppApex2
          hswap.toNonSurplusSwap.carrier_eq Dsw.packet
      _ = Dleaf.packet.oppApex1 :=
        hswap.oppApex2_eq
      _ = S.oppApex1 := rfl
  have hfirstCap : Ssw.oppCap1 = S.oppCap2 := by
    calc
      Ssw.oppCap1 = Dsw.packet.oppCap1 := by
        exact transportedPacket_oppCap1
          hswap.toNonSurplusSwap.carrier_eq Dsw.packet
      _ = Dleaf.packet.oppCap2 :=
        hswap.toNonSurplusSwap.oppCap1_eq
      _ = S.oppCap2 := rfl
  have hsecondCap : Ssw.oppCap2 = S.oppCap1 := by
    calc
      Ssw.oppCap2 = Dsw.packet.oppCap2 := by
        exact transportedPacket_oppCap2
          hswap.toNonSurplusSwap.carrier_eq Dsw.packet
      _ = Dleaf.packet.oppCap1 :=
        hswap.toNonSurplusSwap.oppCap2_eq
      _ = S.oppCap1 := rfl
  have hsurplusCap : Ssw.surplusCap = S.surplusCap := by
    calc
      Ssw.surplusCap = Dsw.packet.surplusCap := by
        exact transportedPacket_surplusCap
          hswap.toNonSurplusSwap.carrier_eq Dsw.packet
      _ = Dleaf.packet.surplusCap :=
        hswap.toNonSurplusSwap.surplusCap_eq
      _ = S.surplusCap := rfl
  obtain ⟨radius, hradius, hfour, ⟨F⟩⟩ :=
    exists_criticalPairFrontier_of_K4 D Ssw W.H
  have hradiusEq :
      radius = next.packet.row₂.radius := by
    exact huniquePhysical radius hradius
      (by simpa only [hfirstApex] using hfour)
  have hcard :
      (SelectedClass D.A Ssw.oppApex1 radius).card = 5 := by
    simpa only [hfirstApex, hradiusEq] using hclass_eq_five
  have hunique :
      ∀ tau : ℝ, 0 < tau →
        4 ≤ (SelectedClass D.A Ssw.oppApex1 tau).card →
        tau = radius := by
    intro tau htau hfourTau
    have htauPhysical :
        tau = next.packet.row₂.radius :=
      huniquePhysical tau htau
        (by simpa only [hfirstApex] using hfourTau)
    exact htauPhysical.trans hradiusEq.symm
  exact ⟨{
    packet := Ssw
    firstApex_eq := hfirstApex
    secondApex_eq := hsecondApex
    firstCap_eq := hfirstCap
    secondCap_eq := hsecondCap
    surplusCap_eq := hsurplusCap
    radius := radius
    radius_pos := hradius
    frontier := F
    firstClass_card_eq_five := hcard
    firstClass_unique_radius := hunique
    firstApexDouble_blocked :=
      firstApexDouble_blocked_of_unique_card_five
        F hcard hunique
  }⟩

/-- Once the second opposite cap is known to be large, a successor has exactly
two endpoints: protected swapped `FA-UNIQ5` at cap five, or the explicit
cap-at-least-six residual. -/
inductive SuccessorFAUNIQ5OrLargeCap
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (_cap : SecondApexRowCapProfile S C)
    (_next : OffLiveCommonDeletionSuccessor W C) : Type
  | swappedFAUNIQ5
      (terminal :
        Nonempty
          (SwappedFirstApexUniqueFiveFrontier D S W.H)) :
      SuccessorFAUNIQ5OrLargeCap S W C _cap _next
  | oppCap2CardGeSix
      (large : 6 ≤ S.oppCap2.card) :
      SuccessorFAUNIQ5OrLargeCap S W C _cap _next

/-- Branch-complete successor endpoint under the parent two-large-cap fact. -/
def successor_FAUNIQ5_or_oppCap2_card_ge_six
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (cap : SecondApexRowCapProfile S C)
    (next : OffLiveCommonDeletionSuccessor W C)
    (hlarge : 5 ≤ S.oppCap2.card) :
    SuccessorFAUNIQ5OrLargeCap S W C cap next := by
  by_cases hsix : 6 ≤ S.oppCap2.card
  · exact SuccessorFAUNIQ5OrLargeCap.oppCap2CardGeSix hsix
  · have hfive : S.oppCap2.card = 5 := by omega
    exact SuccessorFAUNIQ5OrLargeCap.swappedFAUNIQ5
      (successor_of_oppCap2_card_eq_five_reorients_to_FAUNIQ5
        S W C cap next hfive)

/-- The exact common F1/F3 endpoint under the parent fact that `oppCap2` is a
large cap.  Both protected unique-radius arms are routed; the only new
residual is an exact successor packet over a cap of cardinality at least six. -/
inductive SingleOutsideProtectedOrLargeCapOutcome
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (cap : SecondApexRowCapProfile S C)
    (X : SingleOutsideSourceTransition S W C) : Type
  | swappedFAUNIQ4
      (critical :
        PrescribedCriticalAt D X.source.point S.oppApex2)
      (support_eq_secondRow :
        critical.shell.toCriticalFourShell.support = C.B₂)
      (terminal :
        Nonempty (SwappedFirstApexUniqueFourFrontier D S W.H)) :
      SingleOutsideProtectedOrLargeCapOutcome S W C cap X
  | swappedFAUNIQ5
      (next : OffLiveCommonDeletionSuccessor W C)
      (terminal :
        Nonempty
          (SwappedFirstApexUniqueFiveFrontier D S W.H)) :
      SingleOutsideProtectedOrLargeCapOutcome S W C cap X
  | oppCap2CardGeSix
      (next : OffLiveCommonDeletionSuccessor W C)
      (geometry :
        SingleOutsideSuccessorGeometry S W C cap next)
      (large : 6 ≤ S.oppCap2.card) :
      SingleOutsideProtectedOrLargeCapOutcome S W C cap X

/-- Reduce one complete outside-source producer to the protected unique-radius
lanes or the exact cap-at-least-six successor residual. -/
def singleOutsideSourceProducer_protectedOrLargeCapOutcome
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2}
    (cap : SecondApexRowCapProfile S C)
    (P : SingleOutsideSourceProducer S W C)
    (hlarge : 5 ≤ S.oppCap2.card) :
    SingleOutsideProtectedOrLargeCapOutcome
      S W C cap P.sourceData := by
  cases reduceSingleOutsideSourceOutcome P.outcome with
  | successor next =>
    have geometry :=
      singleOutsideSuccessorGeometry S W C cap next
    cases
        successor_FAUNIQ5_or_oppCap2_card_ge_six
          S W C cap next hlarge with
    | swappedFAUNIQ5 terminal =>
      exact
        SingleOutsideProtectedOrLargeCapOutcome.swappedFAUNIQ5
          next terminal
    | oppCap2CardGeSix large =>
      exact
        SingleOutsideProtectedOrLargeCapOutcome.oppCap2CardGeSix
          next geometry large
  | swappedFirstApexUniqueFour critical support_eq terminal =>
    exact
      SingleOutsideProtectedOrLargeCapOutcome.swappedFAUNIQ4
        critical support_eq terminal

/-- F1 reaches only protected `FA-UNIQ4`, protected `FA-UNIQ5`, or the
cap-at-least-six successor residual. -/
def f1SingleOutsideProtectedOrLargeCapOutcome
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (cap : SecondApexRowCapProfile S C)
    (failure :
      OneLiveOverlapFailureProfile deleted C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C))
    (hlarge : 5 ≤ S.oppCap2.card) :
    Nonempty
      (Σ X : SingleOutsideSourceTransition S W C,
        SingleOutsideProtectedOrLargeCapOutcome
          S W C cap X) := by
  rcases f1SingleOutsideSourceProducer S W C failure with ⟨P⟩
  exact ⟨⟨P.sourceData,
    singleOutsideSourceProducer_protectedOrLargeCapOutcome
      cap P hlarge⟩⟩

/-- F3 reaches the same protected-or-large-cap endpoint. -/
def f3SingleOutsideProtectedOrLargeCapOutcome
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (cap : SecondApexRowCapProfile S C)
    (failure :
      TwoLiveOneOffFailureProfile deleted C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C))
    (hlarge : 5 ≤ S.oppCap2.card) :
    Nonempty
      (Σ X : SingleOutsideSourceTransition S W C,
        SingleOutsideProtectedOrLargeCapOutcome
          S W C cap X) := by
  rcases f3SingleOutsideSourceProducer S W C failure with ⟨P⟩
  exact ⟨⟨P.sourceData,
    singleOutsideSourceProducer_protectedOrLargeCapOutcome
      cap P hlarge⟩⟩

/-- Final geometric reduction of the F1/F3 producer.  Its only open arm is a
radius-classified successor; the prescribed-critical arm is already routed to
the protected swapped `FA-UNIQ4` dependency. -/
inductive SingleOutsideGeometricOutcome
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (cap : SecondApexRowCapProfile S C)
    (X : SingleOutsideSourceTransition S W C) : Type
  | successor
      (next : OffLiveCommonDeletionSuccessor W C)
      (geometry :
        SingleOutsideSuccessorGeometry S W C cap next) :
      SingleOutsideGeometricOutcome S W C cap X
  | swappedFirstApexUniqueFour
      (critical :
        PrescribedCriticalAt D X.source.point S.oppApex2)
      (support_eq_secondRow :
        critical.shell.toCriticalFourShell.support = C.B₂)
      (terminal :
        Nonempty (SwappedFirstApexUniqueFourFrontier D S W.H)) :
      SingleOutsideGeometricOutcome S W C cap X

/-- Attach full second-cap geometry to a reduced F1/F3 outcome. -/
def reducedOutcome_withGeometry
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2}
    {X : SingleOutsideSourceTransition S W C}
    (cap : SecondApexRowCapProfile S C)
    (O : SingleOutsideReducedOutcome S W C X) :
    SingleOutsideGeometricOutcome S W C cap X := by
  cases O with
  | successor next =>
    exact SingleOutsideGeometricOutcome.successor
      next (singleOutsideSuccessorGeometry S W C cap next)
  | swappedFirstApexUniqueFour critical support_eq terminal =>
    exact SingleOutsideGeometricOutcome.swappedFirstApexUniqueFour
      critical support_eq terminal

/-- Reduce a complete source producer to the exact protected-or-successor
surface. -/
def singleOutsideSourceProducer_geometricOutcome
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2}
    (cap : SecondApexRowCapProfile S C)
    (P : SingleOutsideSourceProducer S W C) :
    SingleOutsideGeometricOutcome S W C cap P.sourceData :=
  reducedOutcome_withGeometry cap
    (reduceSingleOutsideSourceOutcome P.outcome)

/-- F1 reaches the common protected-or-successor geometric surface. -/
def f1SingleOutsideGeometricOutcome
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (cap : SecondApexRowCapProfile S C)
    (failure :
      OneLiveOverlapFailureProfile deleted C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C)) :
    Nonempty
      (Σ X : SingleOutsideSourceTransition S W C,
        SingleOutsideGeometricOutcome S W C cap X) := by
  rcases f1SingleOutsideSourceProducer S W C failure with ⟨P⟩
  exact ⟨⟨P.sourceData,
    singleOutsideSourceProducer_geometricOutcome cap P⟩⟩

/-- F3 reaches the same common protected-or-successor geometric surface. -/
def f3SingleOutsideGeometricOutcome
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (cap : SecondApexRowCapProfile S C)
    (failure :
      TwoLiveOneOffFailureProfile deleted C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C)) :
    Nonempty
      (Σ X : SingleOutsideSourceTransition S W C,
        SingleOutsideGeometricOutcome S W C cap X) := by
  rcases f3SingleOutsideSourceProducer S W C failure with ⟨P⟩
  exact ⟨⟨P.sourceData,
    singleOutsideSourceProducer_geometricOutcome cap P⟩⟩

#print axioms reduceSingleOutsideSourceOutcome
#print axioms successor_alternateRadius_oppCap2_card_ge_six
#print axioms singleOutsideSuccessorGeometry
#print axioms successor_sameRadiusOverflow_of_oppCap2_card_le_five
#print axioms successor_of_oppCap2_card_eq_five_reorients_to_FAUNIQ5
#print axioms successor_FAUNIQ5_or_oppCap2_card_ge_six
#print axioms singleOutsideSourceProducer_protectedOrLargeCapOutcome
#print axioms f1SingleOutsideProtectedOrLargeCapOutcome
#print axioms f3SingleOutsideProtectedOrLargeCapOutcome
#print axioms singleOutsideSourceProducer_geometricOutcome
#print axioms f1SingleOutsideGeometricOutcome
#print axioms f3SingleOutsideGeometricOutcome

end ATailRF1F3OutcomeReductionScratch
end Problem97
