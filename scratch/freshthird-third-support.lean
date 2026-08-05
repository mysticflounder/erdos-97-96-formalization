import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdResidual

namespace Problem97.ATailFrontierLiveClosure

theorem exists_third_support_point_of_four
    {α : Type} [DecidableEq α]
    {K : Finset α} {q₁ q₂ : α}
    (hcard : K.card = 4)
    (hne : q₁ ≠ q₂)
    (hq₁ : q₁ ∈ K) (hq₂ : q₂ ∈ K) :
    ∃ w ∈ K, w ≠ q₁ ∧ w ≠ q₂ := by
  by_contra h
  have hsub : K ⊆ ({q₁, q₂} : Finset α) := by
    intro w hw
    by_cases h1 : w = q₁
    · simp [h1]
    · have h2 : w = q₂ := by
        by_contra h2
        exact h ⟨w, hw, h1, h2⟩
      simp [h2]
  have hle : K.card ≤ ({q₁, q₂} : Finset α).card :=
    Finset.card_le_card hsub
  simp [hne] at hle
  omega

theorem exists_two_residual_support_points_of_four
    {α : Type} [DecidableEq α]
    {K : Finset α} {q₁ q₂ : α}
    (hcard : K.card = 4)
    (hne : q₁ ≠ q₂)
    (hq₁ : q₁ ∈ K) (hq₂ : q₂ ∈ K) :
    ∃ u v, u ∈ K ∧ v ∈ K ∧ u ≠ v ∧
      u ≠ q₁ ∧ u ≠ q₂ ∧ v ≠ q₁ ∧ v ≠ q₂ := by
  have hq₂' : q₂ ∈ K.erase q₁ := Finset.mem_erase.mpr ⟨hne.symm, hq₂⟩
  have hcard₁ : (K.erase q₁).card = 3 := by
    rw [Finset.card_erase_of_mem hq₁, hcard]
    omega
  let R := (K.erase q₁).erase q₂
  have hcard₂ : R.card = 2 := by
    dsimp [R]
    rw [Finset.card_erase_of_mem hq₂', hcard₁]
    omega
  rcases Finset.card_eq_two.mp hcard₂ with ⟨u, v, huv, hR⟩
  have huR : u ∈ R := by rw [hR]; simp
  have hvR : v ∈ R := by rw [hR]; simp
  have hu₂ : u ≠ q₂ := (Finset.mem_erase.mp huR).1
  have hu₁ : u ≠ q₁ := (Finset.mem_erase.mp (Finset.mem_erase.mp huR).2).1
  have hv₂ : v ≠ q₂ := (Finset.mem_erase.mp hvR).1
  have hv₁ : v ≠ q₁ := (Finset.mem_erase.mp (Finset.mem_erase.mp hvR).2).1
  have huK : u ∈ K := (Finset.mem_erase.mp (Finset.mem_erase.mp huR).2).2
  have hvK : v ∈ K := (Finset.mem_erase.mp (Finset.mem_erase.mp hvR).2).2
  exact ⟨u, v, huK, hvK, huv, hu₁, hu₂, hv₁, hv₂⟩

end Problem97.ATailFrontierLiveClosure
