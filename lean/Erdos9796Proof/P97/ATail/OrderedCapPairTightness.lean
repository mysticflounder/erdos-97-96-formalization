/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Tightness for disjoint outside-pair families

The ordered-cap counting argument lower-bounds a disjoint family of
two-element subsets by `m + 4`.  This lemma isolates the finite combinatorial
step needed at equality: every row reaches its lower bound and the pair
families cover the whole ambient pair set.  Keeping this step independent of
the geometric construction makes it reusable by the source-derived equality
normal form without duplicating the double-counting argument.
-/

namespace Problem97
namespace CapSelectedRowCounting

attribute [local instance] Classical.propDecidable

/-- A pair-family lower bound is rigid when its disjoint union has exactly the
ambient cardinality.  The conclusion supplies both pointwise tightness and
the resulting cover; no geometric assumptions are hidden in this lemma. -/
theorem pairFamily_tight_of_pairwiseDisjoint_subset
    {α ι : Type*} [DecidableEq α] [Fintype ι] [DecidableEq ι]
    (U : Finset (Finset α))
    (pairs : ι → Finset (Finset α))
    (weight : ι → ℕ)
    (hdisjoint :
      ((Finset.univ : Finset ι) : Set ι).PairwiseDisjoint pairs)
    (hsubset : ∀ i, pairs i ⊆ U)
    (hlower : ∀ i, weight i ≤ (pairs i).card)
    (hsum : ∑ i, weight i = U.card) :
    (∀ i, (pairs i).card = weight i) ∧
      Finset.univ.biUnion pairs = U := by
  classical
  have hunion_subset : Finset.univ.biUnion pairs ⊆ U := by
    intro x hx
    rcases Finset.mem_biUnion.mp hx with ⟨i, _hi, hxi⟩
    exact hsubset i hxi
  have hupper : (∑ i, (pairs i).card) ≤ U.card := by
    rw [← Finset.card_biUnion hdisjoint]
    exact Finset.card_le_card hunion_subset
  have hsumLower : U.card ≤ ∑ i, (pairs i).card := by
    rw [← hsum]
    exact Finset.sum_le_sum fun i _hi => hlower i
  have hsumEq : (∑ i, (pairs i).card) = U.card :=
    Nat.le_antisymm hupper hsumLower
  have hpointwise : ∀ i, (pairs i).card = weight i := by
    intro i
    apply Nat.le_antisymm
    · by_contra hne
      have hlt : weight i < (pairs i).card :=
        lt_of_le_of_ne (hlower i) (fun h => hne h.symm)
      have hsumLt : (∑ k, weight k) < ∑ k, (pairs k).card := by
        apply Finset.sum_lt_sum
        · intro k _hk
          exact hlower k
        · exact ⟨i, Finset.mem_univ _, hlt⟩
      rw [hsum, hsumEq] at hsumLt
      exact (Nat.lt_irrefl _ hsumLt)
    · exact hlower i
  have hunion_card : (Finset.univ.biUnion pairs).card = U.card := by
    rw [Finset.card_biUnion hdisjoint, hsumEq]
  exact ⟨hpointwise,
    Finset.eq_of_subset_of_card_le hunion_subset hunion_card.symm.le⟩

/-- A nonempty two-subset family of cardinality one has exactly two
elements.  This is the small inversion step needed to turn endpoint pair
tightness into an outside-support cardinality. -/
theorem card_eq_two_of_powersetCard_card_eq_one
    {α : Type*} [DecidableEq α] (s : Finset α)
    (hpairs : (s.powersetCard 2).card = 1) :
    s.card = 2 := by
  have hchoose : s.card.choose 2 = 1 := by
    simpa only [Finset.card_powersetCard] using hpairs
  rcases (Nat.choose_eq_one_iff.mp hchoose) with hk | hcard
  · omega
  · exact hcard

/-- A two-subset family of cardinality three has exactly three elements. -/
theorem card_eq_three_of_powersetCard_card_eq_three
    {α : Type*} [DecidableEq α] (s : Finset α)
    (hpairs : (s.powersetCard 2).card = 3) :
    s.card = 3 := by
  have hchoose : s.card.choose 2 = 3 := by
    simpa only [Finset.card_powersetCard] using hpairs
  have hnot_le_two : ¬ s.card ≤ 2 := by
    intro hsmall
    have hmono := Nat.choose_le_choose 2 hsmall
    rw [hchoose] at hmono
    norm_num at hmono
  have hlt_four : s.card < 4 := by
    by_contra hnot
    have hlarge : 4 ≤ s.card := by omega
    have hmono := Nat.choose_le_choose 2 hlarge
    rw [hchoose] at hmono
    norm_num at hmono
  omega

end CapSelectedRowCounting
end Problem97
