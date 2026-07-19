/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ParentExactFiveAssembler

/-!
# Exact-six all-reverse parent terminal

An exact-five physical radius and a six-point closed physical cap leave only
four strict-cap positions.  The full-parent all-reverse packet supplies three
distinct period-three sources and, between each consecutive source pair, an
actual blocker in that same strict cap.  Any three cyclic sources with those
three straddles require at least five carrier positions, contradicting the
four-position cap interior.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailParentExactFiveExactSix

open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailLargeCapUniqueFiveLowHit
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveAssembler
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

noncomputable section

/-- `b` lies strictly between `a` and `c` in either orientation. -/
private def StrictBetween {α : Type*} [LT α] (a b c : α) : Prop :=
  (a < b ∧ b < c) ∨ (c < b ∧ b < a)

private theorem StrictBetween.swap
    {α : Type*} [LT α] {a b c : α}
    (h : StrictBetween a b c) : StrictBetween c b a := by
  simpa [StrictBetween, or_comm] using h

-- The explicit `Fin 5` tuple proof intentionally simplifies both a local
-- equality hypothesis and its finite-index goal after `fin_cases`.
set_option linter.flexible false in
private theorem five_le_card_of_two_adjacent_straddles
    {α : Type*} [LinearOrder α]
    (U : Finset α) (x y z bx bz : α)
    (hxU : x ∈ U) (hyU : y ∈ U) (hzU : z ∈ U)
    (hbxU : bx ∈ U) (hbzU : bz ∈ U)
    (hxy : x < y) (hyz : y < z)
    (hbx : StrictBetween x bx y)
    (hbz : StrictBetween y bz z) :
    5 ≤ U.card := by
  have hxbx : x < bx := by
    rcases hbx with h | h <;> order
  have hbxy : bx < y := by
    rcases hbx with h | h <;> order
  have hybz : y < bz := by
    rcases hbz with h | h <;> order
  have hbzz : bz < z := by
    rcases hbz with h | h <;> order
  let f : Fin 5 → ↑U := ![
    ⟨x, hxU⟩, ⟨bx, hbxU⟩, ⟨y, hyU⟩, ⟨bz, hbzU⟩, ⟨z, hzU⟩]
  have hf : Function.Injective f := by
    intro i j hij
    fin_cases i <;> fin_cases j <;> simp [f] at hij ⊢ <;> order
  have hcard := Fintype.card_le_of_injective f hf
  simpa using hcard

/-- A three-cycle whose consecutive source pairs all strictly straddle
blockers in the same carrier requires at least five carrier points. -/
private theorem five_le_card_of_periodThree_straddles
    {α : Type*} [LinearOrder α]
    (U : Finset α) (q0 q1 q2 b0 b1 b2 : α)
    (hq0U : q0 ∈ U) (hq1U : q1 ∈ U) (hq2U : q2 ∈ U)
    (hb0U : b0 ∈ U) (hb1U : b1 ∈ U) (hb2U : b2 ∈ U)
    (hq01 : q0 ≠ q1) (hq12 : q1 ≠ q2) (hq20 : q2 ≠ q0)
    (h0 : StrictBetween q0 b0 q1)
    (h1 : StrictBetween q1 b1 q2)
    (h2 : StrictBetween q2 b2 q0) :
    5 ≤ U.card := by
  rcases lt_trichotomy q0 q1 with h01 | h01 | h10
  · rcases lt_trichotomy q1 q2 with h12 | h12 | h21
    · exact five_le_card_of_two_adjacent_straddles U q0 q1 q2 b0 b1
        hq0U hq1U hq2U hb0U hb1U h01 h12 h0 h1
    · exact False.elim (hq12 h12)
    · have h02 : q0 < q2 ∨ q2 < q0 := lt_or_gt_of_ne hq20.symm
      rcases h02 with h02 | h20
      · have h2' : StrictBetween q0 b2 q2 := h2.swap
        have h1' : StrictBetween q2 b1 q1 := h1.swap
        exact five_le_card_of_two_adjacent_straddles U q0 q2 q1 b2 b1
          hq0U hq2U hq1U hb2U hb1U h02 h21 h2' h1'
      · exact five_le_card_of_two_adjacent_straddles U q2 q0 q1 b2 b0
          hq2U hq0U hq1U hb2U hb0U h20 h01 h2 h0
  · exact False.elim (hq01 h01)
  · rcases lt_trichotomy q0 q2 with h02 | h02 | h20
    · have h2' : StrictBetween q0 b2 q2 := h2.swap
      have h0' : StrictBetween q1 b0 q0 := h0.swap
      exact five_le_card_of_two_adjacent_straddles U q1 q0 q2 b0 b2
        hq1U hq0U hq2U hb0U hb2U h10 h02 h0' h2'
    · exact False.elim (hq20 h02.symm)
    · rcases lt_trichotomy q1 q2 with h12 | h12 | h21
      · have h0' : StrictBetween q1 b0 q0 := h0.swap
        exact five_le_card_of_two_adjacent_straddles U q1 q2 q0 b1 b2
          hq1U hq2U hq0U hb1U hb2U h12 h20 h1 h2
      · exact False.elim (hq12 h12)
      · have h0' : StrictBetween q1 b0 q0 := h0.swap
        have h1' : StrictBetween q2 b1 q1 := h1.swap
        exact five_le_card_of_two_adjacent_straddles U q2 q1 q0 b1 b0
          hq2U hq1U hq0U hb1U hb0U h21 h10 h1' h0'

private theorem capInteriorByIndex_card_add_two
    {A : Finset ℝ²} (S : SurplusCapPacket A) (k : Fin 3) :
    (S.capInteriorByIndex k).card + 2 = (S.capByIndex k).card := by
  fin_cases k
  · simpa only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex,
      U1OppositeCapLowerBounds.interior1] using
      U1OppositeCapLowerBounds.interior1_card_add_two S.partition
  · simpa only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex,
      U1OppositeCapLowerBounds.interior2] using
      U1OppositeCapLowerBounds.interior2_card_add_two S.partition
  · simpa only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex,
      U1OppositeCapLowerBounds.interior3] using
      U1OppositeCapLowerBounds.interior3_card_add_two S.partition

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- The complete exact-five all-reverse parent is impossible when the second
physical closed cap has exactly six points. -/
theorem false_of_fullParentExactFiveAllReverseData_of_secondCap_card_eq_six
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : ATailCriticalPairFrontier.CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : ATailLargeCapUniqueFive.LargeCapUniqueFiveSecondApexRadius D S}
    {continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile}
    (A : FullParentExactFiveAllReverseData L profile continuation)
    (hcap : S.oppCap2.card = 6) : False := by
  classical
  let K := A.cycle
  let O := A.sharedOrder
  let U : Finset (Fin O.block.m) := Finset.univ.filter fun k ↦
    O.block.L.points k ∈ S.capInteriorByIndex S.oppIndex2
  have hperiod : K.period = 3 := A.cycle_period
  let i0 : Fin K.period := ⟨0, by omega⟩
  let i1 : Fin K.period := ⟨1, by omega⟩
  let i2 : Fin K.period := ⟨2, by omega⟩
  let q0 := O.sourceIndex (K.source i0)
  let q1 := O.sourceIndex (K.source i1)
  let q2 := O.sourceIndex (K.source i2)
  let b0 := O.blockerIndex (K.source i0)
  let b1 := O.blockerIndex (K.source i1)
  let b2 := O.blockerIndex (K.source i2)
  have hreverse (q : PhysicalVertex profile) :
      q.1 ∈
        (H.selectedAt (A.transition.successor q).1
          (PhysicalVertex.mem_A (A.transition.successor q))).toCriticalFourShell.support :=
    A.allReverse q (A.transition.successor q)
      (A.transition.successor_not_mem_actualCriticalSupport q)
  have himage : U.image O.block.L.points = S.capInteriorByIndex S.oppIndex2 := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨k, hk, rfl⟩
      exact (Finset.mem_filter.mp hk).2
    · intro hx
      have hxCap : x ∈ S.capByIndex S.oppIndex2 :=
        S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hx
      rcases O.block.exists_index_of_mem_cap hxCap with ⟨k, hk⟩
      exact Finset.mem_image.mpr ⟨k,
        Finset.mem_filter.mpr ⟨Finset.mem_univ _, hk.symm ▸ hx⟩, hk⟩
  have hUcard : U.card = 4 := by
    have hinterior := capInteriorByIndex_card_add_two S S.oppIndex2
    rw [capByIndex_oppIndex2_eq_oppCap2 S] at hinterior
    rw [← himage, Finset.card_image_of_injective _ O.block.L.injective] at hinterior
    omega
  have hqmem (i : Fin K.period) : O.sourceIndex (K.source i) ∈ U := by
    apply Finset.mem_filter.mpr
    exact ⟨Finset.mem_univ _, by
      rw [O.source_point]
      exact K.source_mem_capInterior i⟩
  have hbmem (i : Fin K.period) : O.blockerIndex (K.source i) ∈ U := by
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_univ _, ?_⟩
    rw [O.blocker_point]
    exact transition_successor_actualBlocker_mem_physicalCapInterior
      A.transition hreverse (K.source i)
  have hnext0 : A.transition.successor (K.source i0) = K.source i1 := by
    calc
      A.transition.successor (K.source i0) =
          K.transition.successor (K.source i0) := by rw [A.cycle_transition]
      _ = K.source (K.successorIndex i0) := K.successor_source_eq i0
      _ = K.source i1 := by
        congr 1
        apply Fin.ext
        simp [PhysicalActualCriticalOmissionCycle.successorIndex, i0, i1, hperiod]
  have hnext1 : A.transition.successor (K.source i1) = K.source i2 := by
    calc
      A.transition.successor (K.source i1) =
          K.transition.successor (K.source i1) := by rw [A.cycle_transition]
      _ = K.source (K.successorIndex i1) := K.successor_source_eq i1
      _ = K.source i2 := by
        congr 1
        apply Fin.ext
        simp [PhysicalActualCriticalOmissionCycle.successorIndex, i1, i2, hperiod]
  have hnext2 : A.transition.successor (K.source i2) = K.source i0 := by
    calc
      A.transition.successor (K.source i2) =
          K.transition.successor (K.source i2) := by rw [A.cycle_transition]
      _ = K.source (K.successorIndex i2) := K.successor_source_eq i2
      _ = K.source i0 := by
        congr 1
        apply Fin.ext
        simp [PhysicalActualCriticalOmissionCycle.successorIndex, i2, i0, hperiod]
  have hsourceIndex_ne {i j : Fin K.period} (hij : i ≠ j) :
      O.sourceIndex (K.source i) ≠ O.sourceIndex (K.source j) := by
    intro heq
    apply hij
    apply K.source_injective
    apply Subtype.ext
    calc
      (K.source i).1 = O.block.L.points (O.sourceIndex (K.source i)) :=
        (O.source_point _).symm
      _ = O.block.L.points (O.sourceIndex (K.source j)) := by rw [heq]
      _ = (K.source j).1 := O.source_point _
  have hi01 : i0 ≠ i1 := by
    intro h
    have := congrArg Fin.val h
    simp [i0, i1] at this
  have hi12 : i1 ≠ i2 := by
    intro h
    have := congrArg Fin.val h
    simp [i1, i2] at this
  have hi20 : i2 ≠ i0 := by
    intro h
    have := congrArg Fin.val h
    simp [i2, i0] at this
  have h0 : StrictBetween q0 b0 q1 := by
    simpa [StrictBetween, q0, b0, q1, hnext0] using O.straddle (K.source i0)
  have h1 : StrictBetween q1 b1 q2 := by
    simpa [StrictBetween, q1, b1, q2, hnext1] using O.straddle (K.source i1)
  have h2 : StrictBetween q2 b2 q0 := by
    simpa [StrictBetween, q2, b2, q0, hnext2] using O.straddle (K.source i2)
  have hfive := five_le_card_of_periodThree_straddles U q0 q1 q2 b0 b1 b2
    (hqmem i0) (hqmem i1) (hqmem i2)
    (hbmem i0) (hbmem i1) (hbmem i2)
    (hsourceIndex_ne hi01) (hsourceIndex_ne hi12) (hsourceIndex_ne hi20)
    h0 h1 h2
  omega

/-- At the exact-five call site on a six-point second cap, only the
independent mutual-omission sibling remains. -/
theorem false_of_fullParentExactFive_of_secondCap_card_eq_six_and_mutualConsumer
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : ATailCriticalPairFrontier.CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (profile : ATailLargeCapUniqueFive.LargeCapUniqueFiveSecondApexRadius D S)
    (hcap : S.oppCap2.card = 6)
    (mutualFalse : FullParentExactFiveMutualData L profile → False) : False := by
  rcases nonempty_mutualOmissionPair_or_fullParentExactFiveAllReverseData
      L profile with hmutual | ⟨continuation, hallReverse⟩
  · exact mutualFalse hmutual.some
  · exact false_of_fullParentExactFiveAllReverseData_of_secondCap_card_eq_six
      hallReverse.some hcap

/- The cap-sum identity makes the exact-six terminal unconditional on the
card-14 slice: two opposite caps already contribute six points each and the
surplus cap contributes at least five, so equality in the carrier lower bound
forces the second opposite cap to have exactly six points. -/

theorem false_of_fullParentExactFive_of_card_eq_fourteen_and_mutualConsumer
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : ATailCriticalPairFrontier.CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (profile : ATailLargeCapUniqueFive.LargeCapUniqueFiveSecondApexRadius D S)
    (hcard : D.A.card = 14)
    (mutualFalse : FullParentExactFiveMutualData L profile → False) : False := by
  have hsum := S.capSum
  have hsurplus := S.surplus_card_gt_four
  have hfirst := L.firstOppCap_card_ge_six
  have hsecond := L.secondOppCap_card_ge_six
  rw [hcard] at hsum
  have hcap : S.oppCap2.card = 6 := by
    omega
  exact false_of_fullParentExactFive_of_secondCap_card_eq_six_and_mutualConsumer
    L profile hcap mutualFalse

end

end ATailParentExactFiveExactSix
end Problem97
