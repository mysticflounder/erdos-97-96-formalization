import Mathlib
set_option maxRecDepth 100000
namespace Test
variable {α : Type*} [DecidableEq α]
lemma card_sum_le_of_subset_disjoint3 {e a b c : Finset α}
    (ha : a ⊆ e) (hb : b ⊆ e) (hc : c ⊆ e)
    (hab : Disjoint a b) (hac : Disjoint a c) (hbc : Disjoint b c) :
    a.card + b.card + c.card ≤ e.card := by
  have hu : (a ∪ b ∪ c).card = a.card + b.card + c.card := by
    rw [Finset.card_union_of_disjoint (by
      rw [Finset.disjoint_left]
      intro x hx hxc
      simp at hx
      rcases hx with hxa | hxb
      · exact (Finset.disjoint_left.mp hac) hxa hxc
      · exact (Finset.disjoint_left.mp hbc) hxb hxc)]
    rw [Finset.card_union_of_disjoint hab]
  have hsub : a ∪ b ∪ c ⊆ e := by
    intro x hx
    simp at hx ⊢
    rcases hx with h | h | h
    · exact ha h
    · exact hb h
    · exact hc h
  calc
    a.card + b.card + c.card = (a ∪ b ∪ c).card := hu.symm
    _ ≤ e.card := Finset.card_le_card hsub

lemma card_sum_eq_of_cover4 {e a b c d : Finset α}
    (he : e.card = 2)
    (hcover : e ⊆ a ∪ b ∪ c ∪ d)
    (ha : a ⊆ e) (hb : b ⊆ e) (hc : c ⊆ e) (hd : d ⊆ e)
    (hab : Disjoint a b) (hac : Disjoint a c) (had : Disjoint a d)
    (hbc : Disjoint b c) (hbd : Disjoint b d) (hcd : Disjoint c d) :
    e.card = a.card + b.card + c.card + d.card := by
  have hlow : a.card + b.card + c.card + d.card ≤ e.card := by
    have hu : (a ∪ b ∪ c ∪ d).card = a.card + b.card + c.card + d.card := by
      rw [Finset.card_union_of_disjoint (by
        rw [Finset.disjoint_left]
        intro x hx hxd
        simp at hx
        rcases hx with hxa | hxb | hxc
        · exact (Finset.disjoint_left.mp had) hxa hxd
        · exact (Finset.disjoint_left.mp hbd) hxb hxd
        · exact (Finset.disjoint_left.mp hcd) hxc hxd)]
      rw [Finset.card_union_of_disjoint (by
        rw [Finset.disjoint_left]
        intro x hx hxc
        simp at hx
        rcases hx with hxa | hxb
        · exact (Finset.disjoint_left.mp hac) hxa hxc
        · exact (Finset.disjoint_left.mp hbc) hxb hxc)]
      rw [Finset.card_union_of_disjoint hab]
    rw [← hu]
    exact Finset.card_le_card (by
      intro x hx
      simp at hx ⊢
      rcases hx with h | h | h | h
      · exact ha h
      · exact hb h
      · exact hc h
      · exact hd h)
  have hupp : e.card ≤ a.card + b.card + c.card + d.card := by
    calc
      e.card ≤ (a ∪ b ∪ c ∪ d).card := Finset.card_le_card hcover
      _ ≤ (a.card + b.card) + (c.card + d.card) := by
        calc
          (a ∪ b ∪ c ∪ d).card ≤ (a ∪ b ∪ c).card + d.card := Finset.card_union_le _ _
          _ ≤ ((a ∪ b).card + c.card) + d.card := by gcongr; exact Finset.card_union_le _ _
          _ ≤ (a.card + b.card + c.card) + d.card := by gcongr; exact Finset.card_union_le _ _
          _ = (a.card + b.card) + (c.card + d.card) := by omega
      _ = a.card + b.card + c.card + d.card := by omega
  omega
end Test
