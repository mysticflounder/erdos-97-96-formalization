/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1TwoShortCapReduction
import Erdos9796Proof.P97.U1OppositeCapLowerBounds

/-!
# Card-eleven cap-profile boundary

This module isolates the card-eleven `(5,5,4)` cap profile and its `(3,3,2)`
strict-interior form below the live Route-B tail.  Census and certificate
modules can therefore consume these finite-profile facts without importing the
frontier closer that ultimately consumes their certificate.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace U1LargeCapRouteBTailMetricResidualTarget

private lemma nat_eq_554_of_sum_eq_fourteen
    {a b c : Nat} (ha : 5 ≤ a) (hb : 5 ≤ b) (hc : 4 ≤ c)
    (hsum : a + b + c = 14) :
    a = 5 ∧ b = 5 ∧ c = 4 := by
  omega

/-- `Fin 3` always offers a label distinct from two given ones. -/
private lemma fin3_exists_ne : ∀ i j : Fin 3, ∃ k : Fin 3, k ≠ i ∧ k ≠ j := by
  decide

/-- Two labels avoiding both members of a distinct pair in `Fin 3` agree. -/
private lemma fin3_eq_of_ne_of_ne {i j k l : Fin 3}
    (hji : j ≠ i) (hki : k ≠ i) (hkj : k ≠ j)
    (hli : l ≠ i) (hlj : l ≠ j) : l = k := by
  revert i j k l
  decide

/-- Index-level `(5,5,4)` profile dispatch shared by the cap-profile lemmas:
with all three caps bounded below by `4`, total closed-cap mass `14`, and two
distinct large caps `i`, `j`, the indexed cap sizes are exactly `(5,5,4)`. -/
private lemma capAt_profile_eq_554
    {A : Finset ℝ²} {M : MoserTriangle A} (CP : CapTriple A M)
    {i j : Fin 3} (hji : j ≠ i)
    (hlower : 4 ≤ CP.C1.card ∧ 4 ≤ CP.C2.card ∧ 4 ≤ CP.C3.card)
    (hsum : CP.C1.card + CP.C2.card + CP.C3.card = 14)
    (hi5 : 5 ≤ (CP.capAt i).card) (hj5 : 5 ≤ (CP.capAt j).card) :
    (CP.capAt i).card = 5 ∧
      (CP.capAt j).card = 5 ∧
        ∀ k : Fin 3, k ≠ i → k ≠ j → (CP.capAt k).card = 4 := by
  obtain ⟨k, hki, hkj⟩ := fin3_exists_ne i j
  have hk4 : 4 ≤ (CP.capAt k).card := by
    fin_cases k
    · simpa [CapTriple.capAt] using hlower.1
    · simpa [CapTriple.capAt] using hlower.2.1
    · simpa [CapTriple.capAt] using hlower.2.2
  have hsum' :
      (CP.capAt i).card + (CP.capAt j).card + (CP.capAt k).card = 14 := by
    fin_cases i <;> fin_cases j <;> fin_cases k <;>
      first
        | exact absurd rfl hji
        | exact absurd rfl hki
        | exact absurd rfl hkj
        | (simp [CapTriple.capAt]; omega)
  have hprof := nat_eq_554_of_sum_eq_fourteen hi5 hj5 hk4 hsum'
  refine ⟨hprof.1, hprof.2.1, fun l hli hlj => ?_⟩
  rw [fin3_eq_of_ne_of_ne hji hki hkj hli hlj]
  exact hprof.2.2

/-- Strict cap interior selected by the same index convention as
`CapTriple.capAt`. -/
noncomputable def capInteriorAt
    {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M) (i : Fin 3) : Finset ℝ² :=
  match i with
  | ⟨0, _⟩ => U1OppositeCapLowerBounds.interior1 CP
  | ⟨1, _⟩ => U1OppositeCapLowerBounds.interior2 CP
  | _ => U1OppositeCapLowerBounds.interior3 CP

/-- The indexed strict cap interior omits exactly the two Moser endpoints of
its cap, uniformly in the `capAt` index convention. -/
private lemma capInteriorAt_card_add_two
    {A : Finset ℝ²} {M : MoserTriangle A} (CP : CapTriple A M) (k : Fin 3) :
    (capInteriorAt CP k).card + 2 = (CP.capAt k).card := by
  fin_cases k
  · simpa [capInteriorAt, CapTriple.capAt]
      using U1OppositeCapLowerBounds.interior1_card_add_two CP
  · simpa [capInteriorAt, CapTriple.capAt]
      using U1OppositeCapLowerBounds.interior2_card_add_two CP
  · simpa [capInteriorAt, CapTriple.capAt]
      using U1OppositeCapLowerBounds.interior3_card_add_two CP

/-- In the card-11 branch of the two-large-cap leaf, the cap sizes are exactly
`(5,5,4)` relative to the surplus cap `i` and the chosen second large cap `j`.

This is the finite profile handoff used by the `(5,5,4)` census: the cap-sum
identity gives total closed-cap mass `14`, while the two large caps contribute
at least `5` each and the remaining cap has the proven lower bound `4`. -/
theorem capProfile_eq_554_of_card_eq_eleven
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    {i j : Fin 3} (hji : j ≠ i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hj5 : 5 ≤ (CP.capAt j).card)
    (hcard11 : D.A.card = 11) :
    (CP.capAt i).card = 5 ∧
      (CP.capAt j).card = 5 ∧
        ∀ k : Fin 3, k ≠ i → k ≠ j → (CP.capAt k).card = 4 := by
  subst hM
  have hlower :
      4 ≤ CP.C1.card ∧ 4 ≤ CP.C2.card ∧ 4 ≤ CP.C3.card :=
    U1OppositeCapLowerBounds.capTriple_caps_card_ge_four CP D.convex hncol
      D.K4 (CircumscribedMECPacket.ofNonObtuse MT hCirc)
  have hi5 : 5 ≤ (CP.capAt i).card := by omega
  have hsum : CP.C1.card + CP.C2.card + CP.C3.card = 14 := by
    have h := CP.cap_sum_identity
    omega
  exact capAt_profile_eq_554 CP hji hlower hsum hi5 hj5

/-- In the card-11 branch of the two-large-cap leaf, the strict cap interiors
have size `(3,3,2)` relative to the surplus cap `i`, the chosen second large
cap `j`, and the remaining cap. -/
theorem capInteriorProfile_eq_332_of_card_eq_eleven
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    {i j : Fin 3} (hji : j ≠ i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hj5 : 5 ≤ (CP.capAt j).card)
    (hcard11 : D.A.card = 11) :
    (capInteriorAt CP i).card = 3 ∧
      (capInteriorAt CP j).card = 3 ∧
        ∀ k : Fin 3, k ≠ i → k ≠ j → (capInteriorAt CP k).card = 2 := by
  obtain ⟨hi, hj, hrest⟩ :=
    capProfile_eq_554_of_card_eq_eleven MT hCirc CP hM hji hsurplus hj5
      hcard11
  obtain ⟨k, hki, hkj⟩ := fin3_exists_ne i j
  have hk4 : (CP.capAt k).card = 4 := hrest k hki hkj
  have hIi := capInteriorAt_card_add_two CP i
  have hIj := capInteriorAt_card_add_two CP j
  have hIk := capInteriorAt_card_add_two CP k
  refine ⟨by omega, by omega, fun l hli hlj => ?_⟩
  rw [fin3_eq_of_ne_of_ne hji hki hkj hli hlj]
  omega

end U1LargeCapRouteBTailMetricResidualTarget
end Problem97
