/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BiApexRobustCapBounds

/-!
# Cardinality dispatcher for the exact-five physical second-cap residual

The live exact-five residual has a five-point second opposite cap, a first
opposite cap of cardinality at least six, and a surplus cap of cardinality at
least five.  This module records the resulting carrier-cardinality boundary
and the exact cap profiles at cards thirteen and fourteen.

These are arithmetic routing lemmas.  They do not close any geometric branch.
-/

namespace Problem97
namespace ATailExactFiveCardinalityDispatcherScratch

open ATailBiApexRobustCapBounds
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion

/-- Every exact-five physical second-cap residual has at least thirteen
carrier points. -/
theorem exactFiveSecondCap_carrier_card_ge_thirteen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B) :
    13 ≤ D.A.card := by
  have hsum := S.capSum
  have hsurplus := S.surplus_card_gt_four
  have hfirst := Q.firstOppCap_card_ge_six
  have hsecond := Q.secondOppCap_card_eq_five
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  all_goals
    simp only [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppCap2, hi] at hsum hsurplus hfirst hsecond ⊢
    omega

/-- The exact-five branch splits exhaustively into the card-thirteen boundary
and the card-at-least-fourteen continuation. -/
theorem exactFiveSecondCap_card_eq_thirteen_or_ge_fourteen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B) :
    D.A.card = 13 ∨ 14 ≤ D.A.card := by
  have hcard := exactFiveSecondCap_carrier_card_ge_thirteen Q
  omega

/-- At carrier cardinality thirteen, the displayed cap profile is exactly
`(5, 6, 5)` in surplus/first-opposite/second-opposite order. -/
theorem exactFiveSecondCap_cap_cards_eq_five_six_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (hcard : D.A.card = 13) :
    S.surplusCap.card = 5 ∧ S.oppCap1.card = 6 ∧
      S.oppCap2.card = 5 := by
  have hsum := S.capSum
  have hsurplus := S.surplus_card_gt_four
  have hfirst := Q.firstOppCap_card_ge_six
  have hsecond := Q.secondOppCap_card_eq_five
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  all_goals
    simp only [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppCap2, hi] at hsum hsurplus hfirst hsecond ⊢
    omega

/-- Above the card-thirteen boundary, at least one of the two non-exact cap
lower bounds is strict: either the first opposite cap has at least seven
points or the surplus cap has at least six points. -/
theorem exactFiveSecondCap_firstOppCap_ge_seven_or_surplusCap_ge_six
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (hcard : 14 ≤ D.A.card) :
    7 ≤ S.oppCap1.card ∨ 6 ≤ S.surplusCap.card := by
  have hsum := S.capSum
  have hsurplus := S.surplus_card_gt_four
  have hfirst := Q.firstOppCap_card_ge_six
  have hsecond := Q.secondOppCap_card_eq_five
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  all_goals
    simp only [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppCap2, hi] at hsum hsurplus hfirst hsecond ⊢
    omega

/-- At carrier cardinality fourteen, the exact-five physical second-cap
residual has exactly the `(5, 7, 5)` or `(6, 6, 5)` cap profile. -/
theorem exactFiveSecondCap_cap_cards_of_card_eq_fourteen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (hcard : D.A.card = 14) :
    (S.surplusCap.card = 5 ∧ S.oppCap1.card = 7 ∧
        S.oppCap2.card = 5) ∨
      (S.surplusCap.card = 6 ∧ S.oppCap1.card = 6 ∧
        S.oppCap2.card = 5) := by
  have hsum := S.capSum
  have hsurplus := S.surplus_card_gt_four
  have hfirst := Q.firstOppCap_card_ge_six
  have hsecond := Q.secondOppCap_card_eq_five
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  all_goals
    simp only [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppCap2, hi] at hsum hsurplus hfirst hsecond ⊢
    omega

#print axioms exactFiveSecondCap_carrier_card_ge_thirteen
#print axioms exactFiveSecondCap_card_eq_thirteen_or_ge_fourteen
#print axioms exactFiveSecondCap_cap_cards_eq_five_six_five
#print axioms exactFiveSecondCap_firstOppCap_ge_seven_or_surplusCap_ge_six
#print axioms exactFiveSecondCap_cap_cards_of_card_eq_fourteen

end ATailExactFiveCardinalityDispatcherScratch
end Problem97
