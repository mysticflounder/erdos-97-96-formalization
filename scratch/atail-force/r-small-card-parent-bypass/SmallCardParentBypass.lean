/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import F1F3OutcomeReduction
import SmallCapFrontierReduction

/-!
# Scratch: parent-level small-card bypass of the coherent R lane

Through carrier cardinality thirteen, one of the two non-surplus caps has
cardinality four or five.

* If the original first opposite cap is small, the chosen frontier already
  lies in the protected original `FA-UNIQ4/FA-UNIQ5` arm.
* If the original second opposite cap is small, swap the two non-surplus
  roles while preserving the surplus cap, extract a fresh frontier, and route
  it to the protected swapped `FA-UNIQ4` or `FA-UNIQ5` arm.

Thus the coherent robust/common-deletion lane is needed only from carrier
cardinality fourteen onward.  This is a routing theorem, not a proof of the
protected unique-row arms.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRSmallCardParentBypassScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailBlockerDistinctRadiusScratch
open ATailCriticalPairFrontier
open ATailFullGeometryProducerScratch
open ATailRF1F3OutcomeReductionScratch
open ATailROriginTaggedCoordinatorScratch
open ATailRReciprocalSwapReductionScratch
open ATailSmallCapFrontierReductionScratch

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

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- The exact protected outcomes after applying the cap-at-most-thirteen
orientation split. -/
inductive SmallCardProtectedFrontierOutcome
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    {radius : ℝ} (F : CriticalPairFrontier D S radius H) : Prop
  | originalUnique
      (arm : OriginalUniqueRadiusArm F) :
      SmallCardProtectedFrontierOutcome S H F
  | swappedUniqueFour
      (terminal :
        Nonempty (SwappedFirstApexUniqueFourFrontier D S H)) :
      SmallCardProtectedFrontierOutcome S H F
  | swappedUniqueFive
      (terminal :
        Nonempty (SwappedFirstApexUniqueFiveFrontier D S H)) :
      SmallCardProtectedFrontierOutcome S H F

/-- A small physical second opposite cap becomes a fresh protected
first-apex unique-four/five frontier after the fixed-surplus swap. -/
theorem secondSmallCap_reorients_to_swappedUnique
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    (hsmall :
      (S.capByIndex S.oppIndex2).card = 4 ∨
        (S.capByIndex S.oppIndex2).card = 5) :
    Nonempty (SwappedFirstApexUniqueFourFrontier D S H) ∨
      Nonempty (SwappedFirstApexUniqueFiveFrontier D S H) := by
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
  have hsmallSw :
      (Ssw.capByIndex Ssw.oppIndex1).card = 4 ∨
        (Ssw.capByIndex Ssw.oppIndex1).card = 5 := by
    rw [capByIndex_oppIndex1_eq_oppCap1, hfirstCap,
      ← capByIndex_oppIndex2_eq_oppCap2 S]
    exact hsmall
  obtain ⟨radius, hradius, hfour, ⟨Fsw⟩⟩ :=
    exists_criticalPairFrontier_of_K4 D Ssw H
  have hprotected :
      ((SelectedClass D.A Ssw.oppApex1 radius).card = 4 ∨
          (SelectedClass D.A Ssw.oppApex1 radius).card = 5) ∧
        ∀ rho : ℝ, 0 < rho →
          4 ≤ (SelectedClass D.A Ssw.oppApex1 rho).card →
          rho = radius :=
    firstApexSplit_unique_of_small_opposite_cap
      Fsw hradius hfour hsmallSw
  have hblocked :
      ¬ HasNEquidistantPointsAt 4
        ((D.A.erase Fsw.pair.q).erase Fsw.pair.w)
          Ssw.oppApex1 :=
    not_firstApex_double_erase_of_small_opposite_cap
      Fsw.pair hradius hfour hsmallSw
  rcases hprotected.1 with hcardFour | hcardFive
  · exact Or.inl ⟨{
      packet := Ssw
      firstApex_eq := hfirstApex
      secondApex_eq := hsecondApex
      firstCap_eq := hfirstCap
      secondCap_eq := hsecondCap
      surplusCap_eq := hsurplusCap
      radius := radius
      radius_pos := hradius
      frontier := Fsw
      firstClass_card_eq_four := hcardFour
      firstClass_unique_radius := hprotected.2
      firstApexDouble_blocked := hblocked }⟩
  · exact Or.inr ⟨{
      packet := Ssw
      firstApex_eq := hfirstApex
      secondApex_eq := hsecondApex
      firstCap_eq := hfirstCap
      secondCap_eq := hsecondCap
      surplusCap_eq := hsurplusCap
      radius := radius
      radius_pos := hradius
      frontier := Fsw
      firstClass_card_eq_five := hcardFive
      firstClass_unique_radius := hprotected.2
      firstApexDouble_blocked := hblocked }⟩

/-- Through card thirteen, the chosen parent frontier never needs the coherent
R handler: it is already original unique, or a fixed-surplus swap produces a
fresh unique-four/five frontier. -/
theorem smallCarrier_routes_to_protectedFrontier
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    {radius : ℝ} (F : CriticalPairFrontier D S radius H)
    (hradius : 0 < radius)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 radius).card)
    (hcard : D.A.card ≤ 13) :
    SmallCardProtectedFrontierOutcome S H F := by
  rcases
      card_le_thirteen_has_opposite_cap_card_four_or_five
        D S hcard with hfirst | hsecond
  · exact SmallCardProtectedFrontierOutcome.originalUnique
      (firstApexSplit_unique_of_small_opposite_cap
        F hradius hfour hfirst)
  · rcases secondSmallCap_reorients_to_swappedUnique
      S H hsecond with hfourTerminal | hfiveTerminal
    · exact SmallCardProtectedFrontierOutcome.swappedUniqueFour
        hfourTerminal
    · exact SmallCardProtectedFrontierOutcome.swappedUniqueFive
        hfiveTerminal

/-- Motive-valued protected handlers for the small-card parent bypass. -/
structure SmallCardProtectedFrontierEliminator
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    {radius : ℝ} (F : CriticalPairFrontier D S radius H)
    (Goal : Prop) : Prop where
  originalUnique :
    OriginalUniqueRadiusArm F → Goal
  swappedUniqueFour :
    Nonempty (SwappedFirstApexUniqueFourFrontier D S H) → Goal
  swappedUniqueFive :
    Nonempty (SwappedFirstApexUniqueFiveFrontier D S H) → Goal

/-- Eliminate a small-card frontier using only the three protected unique-row
handlers. -/
theorem SmallCardProtectedFrontierEliminator.eliminate
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {radius : ℝ} {F : CriticalPairFrontier D S radius H}
    {Goal : Prop}
    (E : SmallCardProtectedFrontierEliminator S H F Goal)
    (O : SmallCardProtectedFrontierOutcome S H F) :
    Goal := by
  cases O with
  | originalUnique arm => exact E.originalUnique arm
  | swappedUniqueFour terminal => exact E.swappedUniqueFour terminal
  | swappedUniqueFive terminal => exact E.swappedUniqueFive terminal

#print axioms secondSmallCap_reorients_to_swappedUnique
#print axioms smallCarrier_routes_to_protectedFrontier
#print axioms SmallCardProtectedFrontierEliminator.eliminate

end ATailRSmallCardParentBypassScratch
end Problem97
