import Mathlib

namespace ExactFourSecondRadiusScratch

open Finset

variable {α : Type*} [DecidableEq α]

theorem exact_disjoint_cap_pairs_force_cross_omission_and_two_outside
    (R₀ R₁ C : Finset α) (p₁ p₂ u v : α)
    (hp : p₁ ≠ p₂) (huv : u ≠ v)
    (hdisj : Disjoint ({p₁, p₂} : Finset α) ({u, v} : Finset α))
    (hR₀cap : R₀ ∩ C = {p₁, p₂})
    (hR₁cap : R₁ ∩ C = {u, v})
    (hR₀card : R₀.card = 4) (hR₁card : R₁.card = 4) :
    (u ∉ R₀ ∧ v ∉ R₀ ∧ p₁ ∉ R₁ ∧ p₂ ∉ R₁) ∧
      (R₀ \ C).card = 2 ∧ (R₁ \ C).card = 2 := by
  have hpair₀card : ({p₁, p₂} : Finset α).card = 2 := by simp [hp]
  have hpair₁card : ({u, v} : Finset α).card = 2 := by simp [huv]
  have huC : u ∈ C := by
    have : u ∈ R₁ ∩ C := by rw [hR₁cap]; simp
    exact (Finset.mem_inter.mp this).2
  have hvC : v ∈ C := by
    have : v ∈ R₁ ∩ C := by rw [hR₁cap]; simp
    exact (Finset.mem_inter.mp this).2
  have hp₁C : p₁ ∈ C := by
    have : p₁ ∈ R₀ ∩ C := by rw [hR₀cap]; simp
    exact (Finset.mem_inter.mp this).2
  have hp₂C : p₂ ∈ C := by
    have : p₂ ∈ R₀ ∩ C := by rw [hR₀cap]; simp
    exact (Finset.mem_inter.mp this).2
  have huR₀ : u ∉ R₀ := by
    intro hu
    have hupair₀ : u ∈ ({p₁, p₂} : Finset α) := by
      rw [← hR₀cap]
      exact Finset.mem_inter.mpr ⟨hu, huC⟩
    exact Finset.disjoint_left.mp hdisj hupair₀ (by simp)
  have hvR₀ : v ∉ R₀ := by
    intro hv
    have hvpair₀ : v ∈ ({p₁, p₂} : Finset α) := by
      rw [← hR₀cap]
      exact Finset.mem_inter.mpr ⟨hv, hvC⟩
    exact Finset.disjoint_left.mp hdisj hvpair₀ (by simp)
  have hp₁R₁ : p₁ ∉ R₁ := by
    intro hp₁
    have hp₁pair₁ : p₁ ∈ ({u, v} : Finset α) := by
      rw [← hR₁cap]
      exact Finset.mem_inter.mpr ⟨hp₁, hp₁C⟩
    exact Finset.disjoint_left.mp hdisj (by simp) hp₁pair₁
  have hp₂R₁ : p₂ ∉ R₁ := by
    intro hp₂
    have hp₂pair₁ : p₂ ∈ ({u, v} : Finset α) := by
      rw [← hR₁cap]
      exact Finset.mem_inter.mpr ⟨hp₂, hp₂C⟩
    exact Finset.disjoint_left.mp hdisj (by simp) hp₂pair₁
  have hR₀interCard : (R₀ ∩ C).card = 2 := by
    rw [hR₀cap, hpair₀card]
  have hR₁interCard : (R₁ ∩ C).card = 2 := by
    rw [hR₁cap, hpair₁card]
  have hR₀outside : (R₀ \ C).card = 2 := by
    have hpartition := Finset.card_sdiff_add_card_inter R₀ C
    omega
  have hR₁outside : (R₁ \ C).card = 2 := by
    have hpartition := Finset.card_sdiff_add_card_inter R₁ C
    omega
  exact
    ⟨⟨huR₀, hvR₀, hp₁R₁, hp₂R₁⟩,
      hR₀outside, hR₁outside⟩

theorem six_interior_or_cross_blocker_coincidence
    (I : Finset α) (p₁ p₂ u v b₀ b₁ : α)
    (hp : p₁ ≠ p₂) (huv : u ≠ v)
    (hdisj : Disjoint ({p₁, p₂} : Finset α) ({u, v} : Finset α))
    (hb₀b₁ : b₀ ≠ b₁)
    (hb₀p₁ : b₀ ≠ p₁) (hb₀p₂ : b₀ ≠ p₂)
    (hb₁u : b₁ ≠ u) (hb₁v : b₁ ≠ v)
    (hp₁I : p₁ ∈ I) (hp₂I : p₂ ∈ I)
    (huI : u ∈ I) (hvI : v ∈ I)
    (hb₀I : b₀ ∈ I) (hb₁I : b₁ ∈ I) :
    6 ≤ I.card ∨ b₀ = u ∨ b₀ = v ∨ b₁ = p₁ ∨ b₁ = p₂ := by
  by_cases hb₀u : b₀ = u
  · exact Or.inr (Or.inl hb₀u)
  by_cases hb₀v : b₀ = v
  · exact Or.inr (Or.inr (Or.inl hb₀v))
  by_cases hb₁p₁ : b₁ = p₁
  · exact Or.inr (Or.inr (Or.inr (Or.inl hb₁p₁)))
  by_cases hb₁p₂ : b₁ = p₂
  · exact Or.inr (Or.inr (Or.inr (Or.inr hb₁p₂)))
  left
  let S : Finset α := {p₁, p₂} ∪ {u, v}
  have hScard : S.card = 4 := by
    dsimp [S]
    rw [Finset.card_union_of_disjoint hdisj]
    simp [hp, huv]
  have hb₀S : b₀ ∉ S := by
    simp [S, hb₀p₁, hb₀p₂, hb₀u, hb₀v]
  have hb₁insert : b₁ ∉ insert b₀ S := by
    simp [S, hb₀b₁.symm, hb₁p₁, hb₁p₂, hb₁u, hb₁v]
  have hpacketCard : (insert b₁ (insert b₀ S)).card = 6 := by
    simp [hb₁insert, hb₀S, hScard]
  have hpacketSubset : insert b₁ (insert b₀ S) ⊆ I := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact hb₁I
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact hb₀I
    rcases Finset.mem_union.mp hx with hx | hx
    · rcases Finset.mem_insert.mp hx with rfl | hx
      · exact hp₁I
      have : x = p₂ := Finset.mem_singleton.mp hx
      simpa [this] using hp₂I
    · rcases Finset.mem_insert.mp hx with rfl | hx
      · exact huI
      have : x = v := Finset.mem_singleton.mp hx
      simpa [this] using hvI
  calc
    6 = (insert b₁ (insert b₀ S)).card := hpacketCard.symm
    _ ≤ I.card := Finset.card_le_card hpacketSubset

theorem four_interior_forces_both_cross_blocker_coincidences
    (I : Finset α) (p₁ p₂ u v b₀ b₁ : α)
    (hp : p₁ ≠ p₂) (huv : u ≠ v)
    (hdisj : Disjoint ({p₁, p₂} : Finset α) ({u, v} : Finset α))
    (hb₀p₁ : b₀ ≠ p₁) (hb₀p₂ : b₀ ≠ p₂)
    (hb₁u : b₁ ≠ u) (hb₁v : b₁ ≠ v)
    (hp₁I : p₁ ∈ I) (hp₂I : p₂ ∈ I)
    (huI : u ∈ I) (hvI : v ∈ I)
    (hb₀I : b₀ ∈ I) (hb₁I : b₁ ∈ I)
    (hIcard : I.card = 4) :
    (b₀ = u ∨ b₀ = v) ∧ (b₁ = p₁ ∨ b₁ = p₂) := by
  let S : Finset α := {p₁, p₂} ∪ {u, v}
  have hScard : S.card = 4 := by
    dsimp [S]
    rw [Finset.card_union_of_disjoint hdisj]
    simp [hp, huv]
  have hSI : S ⊆ I := by
    intro x hx
    rcases Finset.mem_union.mp hx with hx | hx
    · rcases Finset.mem_insert.mp hx with rfl | hx
      · exact hp₁I
      have : x = p₂ := Finset.mem_singleton.mp hx
      simpa [this] using hp₂I
    · rcases Finset.mem_insert.mp hx with rfl | hx
      · exact huI
      have : x = v := Finset.mem_singleton.mp hx
      simpa [this] using hvI
  have hSIeq : S = I :=
    Finset.eq_of_subset_of_card_le hSI (by omega)
  have hb₀S : b₀ ∈ S := by rw [hSIeq]; exact hb₀I
  have hb₁S : b₁ ∈ S := by rw [hSIeq]; exact hb₁I
  constructor
  · rcases Finset.mem_union.mp hb₀S with hb₀pair | hb₀pair
    · rcases Finset.mem_insert.mp hb₀pair with h | h
      · exact False.elim (hb₀p₁ h)
      · exact False.elim (hb₀p₂ (Finset.mem_singleton.mp h))
    · rcases Finset.mem_insert.mp hb₀pair with h | h
      · exact Or.inl h
      · exact Or.inr (Finset.mem_singleton.mp h)
  · rcases Finset.mem_union.mp hb₁S with hb₁pair | hb₁pair
    · rcases Finset.mem_insert.mp hb₁pair with h | h
      · exact Or.inl h
      · exact Or.inr (Finset.mem_singleton.mp h)
    · rcases Finset.mem_insert.mp hb₁pair with h | h
      · exact False.elim (hb₁u h)
      · exact False.elim (hb₁v (Finset.mem_singleton.mp h))

theorem four_interior_forces_blocker_two_cycle
    (f : α → α) (I : Finset α) (p₁ p₂ u v b₀ b₁ : α)
    (hp : p₁ ≠ p₂) (huv : u ≠ v)
    (hdisj : Disjoint ({p₁, p₂} : Finset α) ({u, v} : Finset α))
    (hb₀p₁ : b₀ ≠ p₁) (hb₀p₂ : b₀ ≠ p₂)
    (hb₁u : b₁ ≠ u) (hb₁v : b₁ ≠ v)
    (hp₁I : p₁ ∈ I) (hp₂I : p₂ ∈ I)
    (huI : u ∈ I) (hvI : v ∈ I)
    (hb₀I : b₀ ∈ I) (hb₁I : b₁ ∈ I)
    (hIcard : I.card = 4)
    (hfp₁ : f p₁ = b₀) (hfp₂ : f p₂ = b₀)
    (hfu : f u = b₁) (hfv : f v = b₁) :
    ∃ x ∈ ({p₁, p₂} : Finset α),
      ∃ y ∈ ({u, v} : Finset α), f x = y ∧ f y = x := by
  rcases four_interior_forces_both_cross_blocker_coincidences
      I p₁ p₂ u v b₀ b₁ hp huv hdisj
      hb₀p₁ hb₀p₂ hb₁u hb₁v
      hp₁I hp₂I huI hvI hb₀I hb₁I hIcard with
    ⟨hb₀u | hb₀v, hb₁p₁ | hb₁p₂⟩
  · exact
      ⟨p₁, by simp, u, by simp,
        hfp₁.trans hb₀u, hfu.trans hb₁p₁⟩
  · exact
      ⟨p₂, by simp, u, by simp,
        hfp₂.trans hb₀u, hfu.trans hb₁p₂⟩
  · exact
      ⟨p₁, by simp, v, by simp,
        hfp₁.trans hb₀v, hfv.trans hb₁p₁⟩
  · exact
      ⟨p₂, by simp, v, by simp,
        hfp₂.trans hb₀v, hfv.trans hb₁p₂⟩

end ExactFourSecondRadiusScratch
