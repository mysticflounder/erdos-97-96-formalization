/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CriticalPairFrontierSwapAudit
import ReciprocalSecondApexRadiusConsumer

/-!
# Reciprocal critical arm as a swapped first-apex unique-four frontier

The critical endpoint of the reciprocal directed-cross branch is already an
exact ambient four-point row at the physical second apex, and prescribed
deletion failure makes its radius the unique positive four-capable radius
there.  The fixed-surplus non-surplus swap makes that physical point the first
apex.  A fresh critical-pair frontier for the swapped packet therefore lands
in the exact first-apex unique-card-four branch.

The fresh frontier cannot reuse the old ordered pair; that impossibility is
proved in `CriticalPairFrontierSwapAudit`.  No such pair transport is needed
for this reduction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRReciprocalSwapReductionScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailBlockerDistinctRadiusScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.ReciprocalDirectedCrossResidual
open ATailRReciprocalBankConsumerScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

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

/-- A fresh frontier after swapping the non-surplus roles, together with the
exact data identifying it as the first-apex unique-card-four branch. -/
structure SwappedFirstApexUniqueFourFrontier
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
  firstClass_card_eq_four :
    (SelectedClass D.A packet.oppApex1 radius).card = 4
  firstClass_unique_radius :
    ∀ tau : ℝ, 0 < tau →
      4 ≤ (SelectedClass D.A packet.oppApex1 tau).card →
      tau = radius
  firstApexDouble_blocked :
    ¬ HasNEquidistantPointsAt 4
      ((D.A.erase frontier.pair.q).erase frontier.pair.w)
        packet.oppApex1

private theorem pair_q_mem_firstClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) :
    F.pair.q ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases Finset.mem_sdiff.mp F.pair.q_mem_marginal with ⟨hqFilter, _⟩
  rcases Finset.mem_filter.mp hqFilter with ⟨hqA, hqRadius⟩
  exact mem_selectedClass.mpr
    ⟨hqA, by simpa only [dist_comm] using hqRadius⟩

private theorem pair_w_mem_firstClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) :
    F.pair.w ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases Finset.mem_sdiff.mp F.pair.w_mem_marginal with ⟨hwFilter, _⟩
  rcases Finset.mem_filter.mp hwFilter with ⟨hwA, hwRadius⟩
  exact mem_selectedClass.mpr
    ⟨hwA, by simpa only [dist_comm] using hwRadius⟩

private theorem firstApexDouble_blocked_of_unique_card_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hcard : (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hunique : ∀ tau : ℝ, 0 < tau →
      4 ≤ (SelectedClass D.A S.oppApex1 tau).card →
      tau = radius) :
    ¬ HasNEquidistantPointsAt 4
      ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1 := by
  rintro ⟨tau, htau, hfour⟩
  have hfourErased :
      4 ≤ (SelectedClass ((D.A.erase F.pair.q).erase F.pair.w)
        S.oppApex1 tau).card := by
    simpa [SelectedClass] using hfour
  have hfourAmbient :
      4 ≤ (SelectedClass D.A S.oppApex1 tau).card := by
    rw [selectedClass_erase_eq, selectedClass_erase_eq] at hfourErased
    exact hfourErased.trans
      (Finset.card_le_card
        ((Finset.erase_subset _ _).trans (Finset.erase_subset _ _)))
  have htauEq : tau = radius := hunique tau htau hfourAmbient
  subst tau
  have hwAfterQ :
      F.pair.w ∈
        (SelectedClass D.A S.oppApex1 radius).erase F.pair.q :=
    Finset.mem_erase.mpr
      ⟨F.pair.q_ne_w.symm, pair_w_mem_firstClass F⟩
  rw [selectedClass_erase_eq, selectedClass_erase_eq,
    Finset.card_erase_of_mem hwAfterQ,
    Finset.card_erase_of_mem (pair_q_mem_firstClass F),
    hcard] at hfourErased
  omega

/-- Any prescribed critical row at the physical second apex becomes a fresh
first-apex unique-card-four frontier after the fixed-surplus swap. -/
theorem secondApexCritical_reorients_to_firstApexUniqueFour
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {z : ℝ²}
    (C : CriticalSelectedFourClass D.A z S.oppApex2)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase z) S.oppApex2) :
    Nonempty (SwappedFirstApexUniqueFourFrontier D S H) := by
  let Dleaf := counterexampleWithPacket D S
  obtain ⟨Dsw, hswap⟩ := exists_completeNonSurplusSwap Dleaf
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
      _ = Dleaf.packet.oppApex1 := hswap.oppApex2_eq
      _ = S.oppApex1 := rfl
  have hfirstCap : Ssw.oppCap1 = S.oppCap2 := by
    calc
      Ssw.oppCap1 = Dsw.packet.oppCap1 := by
        exact transportedPacket_oppCap1
          hswap.toNonSurplusSwap.carrier_eq Dsw.packet
      _ = Dleaf.packet.oppCap2 := hswap.toNonSurplusSwap.oppCap1_eq
      _ = S.oppCap2 := rfl
  have hsecondCap : Ssw.oppCap2 = S.oppCap1 := by
    calc
      Ssw.oppCap2 = Dsw.packet.oppCap2 := by
        exact transportedPacket_oppCap2
          hswap.toNonSurplusSwap.carrier_eq Dsw.packet
      _ = Dleaf.packet.oppCap1 := hswap.toNonSurplusSwap.oppCap2_eq
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
    exists_criticalPairFrontier_of_K4 D Ssw H
  have hradiusEq : radius = C.toCriticalFourShell.radius := by
    apply criticalRadius_unique_of_blocked C hblocked hradius
    simpa only [hfirstApex] using hfour
  have hcriticalCard :
      (SelectedClass D.A S.oppApex2
        C.toCriticalFourShell.radius).card = 4 := by
    simpa [SelectedClass, C.toCriticalFourShell.support_eq] using
      C.toCriticalFourShell.support_card
  have hcard :
      (SelectedClass D.A Ssw.oppApex1 radius).card = 4 := by
    simpa only [hfirstApex, hradiusEq] using hcriticalCard
  have hunique :
      ∀ tau : ℝ, 0 < tau →
        4 ≤ (SelectedClass D.A Ssw.oppApex1 tau).card →
        tau = radius := by
    intro tau htau hfourTau
    have htauCritical :
        tau = C.toCriticalFourShell.radius :=
      criticalRadius_unique_of_blocked C hblocked htau (by
        simpa only [hfirstApex] using hfourTau)
    exact htauCritical.trans hradiusEq.symm
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
    firstClass_card_eq_four := hcard
    firstClass_unique_radius := hunique
    firstApexDouble_blocked :=
      firstApexDouble_blocked_of_unique_card_four F hcard hunique
  }⟩

/-- Reciprocal-branch specialization.  The critical alternative is not a new
distinct-radius producer obligation: it is a swapped `FA-UNIQ4` frontier. -/
theorem reciprocalCriticalArm_reorients_to_firstApexUniqueFour
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {fixedRadius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A fixedRadius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (_X : ReciprocalDirectedCrossResidual R)
    {z : ℝ²}
    (C : CriticalSelectedFourClass D.A z S.oppApex2)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase z) S.oppApex2) :
    Nonempty (SwappedFirstApexUniqueFourFrontier D S H) :=
  secondApexCritical_reorients_to_firstApexUniqueFour C hblocked

#print axioms firstApexDouble_blocked_of_unique_card_four
#print axioms secondApexCritical_reorients_to_firstApexUniqueFour
#print axioms reciprocalCriticalArm_reorients_to_firstApexUniqueFour

end ATailRReciprocalSwapReductionScratch
end Problem97
