import Mathlib

#check Finset.card_eq_four
#check Finset.card_eq_one
#check Finset.card_sdiff_of_subset
#check Finset.sdiff_union_of_subset

namespace CheckFourSupport

theorem exists_fourth_of_card_eq_four
    {α : Type*} [DecidableEq α]
    (K : Finset α) (a b c : α)
    (hcard : K.card = 4)
    (ha : a ∈ K) (hb : b ∈ K) (hc : c ∈ K)
    (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c) :
    ∃ d, d ∉ ({a, b, c} : Finset α) ∧ K = {a, b, c, d} := by
  let T : Finset α := {a, b, c}
  have hTcard : T.card = 3 := by
    simp [T, hab, hac, hbc]
  have hTsub : T ⊆ K := by
    intro x hx
    simp only [T, Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl
    · exact ha
    · exact hb
    · exact hc
  have hdiffCard : (K \ T).card = 1 := by
    rw [Finset.card_sdiff_of_subset hTsub, hcard, hTcard]
  obtain ⟨d, hd⟩ := Finset.card_eq_one.mp hdiffCard
  refine ⟨d, ?_, ?_⟩
  · have hdmem : d ∈ K \ T := by simp [hd]
    exact (Finset.mem_sdiff.mp hdmem).2
  · have hKT : K = (K \ T) ∪ T := by
      exact (Finset.sdiff_union_of_subset hTsub).symm
    rw [hKT, hd]
    ext x
    simp [T]

end CheckFourSupport
