import Mathlib

open scoped Classical

namespace CanonicalRowOverrideRebase

theorem exists_second_outside_two_pairs
    {α : Type*} [DecidableEq α]
    (K : Finset α) (q a b c d : α)
    (hKcard : K.card = 4)
    (hqOutside : q ∉ ({a, b, c, d} : Finset α))
    (hfirst : ¬ (a ∈ K ∧ b ∈ K))
    (hsecond : ¬ (c ∈ K ∧ d ∈ K)) :
    ∃ v ∈ K, v ≠ q ∧ v ∉ ({a, b, c, d} : Finset α) := by
  let E : Finset α := ({a, b, c, d} : Finset α)
  have hfirstCard : (K ∩ ({a, b} : Finset α)).card ≤ 1 := by
    rw [Finset.card_le_one]
    intro x hx y hy
    simp only [Finset.mem_inter, Finset.mem_insert,
      Finset.mem_singleton] at hx hy
    rcases hx.2 with rfl | rfl <;>
      rcases hy.2 with rfl | rfl
    · rfl
    · exact False.elim (hfirst ⟨hx.1, hy.1⟩)
    · exact False.elim (hfirst ⟨hy.1, hx.1⟩)
    · rfl
  have hsecondCard : (K ∩ ({c, d} : Finset α)).card ≤ 1 := by
    rw [Finset.card_le_one]
    intro x hx y hy
    simp only [Finset.mem_inter, Finset.mem_insert,
      Finset.mem_singleton] at hx hy
    rcases hx.2 with rfl | rfl <;>
      rcases hy.2 with rfl | rfl
    · rfl
    · exact False.elim (hsecond ⟨hx.1, hy.1⟩)
    · exact False.elim (hsecond ⟨hy.1, hx.1⟩)
    · rfl
  have hinterEq :
      K ∩ E =
        (K ∩ ({a, b} : Finset α)) ∪
          (K ∩ ({c, d} : Finset α)) := by
    ext x
    simp only [E, Finset.mem_inter, Finset.mem_union,
      Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hinterCard : (K ∩ E).card ≤ 2 := by
    rw [hinterEq]
    calc
      ((K ∩ {a, b}) ∪ (K ∩ {c, d})).card
          ≤ (K ∩ {a, b}).card + (K ∩ {c, d}).card :=
        Finset.card_union_le _ _
      _ ≤ 1 + 1 := Nat.add_le_add hfirstCard hsecondCard
      _ = 2 := rfl
  have hsplit := Finset.card_sdiff_add_card_inter K E
  have houtsideCard : 2 ≤ (K \ E).card := by
    rw [hKcard] at hsplit
    omega
  rcases Finset.exists_mem_ne (by omega : 1 < (K \ E).card) q with
    ⟨v, hv, hvq⟩
  exact ⟨v, (Finset.mem_sdiff.mp hv).1, hvq,
    by simpa [E] using (Finset.mem_sdiff.mp hv).2⟩

end CanonicalRowOverrideRebase
