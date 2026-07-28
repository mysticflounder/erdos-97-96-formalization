import Mathlib

/-!
# Finite overlap kernel for the first enlarged blocker fiber

This theorem is independent of the live P97 imports.  It isolates the exact
three-hit combinatorics after one endpoint of the original collision pair is
known to be omitted.
-/

namespace Problem97
namespace ATailFirstFiberOverlapDerivation

attribute [local instance] Classical.propDecidable

/-- If at least one of `p₁,p₂` is omitted, three hits among
`{p₁,p₂,q,o}` are equivalent to both `q,o` hits and one surviving pair hit.
The hypotheses record precisely the cross-distinctness needed to count those
three points. -/
theorem three_of_four_with_one_pair_omission_iff
    {α : Type*} [DecidableEq α]
    (K : Finset α) (p₁ p₂ q o : α)
    (hq₁ : q ≠ p₁) (hq₂ : q ≠ p₂)
    (ho₁ : o ≠ p₁) (ho₂ : o ≠ p₂) (hoq : o ≠ q)
    (homit : p₁ ∉ K ∨ p₂ ∉ K) :
    3 ≤ (K ∩ {p₁, p₂, q, o}).card ↔
      q ∈ K ∧ o ∈ K ∧ (p₁ ∈ K ∨ p₂ ∈ K) := by
  classical
  by_cases hp₁K : p₁ ∈ K <;>
    by_cases hp₂K : p₂ ∈ K <;>
      by_cases hqK : q ∈ K <;>
        by_cases hoK : o ∈ K <;>
          simp [hp₁K, hp₂K, hqK, hoK,
            hq₁.symm, hq₂.symm, ho₁.symm, ho₂.symm, hoq.symm] at homit ⊢

/-- Two four-point rows whose intersection has at most two points leave at
least two distinct points of the second row out of the first. -/
theorem exists_two_not_mem_of_card_four_inter_card_le_two
    {α : Type*} [DecidableEq α]
    (K L : Finset α)
    (hLcard : L.card = 4)
    (hinter : (K ∩ L).card ≤ 2) :
    ∃ y ∈ L, ∃ z ∈ L, y ≠ z ∧ y ∉ K ∧ z ∉ K := by
  have hsum : (L \ K).card + (L ∩ K).card = L.card :=
    Finset.card_sdiff_add_card_inter L K
  have hinter' : (L ∩ K).card ≤ 2 := by
    simpa [Finset.inter_comm] using hinter
  have htwo : 1 < (L \ K).card := by omega
  rcases Finset.one_lt_card.mp htwo with ⟨y, hy, z, hz, hyz⟩
  exact
    ⟨y, (Finset.mem_sdiff.mp hy).1,
      z, (Finset.mem_sdiff.mp hz).1,
      hyz, (Finset.mem_sdiff.mp hy).2, (Finset.mem_sdiff.mp hz).2⟩

/-- Exact finite kernel for the two anchored-pair descent.  If neither
distinguished anchor is omitted, the pair-omission hypotheses force both
partners to be omitted, and the intersection bound forces at least one
off-pair omission. -/
theorem two_anchor_hits_or_anchor_omitted
    {α : Type*} [DecidableEq α]
    (K : Finset α) (p₁ p₂ r₁ r₂ q o : α)
    (hq₁ : q ≠ p₁) (ho₁ : o ≠ p₁) (hoq : o ≠ q)
    (hinter : (K ∩ {p₁, p₂, q, o}).card ≤ 2)
    (homitP : p₁ ∉ K ∨ p₂ ∉ K)
    (homitR : r₁ ∉ K ∨ r₂ ∉ K) :
    (p₁ ∈ K ∧ p₂ ∉ K ∧ r₁ ∈ K ∧ r₂ ∉ K ∧
        (q ∉ K ∨ o ∉ K)) ∨
      p₁ ∉ K ∨ r₁ ∉ K := by
  by_cases hp₁ : p₁ ∈ K
  · by_cases hr₁ : r₁ ∈ K
    · left
      have hp₂ : p₂ ∉ K :=
        homitP.resolve_left (not_not_intro hp₁)
      have hr₂ : r₂ ∉ K :=
        homitR.resolve_left (not_not_intro hr₁)
      have hoff : q ∉ K ∨ o ∉ K := by
        by_contra hboth
        push_neg at hboth
        have hsubset :
            ({p₁, q, o} : Finset α) ⊆
              K ∩ {p₁, p₂, q, o} := by
          intro x hx
          simp only [Finset.mem_insert, Finset.mem_singleton] at hx
          rcases hx with rfl | rfl | rfl
          · exact Finset.mem_inter.mpr ⟨hp₁, by simp⟩
          · exact Finset.mem_inter.mpr ⟨hboth.1, by simp⟩
          · exact Finset.mem_inter.mpr ⟨hboth.2, by simp⟩
        have hthree : 3 ≤ (K ∩ {p₁, p₂, q, o}).card := by
          calc
            3 = ({p₁, q, o} : Finset α).card := by
              simp [hq₁.symm, ho₁.symm, hoq.symm]
            _ ≤ _ := Finset.card_le_card hsubset
        omega
      exact ⟨hp₁, hp₂, hr₁, hr₂, hoff⟩
    · exact Or.inr (Or.inr hr₁)
  · exact Or.inr (Or.inl hp₁)

end ATailFirstFiberOverlapDerivation
end Problem97
