/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Equality normal form for the ordered-cap pair bound

The ordered-cap count has a sharp lower bound of `m + 4`: the two endpoint
rows contribute three outside pairs each and every other row contributes one.
This file isolates the arithmetic saturation step.  It is deliberately
independent of the geometric producer: a later source adapter only has to
provide the pair-sum upper bound and the endpoint/interior lower bounds.
-/

namespace Problem97
namespace CapSelectedRowCounting

open scoped BigOperators

attribute [local instance] Classical.decEq

/-- If the outside-pair upper bound is attained, every row has the minimum
number of outside pairs allowed by its position: three at each endpoint and
one at every interior index. -/
theorem pair_saturation_weights_of_eq
    {α : Type*} [DecidableEq α] {B : Finset α} {m : ℕ}
    {hits : Fin m → Finset α}
    {first last : Fin m}
    (hfl : first ≠ last)
    (hfirst : 3 ≤ (hits first).card)
    (hlast : 3 ≤ (hits last).card)
    (hinterior : ∀ j : Fin m, j ≠ first → j ≠ last →
      2 ≤ (hits j).card)
    (hupper :
      (∑ j : Fin m, Nat.choose (hits j).card 2) ≤ Nat.choose B.card 2)
    (heq : m + 4 = Nat.choose B.card 2) :
    ∀ j : Fin m,
      Nat.choose (hits j).card 2 =
        1 + (if j = first then 2 else 0) +
          (if j = last then 2 else 0) := by
  let weight : Fin m → ℕ := fun j =>
    1 + (if j = first then 2 else 0) +
      (if j = last then 2 else 0)
  have hweight (j : Fin m) :
      weight j ≤ Nat.choose (hits j).card 2 := by
    by_cases hjfirst : j = first
    · subst j
      have hchoose : Nat.choose 3 2 ≤ Nat.choose (hits first).card 2 :=
        Nat.choose_le_choose 2 hfirst
      simpa [weight, hfl] using hchoose
    · by_cases hjlast : j = last
      · subst j
        have hchoose : Nat.choose 3 2 ≤ Nat.choose (hits last).card 2 :=
          Nat.choose_le_choose 2 hlast
        simpa [weight, hfl, hfl.symm] using hchoose
      · have hchoose : Nat.choose 2 2 ≤ Nat.choose (hits j).card 2 :=
          Nat.choose_le_choose 2 (hinterior j hjfirst hjlast)
        simpa [weight, hjfirst, hjlast] using hchoose
  have hweightSum : ∑ j : Fin m, weight j = m + 4 := by
    simp [weight, hfl, Finset.sum_add_distrib, Nat.add_assoc]
  have hsumLower : m + 4 ≤
      ∑ j : Fin m, Nat.choose (hits j).card 2 := by
    rw [← hweightSum]
    exact Finset.sum_le_sum fun j _hj => hweight j
  have hsumEq :
      ∑ j : Fin m, Nat.choose (hits j).card 2 = m + 4 := by
    omega
  intro j
  have hpairEq (j : Fin m) :
      Nat.choose (hits j).card 2 = weight j := by
    by_contra hne
    have hlt : weight j < Nat.choose (hits j).card 2 :=
      lt_of_le_of_ne (hweight j) (fun h => hne h.symm)
    have hsumLt : (∑ k : Fin m, weight k) <
        ∑ k : Fin m, Nat.choose (hits k).card 2 := by
      apply Finset.sum_lt_sum
      · intro k _hk
        exact hweight k
      · exact ⟨j, Finset.mem_univ _, hlt⟩
    rw [hweightSum, hsumEq] at hsumLt
    omega
  simpa [weight] using hpairEq j

/-- Support-cardinality form of `pair_saturation_weights_of_eq`.  If each row
has four witnesses and the cap/interior split is exact, saturation forces one
cap witness at each endpoint and two at every interior index. -/
theorem cap_hit_card_eq_of_pair_saturation
    {α : Type*} [DecidableEq α] {B : Finset α} {m : ℕ}
    {hits : Fin m → Finset α} {capHits : Fin m → ℕ}
    {first last : Fin m}
    (hfl : first ≠ last)
    (hfirst : 3 ≤ (hits first).card)
    (hlast : 3 ≤ (hits last).card)
    (hinterior : ∀ j : Fin m, j ≠ first → j ≠ last →
      2 ≤ (hits j).card)
    (hcapFirst : capHits first ≤ 1)
    (hcapLast : capHits last ≤ 1)
    (hcapAll : ∀ j : Fin m, capHits j ≤ 2)
    (hsplit : ∀ j : Fin m, (hits j).card + capHits j = 4)
    (hupper :
      (∑ j : Fin m, Nat.choose (hits j).card 2) ≤ Nat.choose B.card 2)
    (heq : m + 4 = Nat.choose B.card 2) :
    ∀ j : Fin m,
      capHits j = if j = first then 1 else if j = last then 1 else 2 := by
  have hweights := pair_saturation_weights_of_eq hfl hfirst hlast hinterior
    hupper heq
  intro j
  by_cases hjfirst : j = first
  · subst j
    simp only [if_pos]
    by_contra hne
    have hz : capHits first = 0 := by omega
    have hout : (hits first).card = 4 := by
      have := hsplit first
      omega
    have hp := hweights first
    have hp' : Nat.choose 4 2 = 3 := by
      simpa [hout, hfl] using hp
    norm_num [Nat.choose] at hp'
  · by_cases hjlast : j = last
    · subst j
      simp only [if_neg hfl.symm, if_pos]
      by_contra hne
      have hz : capHits last = 0 := by omega
      have hout : (hits last).card = 4 := by
        have := hsplit last
        omega
      have hp := hweights last
      have hp' : Nat.choose 4 2 = 3 := by
        simpa [hout, hfl, hfl.symm] using hp
      norm_num [Nat.choose] at hp'
    · simp only [if_neg hjfirst, if_neg hjlast]
      by_contra hne
      have hcapOne : capHits j ≤ 1 :=
        Nat.le_pred_of_lt (Nat.lt_of_le_of_ne (hcapAll j) hne)
      have houtThree : 3 ≤ (hits j).card := by
        have := hsplit j
        omega
      have hchooseThree : 3 ≤ Nat.choose (hits j).card 2 := by
        calc
          3 = Nat.choose 3 2 := by norm_num
          _ ≤ Nat.choose (hits j).card 2 :=
            Nat.choose_le_choose 2 houtThree
      have hp := hweights j
      have hpOne : Nat.choose (hits j).card 2 = 1 := by
        simpa [hjfirst, hjlast] using hp
      omega

end CapSelectedRowCounting
end Problem97
