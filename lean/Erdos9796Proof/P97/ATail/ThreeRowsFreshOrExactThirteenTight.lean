/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Mathlib.Data.Finset.Card

/-!
# Three disjoint four-rows cover an exact thirteen-point carrier

This is the source-independent finite kernel for the exact arm of the
three-row split.  It intentionally carries only the cardinality, containment,
omission, and pairwise-disjointness data needed for the cover identity.
-/

namespace Problem97

/-- Three disjoint four-element subsets omitting `z` fill a thirteen-element
carrier together with `z`. -/
theorem ThreeRowsFreshOrExactThirteenTight
    {α : Type*} [DecidableEq α]
    {A C0 C1 K : Finset α} {z : α}
    (hA : A.card = 13)
    (hzA : z ∈ A)
    (hC0card : C0.card = 4)
    (hC1card : C1.card = 4)
    (hKcard : K.card = 4)
    (hC0sub : C0 ⊆ A)
    (hC1sub : C1 ⊆ A)
    (hKsub : K ⊆ A)
    (hzC0 : z ∉ C0)
    (hzC1 : z ∉ C1)
    (hzK : z ∉ K)
    (hdisj01 : Disjoint C0 C1)
    (hdisj0K : Disjoint C0 K)
    (hdisj1K : Disjoint C1 K) :
    A = insert z ((C0 ∪ C1) ∪ K) := by
  have hdisj01K : Disjoint (C0 ∪ C1) K :=
    Finset.disjoint_union_left.mpr ⟨hdisj0K, hdisj1K⟩
  have hC01card : (C0 ∪ C1).card = 8 := by
    rw [Finset.card_union_of_disjoint hdisj01, hC0card, hC1card]
  have hC01Kcard : ((C0 ∪ C1) ∪ K).card = 12 := by
    rw [Finset.card_union_of_disjoint hdisj01K, hC01card, hKcard]
  have hzUnion : z ∉ (C0 ∪ C1) ∪ K := by
    simp [hzC0, hzC1, hzK]
  have hsubset : insert z ((C0 ∪ C1) ∪ K) ⊆ A :=
    Finset.insert_subset hzA
      (Finset.union_subset (Finset.union_subset hC0sub hC1sub) hKsub)
  apply (Finset.eq_of_subset_of_card_le hsubset ?_).symm
  rw [hA, Finset.card_insert_of_notMem hzUnion, hC01Kcard]

/-- The unconditional finite split behind the three-row packet.

The first branch records exactly which pairwise-disjointness premise fails.
If all three rows are disjoint, their inserted union has twelve points plus
`z`; the carrier therefore either has a fresh point outside that union or is
the exact thirteen-point cover. -/
theorem ThreeRowsFreshOrExactThirteenTight_split
    {α : Type*} [DecidableEq α]
    {A C0 C1 K : Finset α} {z : α}
    (_hA : 12 < A.card)
    (hzA : z ∈ A)
    (hC0card : C0.card = 4)
    (hC1card : C1.card = 4)
    (hKcard : K.card = 4)
    (hC0sub : C0 ⊆ A)
    (hC1sub : C1 ⊆ A)
    (hKsub : K ⊆ A)
    (hzC0 : z ∉ C0)
    (hzC1 : z ∉ C1)
    (hzK : z ∉ K) :
    (¬ Disjoint C0 C1 ∨ ¬ Disjoint C0 K ∨ ¬ Disjoint C1 K) ∨
      (∃ q ∈ A, q ∉ insert z ((C0 ∪ C1) ∪ K)) ∨
      (A = insert z ((C0 ∪ C1) ∪ K) ∧ A.card = 13) := by
  by_cases hdisj01 : Disjoint C0 C1
  · by_cases hdisj0K : Disjoint C0 K
    · by_cases hdisj1K : Disjoint C1 K
      · have hdisj01K : Disjoint (C0 ∪ C1) K :=
          Finset.disjoint_union_left.mpr ⟨hdisj0K, hdisj1K⟩
        have hC01card : (C0 ∪ C1).card = 8 := by
          rw [Finset.card_union_of_disjoint hdisj01, hC0card, hC1card]
        have hC01Kcard : ((C0 ∪ C1) ∪ K).card = 12 := by
          rw [Finset.card_union_of_disjoint hdisj01K, hC01card, hKcard]
        have hzUnion : z ∉ (C0 ∪ C1) ∪ K := by
          simp [hzC0, hzC1, hzK]
        have hTcard :
            (insert z ((C0 ∪ C1) ∪ K)).card = 13 := by
          rw [Finset.card_insert_of_notMem hzUnion, hC01Kcard]
        have hTsub : insert z ((C0 ∪ C1) ∪ K) ⊆ A :=
          Finset.insert_subset hzA
            (Finset.union_subset (Finset.union_subset hC0sub hC1sub) hKsub)
        by_cases hcard13 : A.card = 13
        · have hEq : A = insert z ((C0 ∪ C1) ∪ K) := by
            apply (Finset.eq_of_subset_of_card_le hTsub ?_).symm
            rw [hcard13, hTcard]
          exact Or.inr (Or.inr ⟨hEq, hcard13⟩)
        · have hcardGt : 13 < A.card := by omega
          have hnotSubset :
              ¬ A ⊆ insert z ((C0 ∪ C1) ∪ K) := by
            intro hAT
            have hEq : A = insert z ((C0 ∪ C1) ∪ K) :=
              Finset.Subset.antisymm hAT hTsub
            have hEqCard : A.card = 13 := by
              simpa [hEq] using hTcard
            omega
          have hfresh :
              ∃ q ∈ A, q ∉ insert z ((C0 ∪ C1) ∪ K) := by
            by_contra hnone
            apply hnotSubset
            intro q hqA
            by_contra hqT
            exact hnone ⟨q, hqA, hqT⟩
          exact Or.inr (Or.inl hfresh)
      · exact Or.inl (Or.inr (Or.inr hdisj1K))
    · exact Or.inl (Or.inr (Or.inl hdisj0K))
  · exact Or.inl (Or.inl hdisj01)

end Problem97
