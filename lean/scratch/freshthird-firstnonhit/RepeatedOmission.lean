import Mathlib

open scoped BigOperators

namespace Scratch

private theorem exists_repeated_mem_of_card_lt_sum
    {α β : Type*} [DecidableEq α] [DecidableEq β]
    (W : Finset α) (Q : Finset β) (O : α → Finset β)
    (hsub : ∀ z ∈ W, O z ⊆ Q)
    (hcard : Q.card < ∑ z ∈ W, (O z).card) :
    ∃ w ∈ Q, ∃ z₁ ∈ W, ∃ z₂ ∈ W,
      z₁ ≠ z₂ ∧ w ∈ O z₁ ∧ w ∈ O z₂ := by
  let I : Finset (Σ _ : α, β) := W.sigma O
  have hIcard : Q.card < I.card := by
    simpa only [I, Finset.card_sigma] using hcard
  have hmap : Set.MapsTo (fun x : Σ _ : α, β => x.2) I Q := by
    intro x hx
    have hx' := Finset.mem_sigma.mp hx
    exact hsub x.1 hx'.1 hx'.2
  obtain ⟨x, hxI, y, hyI, hxy, hproj⟩ :=
    Finset.exists_ne_map_eq_of_card_lt_of_maps_to
      (s := I) (t := Q) (f := fun x : Σ _ : α, β => x.2)
      hIcard hmap
  have hx := Finset.mem_sigma.mp hxI
  have hy := Finset.mem_sigma.mp hyI
  have hfirst : x.1 ≠ y.1 := by
    intro hfirst
    apply hxy
    cases x
    cases y
    simp only at hfirst hproj ⊢
    subst hfirst
    subst hproj
    rfl
  exact ⟨x.2, hsub x.1 hx.1 hx.2, x.1, hx.1, y.1, hy.1,
    hfirst, hx.2, hproj ▸ hy.2⟩

theorem exists_two_repeated_mem_of_four_two
    {α β : Type*} [DecidableEq α] [DecidableEq β]
    (W : Finset α) (Q : Finset β) (O : α → Finset β)
    (hW : W.card = 4) (hQ : Q.card = 4)
    (hsub : ∀ z ∈ W, O z ⊆ Q)
    (hcard : ∀ z ∈ W, 2 ≤ (O z).card) :
    ∃ w₁ ∈ Q, ∃ w₂ ∈ Q, w₁ ≠ w₂ ∧
      (∃ z₁ ∈ W, ∃ z₂ ∈ W,
        z₁ ≠ z₂ ∧ w₁ ∈ O z₁ ∧ w₁ ∈ O z₂) ∧
      (∃ z₁ ∈ W, ∃ z₂ ∈ W,
        z₁ ≠ z₂ ∧ w₂ ∈ O z₁ ∧ w₂ ∈ O z₂) := by
  have hsum : W.card * 2 ≤ ∑ z ∈ W, (O z).card := by
    simpa only [Finset.sum_const, smul_eq_mul] using
      Finset.sum_le_sum (fun z hz => hcard z hz)
  have hlt : Q.card < ∑ z ∈ W, (O z).card := by omega
  obtain ⟨w₁, hw₁Q, z₁, hz₁W, z₂, hz₂W, hzNe, hw₁z₁, hw₁z₂⟩ :=
    exists_repeated_mem_of_card_lt_sum W Q O hsub hlt
  let O' : α → Finset β := fun z => (O z).erase w₁
  have hsub' : ∀ z ∈ W, O' z ⊆ Q.erase w₁ := by
    intro z hz x hx
    have hx' := Finset.mem_erase.mp hx
    exact Finset.mem_erase.mpr ⟨hx'.1, hsub z hz hx'.2⟩
  have hcard' : ∀ z ∈ W, 1 ≤ (O' z).card := by
    intro z hz
    have hzCard := hcard z hz
    by_cases hw₁ : w₁ ∈ O z
    · simp only [O', Finset.card_erase_of_mem hw₁]
      omega
    · simp only [O', Finset.erase_eq_self.mpr hw₁]
      omega
  have hsum' : W.card ≤ ∑ z ∈ W, (O' z).card := by
    simpa only [Finset.sum_const, smul_eq_mul, mul_one] using
      Finset.sum_le_sum (fun z hz => hcard' z hz)
  have hQerase : (Q.erase w₁).card = 3 := by
    rw [Finset.card_erase_of_mem hw₁Q, hQ]
  have hlt' : (Q.erase w₁).card < ∑ z ∈ W, (O' z).card := by omega
  obtain ⟨w₂, hw₂Q, z₃, hz₃W, z₄, hz₄W, hz34Ne, hw₂z₃, hw₂z₄⟩ :=
    exists_repeated_mem_of_card_lt_sum W (Q.erase w₁) O' hsub' hlt'
  have hw₂Q' := Finset.mem_erase.mp hw₂Q
  exact ⟨w₁, hw₁Q, w₂, hw₂Q'.2, hw₂Q'.1.symm,
    ⟨z₁, hz₁W, z₂, hz₂W, hzNe, hw₁z₁, hw₁z₂⟩,
    ⟨z₃, hz₃W, z₄, hz₄W, hz34Ne,
      (Finset.mem_erase.mp hw₂z₃).2, (Finset.mem_erase.mp hw₂z₄).2⟩⟩

end Scratch
